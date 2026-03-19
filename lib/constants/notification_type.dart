enum NotificationType {
  streakMilestone,
  streakWarning,
  streakLost,
  mealReminder,
  nutritionGoal,
  profileUpdate,
  system,
  todoReminder,
  achievement;

  String get apiValue => switch (this) {
        NotificationType.streakMilestone => 'streak_milestone',
        NotificationType.streakWarning => 'streak_warning',
        NotificationType.streakLost => 'streak_lost',
        NotificationType.mealReminder => 'meal_reminder',
        NotificationType.nutritionGoal => 'nutrition_goal',
        NotificationType.profileUpdate => 'profile_update',
        NotificationType.system => 'system',
        NotificationType.todoReminder => 'todo_reminder',
        NotificationType.achievement => 'achievement',
      };
}
