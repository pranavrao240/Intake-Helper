import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/router.dart';

class OnboardingTutorialService {
  // Global keys for the coach marks
  static final GlobalKey homeMacrosKey = GlobalKey();
  static final GlobalKey homeAiPlannerKey = GlobalKey();

  static final GlobalKey aiSearchFieldKey = GlobalKey();
  static final GlobalKey aiSendButtonKey = GlobalKey();

  static final GlobalKey drawerNewChatKey = GlobalKey();
  static final GlobalKey drawerHistoryKey = GlobalKey();
  static final GlobalKey drawerClearHistoryKey = GlobalKey();

  static final GlobalKey todoFabKey = GlobalKey();

  static final GlobalKey nutritionFirstMealKey = GlobalKey();

  static final GlobalKey detailsFavoriteKey = GlobalKey();
  static final GlobalKey detailsMealTypeKey = GlobalKey();
  static final GlobalKey detailsQuantityKey = GlobalKey();
  static final GlobalKey detailsAddMealKey = GlobalKey();

  static final GlobalKey dialogTimeKey = GlobalKey();
  static final GlobalKey dialogDaysKey = GlobalKey();
  static final GlobalKey dialogAddKey = GlobalKey();

  static final GlobalKey todoAddedMealKey = GlobalKey();

  // SharedPreferences keys
  static const String _stepKey = 'onboarding_tutorial_step';

