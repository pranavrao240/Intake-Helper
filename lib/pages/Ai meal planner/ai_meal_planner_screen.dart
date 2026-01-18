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
  final double calories;
  final double protein;
  final double carbs;

  MealInfo({
    required this.name,
    required this.mealType,
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
                      final addedId = preferences.getString('addedId');
                      if (selected.isEmpty) {
                        debugPrint('No meals selected');
                      } else {
                        for (final meal in selected) {
                          await ApiService()
                              .addNutrition(
                                  name: meal.name,
                                  protein: meal.protein,
                                  carbs: meal.carbs,
                                  calories: meal.calories)
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

                      Navigator.pop(context, selected);
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
      double protein = 0.0;
      double calories = 0.0;
      double carbs = 0.0;

      void saveCurrentMeal() {
        if (mealName.isNotEmpty && mealType.isNotEmpty) {
          mealInfos.add(
            MealInfo(
              name: mealName,
              mealType: mealType,
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

        // 🔹 New meal starts → save previous
        if (trimmed.startsWith('Meal Name:')) {
          saveCurrentMeal();

          // Reset for next meal
          mealName = trimmed.replaceFirst('Meal Name:', '').trim();
          mealType = '';
          protein = 0.0;
          calories = 0.0;
          carbs = 0.0;
        } else if (trimmed.startsWith('Meal Type:')) {
          mealType = trimmed.replaceFirst('Meal Type:', '').trim();
        } else if (trimmed.startsWith('Protein:')) {
          protein = double.tryParse(
                trimmed.replaceFirst('Protein:', '').trim(),
              ) ??
              0.0;
        } else if (trimmed.startsWith('Calories:')) {
          calories = double.tryParse(
                trimmed.replaceFirst('Calories:', '').trim(),
              ) ??
              0.0;
        } else if (trimmed.startsWith('Carbs:')) {
          carbs = double.tryParse(
                trimmed.replaceFirst('Carbs:', '').trim(),
              ) ??
              0.0;
        }
      }

      // ✅ Save last meal
      saveCurrentMeal();

      if (mealInfos.isEmpty) return;

      showMealPlanDialog(mealInfos);
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
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: AppTheme.primaryGreen, width: 2)
            : null,
      ),
      child: ListTile(
        title: Text(
          mealInfo.name,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${mealInfo.mealType}\n'
          'Calories: ${mealInfo.calories.toInt()} \u2022 Protein: ${mealInfo.protein.toInt()}g \u2022 Carbs: ${mealInfo.carbs.toInt()}g',
          style: const TextStyle(color: Color(0xFF00FFAA), fontSize: 13),
        ),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: AppTheme.primaryGreen)
            : const Icon(Icons.circle_outlined, color: Colors.grey),
      ),
    );
  }
}
