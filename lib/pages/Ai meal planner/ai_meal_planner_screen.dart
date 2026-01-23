import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/openAi_provider.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/ai_bubble.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/chat_input_bar.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/user_bubble.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/theme/app_theme.dart';
import 'package:intake_helper/utils/message_type.dart';
import 'package:intake_helper/widgets/top_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Holds the state of the chat messages
class ChatMessagesNotifier extends StateNotifier<List<ChatMessage>> {
  ChatMessagesNotifier() : super([]);

  void addMessage(ChatMessage message) {
    state = [...state, message];
  }
}

// Provides the ChatMessagesNotifier to the widget tree
final chatMessagesProvider =
    StateNotifierProvider<ChatMessagesNotifier, List<ChatMessage>>((ref) {
  return ChatMessagesNotifier();
});

class MealInfo {
  final String name;
  final String mealType;
  final String quantity;
  final double calories;
  final double protein;
  final double carbs;

  MealInfo({
    required this.name,
    required this.mealType,
    required this.quantity,
    required this.calories,
    required this.protein,
    required this.carbs,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealInfo && name == other.name && mealType == other.mealType;

  @override
  int get hashCode => name.hashCode ^ mealType.hashCode;
}

class AiMealPlannerScreen extends HookConsumerWidget {
  const AiMealPlannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptController = useTextEditingController();
    final messages = ref.watch(chatMessagesProvider);

    final isGenerating = useState(false);

    ref.listen(apiServiceProvider, (prev, next) {
      if (next.value?.redirect?.isNotEmpty ?? false) {
        context.push(next.value?.redirect ?? '');
      }
    });

    Future<void> showMealPlanDialog(List<MealInfo> mealInfos) async {
      final selected = <MealInfo>[];
      final selectedMeals = await showDialog<List<MealInfo>>(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                backgroundColor: const Color(0xFF1E1E1E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: const Text(
                  'Select Meals to Save',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: mealInfos.map((info) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selected.contains(info)) {
                              selected.remove(info);
                            } else {
                              selected.add(info);
                            }
                          });
                        },
                        child: SelectableMealCard(
                          mealInfo: info,
                          isSelected: selected.contains(info),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Close',
                      style: TextStyle(color: AppTheme.primaryGreen),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final preferences = await SharedPreferences.getInstance();
                      if (selected.isEmpty) {
                        debugPrint('No meals selected');
                      } else {
                        for (final meal in selected) {
                          await ApiService()
                              .addNutrition(
                            name: meal.name,
                            protein: meal.protein,
                            carbs: meal.carbs,
                            calories: meal.calories,
                            quantity: meal.quantity,
                          )
                              .then((value) async {
                            final addedId = preferences.getString('addedId');

                            if (addedId != null) {
                              context.pushNamed(
                                RouteConstants.mealDetails.name,
                                pathParameters: {
                                  'id': addedId.toString(),
                                },
                              );
                            }
                            await ref
                                .read(apiServiceProvider.notifier)
                                .getNutritions();
                          });
                        }
                      }

                      // Navigator.pop(context, selected);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryGreen,
                    ),
                    child: const Text('Save Selected'),
                  ),
                ],
              );
            },
          );
        },
      );

      if (selectedMeals != null && selectedMeals.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${selectedMeals.length} meals saved!'),
            backgroundColor: AppTheme.primaryGreen,
          ),
        );
      }
    }

    void parseAndShowMealPlan(String response) {
      final List<MealInfo> mealInfos = [];

      String mealName = '';
      String mealType = '';
      String quantity = '';
      double protein = 0.0;
      double calories = 0.0;
      double carbs = 0.0;

      bool isReadingQuantity = false;
      bool isReadingNutrition = false;

      void saveCurrentMeal() {
        if (mealName.isNotEmpty && mealType.isNotEmpty) {
          mealInfos.add(
            MealInfo(
              name: mealName,
              mealType: mealType,
              quantity: quantity.trim(),
              calories: calories,
              protein: protein,
              carbs: carbs,
            ),
          );
        }
      }

      final lines = response.split('\n');

      for (final line in lines) {
        final trimmed = line.trim();

        if (trimmed.startsWith('Meal Name:')) {
          saveCurrentMeal();

          mealName = trimmed.replaceFirst('Meal Name:', '').trim();
          mealType = '';
          quantity = '';
          protein = 0;
          calories = 0;
          carbs = 0;
          isReadingQuantity = false;
          isReadingNutrition = false;
        } else if (trimmed.startsWith('Meal Type:')) {
          mealType = trimmed.replaceFirst('Meal Type:', '').trim();
        } else if (trimmed.startsWith('Quantity:')) {
          isReadingQuantity = true;
          isReadingNutrition = false;
          quantity = '';
        } else if (trimmed.startsWith('Steps:')) {
          isReadingQuantity = false;
        } else if (trimmed.startsWith('Nutrition:')) {
          isReadingNutrition = true;
          isReadingQuantity = false;
        } else if (isReadingQuantity && trimmed.isNotEmpty) {
          quantity += '$trimmed\n';
        } else if (isReadingNutrition) {
          if (trimmed.startsWith('Protein:')) {
            protein = double.tryParse(
                  trimmed.replaceFirst('Protein:', '').trim(),
                ) ??
                0;
          } else if (trimmed.startsWith('Calories:')) {
            calories = double.tryParse(
                  trimmed.replaceFirst('Calories:', '').trim(),
                ) ??
                0;
          } else if (trimmed.startsWith('Carbs:')) {
            carbs = double.tryParse(
                  trimmed.replaceFirst('Carbs:', '').trim(),
                ) ??
                0;
          }
        }
      }

      saveCurrentMeal();

      if (mealInfos.isNotEmpty) {
        showMealPlanDialog(mealInfos);
      }
    }

    Future<void> sendMessage() async {
      if (promptController.text.trim().isEmpty) return;

      final userMessage = ChatMessage(promptController.text, MessageType.user);
      ref.read(chatMessagesProvider.notifier).addMessage(userMessage);
      isGenerating.value = true;

      final openAiService = await ref.read(openAiProvider.notifier);
      await openAiService.postOpenAiResponse(
        prompt: promptController.text,
      );

      promptController.clear();

      final openAiState = ref.watch(openAiProvider);
      final aiResponseText = openAiState.maybeWhen(
        orElse: () => 'Sorry, I could not generate a meal plan.',
        data: (data) => data.openAiModel!.output.first.content.first.text,
      );

      final aiResponse = ChatMessage(aiResponseText, MessageType.ai);
      ref.read(chatMessagesProvider.notifier).addMessage(aiResponse);
      isGenerating.value = false;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF121212),
      appBar: customAppbar(title: 'AI Meal Planner', context),
      body: messages.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'BUILD YOUR PERFECT',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'MEAL PLAN 🥗',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      return msg.type == MessageType.user
                          ? userBubble(
                              msg.text,
                              onEdit: () {
                                promptController.text = msg.text;
                              },
                            )
                          : aiBubble(
                              msg.text,
                              context,
                              onSave: (response) =>
                                  parseAndShowMealPlan(response),
                            );
                    },
                  ),
                ),
                if (isGenerating.value)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // 👈 KEY LINE
          ),
          child: ChatInputBar(
            controller: promptController,
            onSend: sendMessage,
          ),
        ),
      ),
    );
  }
}

