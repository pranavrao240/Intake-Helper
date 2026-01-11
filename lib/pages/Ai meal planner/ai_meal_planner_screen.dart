import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/openAi_provider.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/ai_bubble.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/chat_input_bar.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/user_bubble.dart';
import 'package:intake_helper/theme/app_theme.dart';
import 'package:intake_helper/utils/message_type.dart';

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
    this.calories = 0,
    this.protein = 0,
    this.carbs = 0,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MealInfo &&
        other.name == name &&
        other.mealType == mealType;
  }

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
                    onPressed: () {
                      print("Selected meals: ${selected.map((e) => {
                            'name': e.name,
                            'mealType': e.mealType,
                            'calories': e.calories,
                            'protein': e.protein,
                            'carbs': e.carbs
                          }).join(', ')}");

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
      String mealName = '';
      String mealType = '';
      double protein = 0.0;
      double calories = 0.0;
      double carbs = 0.0;

      final lines = response.split('\n');

      for (final line in lines) {
        final trimmed = line.trim();

        // Meal name
        if (trimmed.startsWith('Meal Name:')) {
          mealName = trimmed.replaceFirst('Meal Name:', '').trim();
        }

        // Meal type
        else if (trimmed.startsWith('Meal Type:')) {
          mealType = trimmed.replaceFirst('Meal Type:', '').trim();
        }

        // Nutrition values
        else if (trimmed.startsWith('Protein:')) {
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

      // Safety check
      if (mealName.isEmpty || mealType.isEmpty) return;

      final mealInfos = [
        MealInfo(
          name: mealName,
          mealType: mealType,
          calories: calories,
          protein: protein,
          carbs: carbs,
        )
      ];

      showMealPlanDialog(mealInfos);
    }

    Future<void> sendMessage() async {
      if (promptController.text.trim().isEmpty) return;

      final userMessage = ChatMessage(promptController.text, MessageType.user);
      ref.read(chatMessagesProvider.notifier).addMessage(userMessage);
      isGenerating.value = true;

      final openAiService = ref.read(openAiProvider.notifier);
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('AI Meal Planner',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: messages.isEmpty
          ? const Center(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '💪 Build Your Perfect',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                    ),
                    Text(
                      '  Meal Plan 🥗',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
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
