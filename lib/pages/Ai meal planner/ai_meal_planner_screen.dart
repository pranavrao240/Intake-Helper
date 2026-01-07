import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/openAi_provider.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/ai_bubble.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/chat_input_bar.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/user_bubble.dart';
import 'package:intake_helper/theme/app_theme.dart';
import 'package:intake_helper/utils/message_type.dart';

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
}

class AiMealPlannerScreen extends HookConsumerWidget {
  const AiMealPlannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptController = useTextEditingController();
    final messages = useState<List<ChatMessage>>([]);

    final isGenerating = useState(false);

    Future<void> showMealPlanDialog(List<MealInfo> mealInfos) async {
      final selectedMeals = await showDialog<List<MealInfo>>(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              final selected = <MealInfo>[];

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
                      final isSelected = selected.contains(info);

                      return GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              if (isSelected) {
                                selected.remove(info);
                              } else {
                                selected.add(info);
                              }
                            },
                          );
                        },
                        child: SelectableMealCard(
                          mealInfo: info,
                          isSelected: isSelected,
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
      final mealInfos = <MealInfo>[];
      final lines = response.split('\n');
      String currentMealType = '';

      for (final line in lines) {
        if (line.contains('Breakfast:')) currentMealType = 'Breakfast';
        if (line.contains('Lunch:')) currentMealType = 'Lunch';
        if (line.contains('Dinner:')) currentMealType = 'Dinner';
        if (line.contains('Snacks:')) currentMealType = 'Snacks';

        if (line.contains(':') && currentMealType.isNotEmpty) {
          final parts = line.split(':');
          final name = parts.sublist(1).join(':').trim();

          // Basic parsing for nutritional info - this can be improved
          double calories = 0, protein = 0, carbs = 0;
          final calRegex = RegExp(r'Calories: (\d+)');
          final proRegex = RegExp(r'Protein: (\d+)g');
          final carbRegex = RegExp(r'Carbs: (\d+)g');

          if (calRegex.hasMatch(response)) {
            calories = double.parse(calRegex.firstMatch(response)!.group(1)!);
          }
          if (proRegex.hasMatch(response)) {
            protein = double.parse(proRegex.firstMatch(response)!.group(1)!);
          }
          if (carbRegex.hasMatch(response)) {
            carbs = double.parse(carbRegex.firstMatch(response)!.group(1)!);
          }

          mealInfos.add(MealInfo(
            name: name,
            mealType: currentMealType,
            calories: calories,
            protein: protein,
            carbs: carbs,
          ));
        }
      }
      showMealPlanDialog(mealInfos);
    }

    Future<void> sendMessage() async {
      if (promptController.text.trim().isEmpty) return;

      final userMessage = ChatMessage(promptController.text, MessageType.user);
      messages.value = [...messages.value, userMessage];
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
      messages.value = [...messages.value, aiResponse];
      isGenerating.value = false;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('AI Meal Planner',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.value.length,
              itemBuilder: (context, index) {
                final msg = messages.value[index];
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
                        onSave: (response) => parseAndShowMealPlan(response),
                      );
              },
            ),
          ),
          if (isGenerating.value)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          ChatInputBar(
            controller: promptController,
            onSend: sendMessage,
          ),
        ],
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
