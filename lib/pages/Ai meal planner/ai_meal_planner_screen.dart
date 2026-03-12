import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/openAi_provider.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/chat_input_bar.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/empty_state_view.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/meal_info.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/meal_plan_dialog.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/typing_indicator.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/ai_bubble.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/user_bubble.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/utils/message_type.dart';
import 'package:intake_helper/widgets/top_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatMessagesNotifier extends StateNotifier<List<ChatMessage>> {
  ChatMessagesNotifier() : super([]);

  void addMessage(ChatMessage message) => state = [...state, message];
}

final chatMessagesProvider =
    StateNotifierProvider<ChatMessagesNotifier, List<ChatMessage>>(
  (ref) => ChatMessagesNotifier(),
);

class AiMealPlannerScreen extends HookConsumerWidget {
  const AiMealPlannerScreen({super.key});

  static List<MealInfo> _parseResponse(String response) {
    final mealInfos = <MealInfo>[];
    String mealName = '';
    String mealImage = '';
    String mealType = '';
    String quantity = '';
    double protein = 0, calories = 0, carbs = 0;
    String? pendingField;
    bool isReadingQuantity = false;
    bool isReadingNutrition = false;
    bool isReadingImage = false;

    void saveCurrentMeal() {
      if (mealName.isNotEmpty && mealType.isNotEmpty) {
        mealInfos.add(MealInfo(
          name: mealName.trim(),
          mealImage: mealImage.trim(),
          mealType: mealType.trim(),
          quantity: quantity.trim(),
          calories: calories,
          protein: protein,
          carbs: carbs,
        ));
      }
    }

    for (final raw in response.split('\n')) {
      final line = raw.trim();
      if (line.isEmpty) continue;

      if (line.toLowerCase().contains('meal image') && line.endsWith(':')) {
        isReadingImage = true;
        isReadingQuantity = false;
        isReadingNutrition = false;
        pendingField = null;
        continue;
      }

      if (isReadingImage && line.startsWith('![')) {
        final urlMatch = RegExp(r'\!\[.*?\]\((.*?)\)').firstMatch(line);
        if (urlMatch != null) {
          mealImage = urlMatch.group(1) ?? '';
          print('mealimage : $mealImage');
        }
        isReadingImage = false;
        continue;
      }

      if (line.startsWith('Meal Name:')) {
        saveCurrentMeal();
        mealName = line.replaceFirst('Meal Name:', '').trim();
        pendingField = mealName.isEmpty ? 'name' : null;
        mealImage = '';
        mealType = '';
        quantity = '';
        protein = 0;
        calories = 0;
        carbs = 0;
        isReadingQuantity = false;
        isReadingNutrition = false;
        isReadingImage = false;
      } else if (line.startsWith('Meal Type:')) {
        isReadingImage = false;
        mealType = line.replaceFirst('Meal Type:', '').trim();
        pendingField = mealType.isEmpty ? 'type' : null;
      } else if (line.startsWith('Quantity:')) {
        quantity = '';
        isReadingQuantity = true;
        isReadingNutrition = false;
        isReadingImage = false;
        pendingField = null;
      } else if (line.startsWith('Steps:')) {
        isReadingQuantity = false;
        isReadingImage = false;
        pendingField = null;
      } else if (line.startsWith('Nutrition:')) {
        isReadingNutrition = true;
        isReadingQuantity = false;
        isReadingImage = false;
        pendingField = null;
      } else if (pendingField == 'name') {
        mealName = line;
        pendingField = null;
      } else if (pendingField == 'type') {
        mealType = line;
        pendingField = null;
      } else if (isReadingQuantity) {
        quantity += '$line\n';
      } else if (isReadingNutrition) {
        if (line.startsWith('Protein:')) {
          protein =
              double.tryParse(line.replaceFirst('Protein:', '').trim()) ?? 0;
        } else if (line.startsWith('Calories:')) {
          calories =
              double.tryParse(line.replaceFirst('Calories:', '').trim()) ?? 0;
        } else if (line.startsWith('Carbs:')) {
          carbs = double.tryParse(line.replaceFirst('Carbs:', '').trim()) ?? 0;
        }
      }
    }

    saveCurrentMeal();
    return mealInfos;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptController = useTextEditingController();
    final scrollController = useScrollController();
    final messages = ref.watch(chatMessagesProvider);
    final isGenerating = useState(false);
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = useState(bottomInsets > 0);

    // Redirect listener
    ref.listen(apiServiceProvider, (prev, next) {
      if (next.value?.redirect?.isNotEmpty ?? false) {
        context.push(next.value?.redirect ?? '');
      }
    });

    useEffect(() {
      if (messages.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOut,
            );
          }
        });
      }
      return null;
    }, [messages.length]);

    Future<void> showMealPlanDialog(List<MealInfo> mealInfos) async {
      final selected = await showDialog<List<MealInfo>>(
        context: context,
        builder: (_) => MealPlanDialog(mealInfos: mealInfos),
      );

      if (selected == null || selected.isEmpty) return;

      final preferences = await SharedPreferences.getInstance();

      for (final meal in selected) {
        await ApiService()
            .addNutrition(
                name: meal.name,
                protein: meal.protein,
                carbs: meal.carbs,
                calories: meal.calories,
                quantity: meal.quantity,
                mealImage: meal.mealImage)
            .then((_) async {
          final addedId = preferences.getString('addedId');
          if (addedId != null && context.mounted) {
            context.pushNamed(
              RouteConstants.mealDetails.name,
              pathParameters: {'id': addedId},
            );
          }
          await ref.read(apiServiceProvider.notifier).getNutritions();
        });
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${selected.length} meal(s) saved!'),
            backgroundColor: const Color(0xFF00E599),
          ),
        );
      }
    }

    Future<void> sendMessage() async {
      final text = promptController.text.trim();
      print('User message: $text');
      if (text.isEmpty) return;

      ref
          .read(chatMessagesProvider.notifier)
          .addMessage(ChatMessage(text, MessageType.user));

      isGenerating.value = true;
      promptController.clear();

      final openAiService = await ref.read(openAiProvider.notifier);
      await openAiService.postOpenAiResponse(prompt: text);

      final openAiState = ref.read(openAiProvider);
      final aiText = openAiState.maybeWhen(
        orElse: () => 'Sorry, I could not generate a meal plan.',
        data: (data) => data.openAiModel!.output.first.content.first.text,
      );

      ref
          .read(chatMessagesProvider.notifier)
          .addMessage(ChatMessage(aiText, MessageType.ai));

      isGenerating.value = false;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF000000),
      appBar: customAppbar(title: '✨ AI Meal Planner', context),
      body: Stack(
        children: [
          // Top-right green glow
          Positioned(
            top: -160,
            right: -160,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF00E599).withOpacity(0.10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00E599).withOpacity(0.10),
                    blurRadius: 120,
                    spreadRadius: 120,
                  ),
                ],
              ),
            ),
          ),

          // Bottom-left blue glow
          Positioned(
            bottom: -160,
            left: -160,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF3B82F6).withOpacity(0.10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3B82F6).withOpacity(0.10),
                    blurRadius: 100,
                    spreadRadius: 100,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: messages.isEmpty
                    ? const EmptyStateView()
                    : ListView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final msg = messages[index];
                          return msg.type == MessageType.user
                              ? userBubble(
                                  msg.text,
                                  onEdit: () =>
                                      promptController.text = msg.text,
                                )
                              : aiBubble(
                                  msg.text,
                                  context,
                                  onSave: (response) {
                                    final meals = _parseResponse(response);
                                    if (meals.isNotEmpty) {
                                      showMealPlanDialog(meals);
                                    } else {
                                      debugPrint(
                                          '❌ No meals parsed from AI response');
                                    }
                                  },
                                );
                        },
                      ),
              ),
              if (isGenerating.value) const TypingIndicator(),
              Positioned(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: isKeyboardOpen.value ? bottomInsets : 0,
                  ),
                  child: ChatInputBar(
                    controller: promptController,
                    onSend: sendMessage,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