class SelectableMealCard extends HookConsumerWidget {
  final MealInfo mealInfo;
  final bool isSelected;

  const SelectableMealCard({
    super.key,
    required this.mealInfo,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(14),
        border: isSelected
            ? Border.all(color: AppTheme.primaryGreen, width: 2)
            : Border.all(color: Colors.white12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Meal Name
                Text(
                  mealInfo.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 4),

                // Meal Type
                Text(
                  mealInfo.mealType,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 6),

                // Quantity
                Text(
                  mealInfo.quantity,
                  style: const TextStyle(
                    color: Color(0xFFB0B0B0),
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 10),

                // Nutrition Row
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: [
                    _nutritionChip(
                      'Calories',
                      '${mealInfo.calories.toStringAsFixed(0)} kcal',
                    ),
                    _nutritionChip(
                      'Protein',
                      '${mealInfo.protein.toStringAsFixed(1)} g',
                    ),
                    _nutritionChip(
                      'Carbs',
                      '${mealInfo.carbs.toStringAsFixed(1)} g',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Selection Icon
          Icon(
            isSelected ? Icons.check_circle : Icons.circle_outlined,
            color: isSelected ? AppTheme.primaryGreen : Colors.grey,
            size: 22,
          ),
        ],
      ),
    );
  }
}

Widget _nutritionChip(String label, String value) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    decoration: BoxDecoration(
      color: const Color(0xFF1F1F1F),
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: Colors.white12),
    ),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label\n',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: AppTheme.primaryGreen,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