  // Get current tutorial step
  static Future<String> getStep() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_stepKey) ?? 'home';
  }

  // Set tutorial step
  static Future<void> setStep(String step) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_stepKey, step);
  }

  // Skip / Complete tutorial entirely
  static void skipOrComplete() {
    setStep('completed');
  }

  // Reset tutorial to start again (useful for debugging/testing/manual resets)
  static Future<void> reset() async {
    await setStep('home');
  }

  // Helper to build a standard TargetContent
  static TargetContent _buildContent({
    required String title,
    required String description,
    required bool isLast,
    required VoidCallback onSkip,
    required Function(TutorialCoachMarkController) onNext,
    ContentAlign align = ContentAlign.bottom,
  }) {
    return TargetContent(
      align: align,
      builder: (context, controller) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF18181B).withValues(alpha: 0.95),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xFFEF4444).withValues(alpha: 0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.6),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    '✨',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.75),
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      onSkip();
                      controller.skip();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.4),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => onNext(controller),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEF4444),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      elevation: 4,
                    ),
                    child: Text(
                      isLast ? 'Finish' : 'Next',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // 1. Home Page Tutorial
  static void showHomeTutorial(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!context.mounted) return;
    final step = await getStep();
    if (step != 'home') return;

    // Scroll to homeMacrosKey first if needed
    if (homeMacrosKey.currentContext != null) {
      Scrollable.ensureVisible(
        homeMacrosKey.currentContext!,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    List<TargetFocus> targets = [
      TargetFocus(
        identify: "homeMacros",
        keyTarget: homeMacrosKey,
        contents: [
          _buildContent(
            title: "Your Daily Targets",
            description:
                "Complete your profile (Age, Height, Weight, Gender, Activity Level, Goal) to calculate personalized daily nutrition and calorie targets.",
            isLast: false,
            onSkip: skipOrComplete,
            onNext: (controller) {
              if (homeAiPlannerKey.currentContext != null) {
                Scrollable.ensureVisible(
                  homeAiPlannerKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
              controller.next();
            },
          )
        ],
      ),
      TargetFocus(
        identify: "homeAiPlanner",
        keyTarget: homeAiPlannerKey,
        contents: [
          _buildContent(
            title: "AI Meal Planner",
            description:
                "Tap this to generate personalized meal plans using AI. Let's explore it now!",
            isLast: true,
            onSkip: skipOrComplete,
            onNext: (controller) {
              controller.next();
              setStep('aiPlanner');
              context.push(RouteConstants.aiMealPlanner.path);
            },
            align: ContentAlign.top,
          )
        ],
      ),
    ];

    if (!context.mounted) return;
    TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black.withValues(alpha: 0.8),
      hideSkip: true,
      onFinish: () {
        setStep('aiPlanner');
        if (context.mounted) {
          context.push(RouteConstants.aiMealPlanner.path);
        }
      },
      onSkip: () {
        skipOrComplete();
        return true;
      },
    ).show(context: context);
  }

  // 2. AI Meal Planner Screen
  static void showAiPlannerTutorial(
      BuildContext context, VoidCallback onOpenDrawer) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!context.mounted) return;
    final step = await getStep();
    if (step != 'aiPlanner') return;

    List<TargetFocus> targets = [
      TargetFocus(
        identify: "aiSearchField",
        keyTarget: aiSearchFieldKey,
        contents: [
          _buildContent(
            title: "Describe Your Needs",
            description:
                "Type in your dietary preferences, restrictions, or calorie requirements (e.g., 'high protein dinner under 600 kcal').",
            isLast: false,
            onSkip: skipOrComplete,
            onNext: (controller) => controller.next(),
          )
        ],
      ),
      TargetFocus(
        identify: "aiSendButton",
        keyTarget: aiSendButtonKey,
        contents: [
          _buildContent(
            title: "Ask AI",
            description:
                "Tap this button to send your request to our AI assistant.",
            isLast: true,
            onSkip: skipOrComplete,
            onNext: (controller) {
              controller.next();
              setStep('drawer');
              onOpenDrawer();
            },
            align: ContentAlign.top,
          )
        ],
      ),
    ];

    if (!context.mounted) return;
    TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black.withValues(alpha: 0.8),
      hideSkip: true,
      onFinish: () {
        setStep('drawer');
        onOpenDrawer();
      },
      onSkip: () {
        skipOrComplete();
        return true;
      },
    ).show(context: context);
  }

  // 3. Custom Chat Drawer
  static void showDrawerTutorial(BuildContext context) async {
    final step = await getStep();
    if (!context.mounted) return;
    if (step != 'drawer') return;

    List<TargetFocus> targets = [
      TargetFocus(
        identify: "drawerNewChat",
        keyTarget: drawerNewChatKey,
        contents: [
          _buildContent(
            title: "Start Fresh",
            description:
                "Tap 'New Chat' to clear the current conversation and start a new meal planning session.",
            isLast: false,
            onSkip: skipOrComplete,
            onNext: (controller) => controller.next(),
          )
        ],
      ),
      TargetFocus(
        identify: "drawerHistory",
        keyTarget: drawerHistoryKey,
        contents: [
          _buildContent(
            title: "Recent Conversations",
            description:
                "Browse your previous meal planning history here to reload earlier suggestions.",
            isLast: false,
            onSkip: skipOrComplete,
            onNext: (controller) => controller.next(),
          )
        ],
      ),
      TargetFocus(
        identify: "drawerClearHistory",
        keyTarget: drawerClearHistoryKey,
        contents: [
          _buildContent(
            title: "Clear History",
            description:
                "Tap 'Clear History' to permanently delete all your recent AI meal planning sessions.",
            isLast: true,
            onSkip: skipOrComplete,
            onNext: (controller) {
              controller.next();
              setStep('todo');
              Navigator.pop(context); // Close the drawer
              context.go(RouteConstants.todo.path);
            },
            align: ContentAlign.top,
          )
        ],
      ),
    ];

    TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black.withValues(alpha: 0.8),
      hideSkip: true,
      onFinish: () {
        setStep('todo');
        Navigator.pop(context);
        context.go(RouteConstants.todo.path);
      },
      onSkip: () {
        skipOrComplete();
        if (context.mounted) {
          Navigator.pop(context);
        }
        return true;
      },
    ).show(context: context);
  }

  // 4. Todo Page (FAB Step)
  static void showTodoTutorial(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!context.mounted) return;
    final step = await getStep();
    if (step != 'todo') return;

    List<TargetFocus> targets = [
      TargetFocus(
        identify: "todoFab",
        keyTarget: todoFabKey,
        contents: [
          _buildContent(
            title: "Schedule a Meal",
            description:
                "Tap this button to browse the nutrition library and add a meal to your schedule.",
            isLast: true,
            onSkip: skipOrComplete,
            onNext: (controller) {
              controller.next();
              setStep('nutritionList');
              context.go(RouteConstants.nutrition.path);
            },
            align: ContentAlign.top,
          )
        ],
      ),
    ];

    if (!context.mounted) return;
    TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black.withValues(alpha: 0.8),
      hideSkip: true,
      onFinish: () {
        setStep('nutritionList');
        if (context.mounted) {
          context.go(RouteConstants.nutrition.path);
        }
      },
      onSkip: () {
        skipOrComplete();
        return true;
      },
    ).show(context: context);
  }

  // 5. Nutrition List Screen
  static void showNutritionListTutorial(
      BuildContext context, String? firstMealId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!context.mounted) return;
    final step = await getStep();
    if (step != 'nutritionList') return;

    List<TargetFocus> targets = [
      TargetFocus(
        identify: "nutritionFirstMeal",
        keyTarget: nutritionFirstMealKey,
        contents: [
          _buildContent(
            title: "Browse Nutrition Library",
            description:
                "Explore a variety of healthy meals. Tap any meal card to view its ingredients and nutritional value.",
            isLast: true,
            onSkip: skipOrComplete,
            onNext: (controller) {
              controller.next();
              setStep('nutritionDetails');
              if (firstMealId != null) {
                context.pushNamed(
                  RouteConstants.mealDetails.name,
                  pathParameters: {'id': firstMealId},
                );
              }
            },
          )
        ],
      ),
    ];

    if (!context.mounted) return;
    TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black.withValues(alpha: 0.8),
      hideSkip: true,
      onFinish: () {
        setStep('nutritionDetails');
        if (firstMealId != null && context.mounted) {
          context.pushNamed(
            RouteConstants.mealDetails.name,
            pathParameters: {'id': firstMealId},
          );
        }
      },
      onSkip: () {
        skipOrComplete();
        return true;
      },
    ).show(context: context);
  }

  // 6. Nutrition Details Screen
  static void showNutritionDetailsTutorial(
    BuildContext context, {
    required VoidCallback onAddMeal,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!context.mounted) return;
    final step = await getStep();
    if (step != 'nutritionDetails') return;

    // Scroll to detailsFavoriteKey first if needed
    if (detailsFavoriteKey.currentContext != null) {
      Scrollable.ensureVisible(
        detailsFavoriteKey.currentContext!,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    List<TargetFocus> targets = [
      TargetFocus(
        identify: "detailsFavorite",
        keyTarget: detailsFavoriteKey,
        contents: [
          _buildContent(
            title: "Save to Favorites",
            description:
                "Tap the heart icon to save this meal for quick access later from your home page.",
            isLast: false,
            onSkip: skipOrComplete,
            onNext: (controller) {
              if (detailsMealTypeKey.currentContext != null) {
                Scrollable.ensureVisible(
                  detailsMealTypeKey.currentContext!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
              controller.next();
            },
          )
        ],
      ),
      TargetFocus(
        identify: "detailsMealType",
        keyTarget: detailsMealTypeKey,
        contents: [
          _buildContent(
            title: "Choose Meal Type",
            description:
                "Categorize this meal under Breakfast, Lunch, or Dinner.",
            isLast: false,
            onSkip: skipOrComplete,
            onNext: (controller) {
              if (detailsQuantityKey.currentContext != null) {
                Scrollable.ensureVisible(
                  detailsQuantityKey.currentContext!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
              controller.next();
            },
          )
        ],
      ),
      TargetFocus(
        identify: "detailsQuantity",
        keyTarget: detailsQuantityKey,
        contents: [
          _buildContent(
            title: "Adjust Quantity",
            description:
                "Use the plus and minus buttons to change the number of servings.",
            isLast: false,
            onSkip: skipOrComplete,
            onNext: (controller) {
              if (detailsAddMealKey.currentContext != null) {
                Scrollable.ensureVisible(
                  detailsAddMealKey.currentContext!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
              controller.next();
            },
          )
        ],
      ),
      TargetFocus(
        identify: "detailsAddMeal",
        keyTarget: detailsAddMealKey,
        contents: [
          _buildContent(
            title: "Add to Schedule",
            description:
                "Tap the flame icon to add this meal to your schedule.",
            isLast: true,
            onSkip: skipOrComplete,
            onNext: (controller) {
              controller.next();
              setStep('scheduleDialog');
              onAddMeal();
            },
            align: ContentAlign.top,
          )
        ],
      ),
    ];

    if (!context.mounted) return;
    TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black.withValues(alpha: 0.8),
      hideSkip: true,
      onFinish: () {
        setStep('scheduleDialog');
        onAddMeal();
      },
      onSkip: () {
        skipOrComplete();
        return true;
      },
    ).show(context: context);
  }

  // 7. Schedule Dialog Screen
  static void showScheduleDialogTutorial(BuildContext context) async {
    final step = await getStep();
    if (!context.mounted) return;
    if (step != 'scheduleDialog') return;

    List<TargetFocus> targets = [
      TargetFocus(
        identify: "dialogTime",
        keyTarget: dialogTimeKey,
        contents: [
          _buildContent(
            title: "Set Meal Time",
            description:
                "Select the time you plan to consume this meal to receive timely reminders.",
            isLast: false,
            onSkip: skipOrComplete,
            onNext: (controller) => controller.next(),
          )
        ],
      ),
      TargetFocus(
        identify: "dialogDays",
        keyTarget: dialogDaysKey,
        contents: [
          _buildContent(
            title: "Select Days",
            description:
                "Choose the days of the week on which this scheduled meal should repeat.",
            isLast: false,
            onSkip: skipOrComplete,
            onNext: (controller) => controller.next(),
          )
        ],
      ),
      TargetFocus(
        identify: "dialogAdd",
        keyTarget: dialogAddKey,
        contents: [
          _buildContent(
            title: "Save Schedule",
            description: "Tap 'Add' to save this meal in your schedule.",
            isLast: true,
            onSkip: skipOrComplete,
            onNext: (controller) {
              controller.next();
              setStep('todoAfterAdd');
            },
            align: ContentAlign.top,
          )
        ],
      ),
    ];

    TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black.withValues(alpha: 0.8),
      hideSkip: true,
      onFinish: () {
        setStep('todoAfterAdd');
      },
      onSkip: () {
        skipOrComplete();
        return true;
      },
    ).show(context: context);
  }

  // 8. Todo Page (After Adding a Meal)
  static void showTodoAfterAddTutorial(BuildContext context) async {
    final step = await getStep();
    if (!context.mounted) return;
    if (step != 'todoAfterAdd') return;

    List<TargetFocus> targets = [
      TargetFocus(
        identify: "todoAddedMeal",
        keyTarget: todoAddedMealKey,
        contents: [
          _buildContent(
            title: "Your Scheduled Meal",
            description:
                "This is your scheduled meal. You can tap it to view or edit it. This is where all your upcoming meals will appear.",
            isLast: true,
            onSkip: skipOrComplete,
            onNext: (controller) {
              controller.next();
              skipOrComplete();
              showCongratsDialog(context);
            },
          )
        ],
      ),
    ];

    TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black.withValues(alpha: 0.8),
      hideSkip: true,
      onFinish: () {
        skipOrComplete();
        showCongratsDialog(context);
      },
      onSkip: () {
        skipOrComplete();
        return true;
      },
    ).show(context: context);
  }

  static void showCongratsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF18181B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Row(
          children: [
            Text('🎉 ', style: TextStyle(fontSize: 22)),
            Expanded(
              child: Text(
                "You're all set!",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
            ),
          ],
        ),
        content: const Text(
          "Your nutrition journey starts here. Explore the app to manage your meals, track your nutrition, and achieve your health goals.",
          style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text("Let's go!",
                style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
