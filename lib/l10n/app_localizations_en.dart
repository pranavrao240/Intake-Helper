// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get aiMealPlannerTitle => '✨ AI Meal Planner';

  @override
  String get aiMealPlannerSorryMessage =>
      'Sorry, I could not generate a meal plan.';

  @override
  String aiMealPlannerMealsSaved(Object count) {
    return '$count meal(s) saved!';
  }

  @override
  String get aiBubbleCopiedToClipboard => 'Copied to clipboard';

  @override
  String get aiBubbleThanksForFeedback => 'Thanks for your feedback!';

  @override
  String get aiBubbleMealName => 'Meal Name';

  @override
  String get aiBubbleMealType => 'Meal Type';

  @override
  String get aiBubbleQuantity => 'Quantity';

  @override
  String get aiBubbleSteps => 'Steps';

  @override
  String get aiBubbleNutrition => 'Nutrition';

  @override
  String get aiBubbleNutritionCaps => 'NUTRITION';

  @override
  String get chatInputBarHint => 'Edit or send a new prompt...';

  @override
  String get emptyStateViewBuildYourPerfect => 'BUILD YOUR PERFECT';

  @override
  String get emptyStateViewMealPlan => 'MEAL PLAN';

  @override
  String get emptyStateViewDescription =>
      'Describe your goals, dietary needs,\nor favourite foods to get started.';

  @override
  String get mealPlanDialogTitle => 'Select Meals to Save';

  @override
  String mealPlanDialogSelectedCount(Object selected, Object total) {
    return '$selected of $total selected';
  }

  @override
  String get mealPlanDialogClose => 'Close';

  @override
  String get mealPlanDialogSaveSelected => 'Save Selected';

  @override
  String get selectableMealCardCalories => 'Calories';

  @override
  String get selectableMealCardProtein => 'Protein';

  @override
  String get selectableMealCardCarbs => 'Carbs';

  @override
  String get todoPageAll => 'All';

  @override
  String todoPageError(Object error) {
    return 'Error: $error';
  }

  @override
  String get todoPageNoMealsPlanned => 'No meals planned for this day';

  @override
  String todoPageNoMealsInCategory(Object category) {
    return 'No $category meals on this day';
  }

  @override
  String get todoPageNoMealsScheduled => 'No meals scheduled for today 🍽️';

  @override
  String get todoPageAllMealsDone => 'All meals done! Great job today 🎉';

  @override
  String todoPageProgressMessage(Object progress) {
    return 'You\'re $progress% closer to today\'s goal 💪';
  }

  @override
  String get mealActionDialogTitle => 'Meal Action';

  @override
  String get mealActionDialogQuestion => 'What would you like to do?';

  @override
  String get mealActionDialogMarkAsCompleted => 'Mark as Completed';

  @override
  String get mealActionDialogConfirmCompletion =>
      'Confirm completion for today';

  @override
  String get mealActionDialogDeleteMeal => 'Delete Meal';

  @override
  String get mealActionDialogRemoveMeal => 'Remove this meal from your plan';

  @override
  String get mealActionDialogCancel => 'Cancel';

  @override
  String get todoAlertBannerLunch => 'Lunch in 20 minutes';

  @override
  String get todoAlertBannerMarkDone => 'Mark Done';

  @override
  String get todoAlertBannerSnooze => 'Snooze';

  @override
  String get todoAppBarTitle => 'Today\'s Meals';

  @override
  String todoAppBarStreak(Object streak) {
    return '$streak day streak';
  }

  @override
  String todoAppBarProgress(Object completed, Object total) {
    return '$completed / $total done';
  }

  @override
  String get monthJanuary => 'January';

  @override
  String get monthFebruary => 'February';

  @override
  String get monthMarch => 'March';

  @override
  String get monthApril => 'April';

  @override
  String get monthMay => 'May';

  @override
  String get monthJune => 'June';

  @override
  String get monthJuly => 'July';

  @override
  String get monthAugust => 'August';

  @override
  String get monthSeptember => 'September';

  @override
  String get monthOctober => 'October';

  @override
  String get monthNovember => 'November';

  @override
  String get monthDecember => 'December';

  @override
  String get quickSelectToday => 'Today';

  @override
  String get quickSelectYesterday => 'Yesterday';

  @override
  String get quickSelectLastWeek => 'Last Week';

  @override
  String get categoryAll => 'All';

  @override
  String get categoryBreakfast => 'Breakfast';

  @override
  String get categoryLunch => 'Lunch';

  @override
  String get categoryDinner => 'Dinner';

  @override
  String completedMealCardProtein(Object protein) {
    return '+${protein}g Protein';
  }

  @override
  String activeMealCardActiveNow(Object time) {
    return '$time · Active now';
  }

  @override
  String activeMealCardMacrosKg(Object calories, Object protein) {
    return '$protein g Protein · $calories kcal';
  }

  @override
  String activeMealCardMacrosLb(Object calories, Object protein) {
    return '$protein lb Protein · $calories kcal';
  }

  @override
  String get missedMealCardMissed => 'Missed';

  @override
  String upcomingMealCardMacros(Object calories, Object protein) {
    return '${protein}g Protein · $calories kcal';
  }

  @override
  String get upcomingMealCardTonight => 'Tonight';

  @override
  String todoProgressBarMealsCompleted(Object completed, Object total) {
    return '$completed/$total Meals Completed';
  }

  @override
  String get emailVerificationTitle => 'Verify Email';

  @override
  String get emailVerificationCheckInbox => 'Check your inbox to get started ';

  @override
  String get emailVerificationPending => 'VERIFICATION PENDING';

  @override
  String get emailVerificationEmailLabel => 'EMAIL';

  @override
  String get emailVerificationSent => 'Sent';

  @override
  String get emailVerificationLinkSent =>
      'A verification link was sent. Click it to activate your account.';

  @override
  String get emailVerificationStepCheckInbox => 'Check inbox';

  @override
  String get emailVerificationStepClickLink => 'Click link';

  @override
  String get emailVerificationStepVerified => 'Verified';

  @override
  String get emailVerificationGoToLogin => 'Go to Login';

  @override
  String get emailVerificationOrContinueWith => 'or continue with';

  @override
  String get emailVerificationDidNotReceive => 'Didn\'t receive the email? ';

  @override
  String get emailVerificationResent => 'Sent ✓';

  @override
  String get emailVerificationResend => 'Resend';

  @override
  String get emailVerificationNeedHelp => 'Need help? ';

  @override
  String get emailVerificationContactSupport => 'Contact Support';

  @override
  String get emailSentMessageTitle => 'Verify your email';

  @override
  String get emailSentMessageLinkSentTo =>
      'A verification link has been sent to';

  @override
  String get emailSentMessageCheckInbox =>
      'Please check your inbox and click the link to verify your account.';

  @override
  String get forgotPasswordEnterEmail => 'Please enter your email';

  @override
  String get forgotPasswordInvalidEmail => 'Please enter a valid email';

  @override
  String get forgotPasswordSendResetLink => 'Send Reset Link';

  @override
  String get emailInputCardEmailLabel => 'EMAIL';

  @override
  String get emailInputCardEnterEmail => 'Enter your email';

  @override
  String get forgotPasswordTryAnotherEmail => 'Try another email';

  @override
  String get forgotPasswordRememberPassword => 'Remember your password?  ';

  @override
  String get forgotPasswordSignIn => 'Sign in';

  @override
  String get forgotPasswordOrContinueWith => 'or continue with';

  @override
  String get forgotPasswordHeaderCheckInbox => 'Check Inbox';

  @override
  String get forgotPasswordHeaderTitle => 'Forgot Password?';

  @override
  String get forgotPasswordHeaderResetLinkSent =>
      'Reset link sent to your email ';

  @override
  String get forgotPasswordHeaderEnterEmailToReset =>
      'Enter your email to reset password ';

  @override
  String get forgotPasswordHeaderEmailSent => 'EMAIL SENT';

  @override
  String get forgotPasswordHeaderPasswordReset => 'PASSWORD RESET';

  @override
  String get forgotPasswordProviderError =>
      'Something went wrong. Please try again.';

  @override
  String get successInfoCardWhatsNext => 'What\'s next?';

  @override
  String get successInfoCardCheckInbox => 'Check your inbox and spam folder';

  @override
  String get successInfoCardClickResetLink =>
      'Click the reset link in the email';

  @override
  String get successInfoCardCreateNewPassword => 'Create a new secure password';

  @override
  String get successInfoCardBackToLogin => 'Back to Login';

  @override
  String get loginPageFillAllFields => 'Please fill in all fields.';

  @override
  String get loginPageInvalidCredentials => 'Invalid email or password.';

  @override
  String get loginPageGenericError => 'Something went wrong. Please try again.';

  @override
  String get loginFormCardEmailLabel => 'Email';

  @override
  String get loginFormCardEmailPlaceholder => 'you@example.com';

  @override
  String get loginFormCardEnterEmail => 'Please enter your email';

  @override
  String get loginFormCardInvalidEmail => 'Please enter a valid email';

  @override
  String get loginFormCardPasswordLabel => 'Password';

  @override
  String get loginFormCardPasswordPlaceholder => '••••••••';

  @override
  String get loginFormCardEnterPassword => 'Please enter your password';

  @override
  String get loginFormCardPasswordTooShort =>
      'Password must be at least 6 characters';

  @override
  String get loginFormCardForgotPassword => 'Forgot password?';

  @override
  String get loginFormCardSignIn => 'Sign In';

  @override
  String get loginFormCardNoAccount => 'Don\'t have an account? ';

  @override
  String get loginFormCardRegister => 'Register';

  @override
  String get loginHeaderSystemOnline => 'SYSTEM ONLINE';

  @override
  String get loginHeaderWelcomeBack => 'Welcome Back';

  @override
  String get loginHeaderSignInToContinue =>
      'Sign in to continue your journey 💪';

  @override
  String get socialLoginOrContinueWith => 'or continue with';

  @override
  String get socialLoginGoogle => 'Google';

  @override
  String get socialLoginApple => 'Apple';

  @override
  String get registerPageGenericError =>
      'Something went wrong. Please try again.';

  @override
  String get registerFormCardFullNameLabel => 'Full Name';

  @override
  String get registerFormCardFullNamePlaceholder => 'Enter Name';

  @override
  String get registerFormCardEnterFullName => 'Please enter your full name';

  @override
  String get registerFormCardEmailLabel => 'Email';

  @override
  String get registerFormCardEmailPlaceholder => 'you@example.com';

  @override
  String get registerFormCardEnterEmail => 'Please enter your email';

  @override
  String get registerFormCardInvalidEmail => 'Please enter a valid email';

  @override
  String get registerFormCardPasswordLabel => 'Password';

  @override
  String get registerFormCardPasswordPlaceholder => '••••••••';

  @override
  String get registerFormCardEnterPassword => 'Please enter your password';

  @override
  String get registerFormCardPasswordTooShort =>
      'Password must be at least 6 characters';

  @override
  String get registerFormCardConfirmPasswordLabel => 'Confirm Password';

  @override
  String get registerFormCardConfirmPassword => 'Please confirm your password';

  @override
  String get registerFormCardPasswordsDoNotMatch => 'Passwords do not match';

  @override
  String get registerFormCardCreateAccount => 'Create Account';

  @override
  String get registerFormCardHaveAccount => 'Already have an account? ';

  @override
  String get registerFormCardSignIn => 'Sign In';

  @override
  String get registerFormCardTerms =>
      'By signing up, you agree to our Terms of Service and Privacy Policy';

  @override
  String get registerHeaderJoinMembers => 'JOIN 10K+ MEMBERS';

  @override
  String get registerHeaderCreateAccount => 'Create Account';

  @override
  String get registerHeaderStartJourney =>
      'Start your nutrition journey today 🥗';

  @override
  String get registerSocialOrContinueWith => 'or continue with';

  @override
  String get registerSocialGoogle => 'Google';

  @override
  String get registerSocialApple => 'Apple';

  @override
  String get passwordInputCardNewPassword => 'NEW PASSWORD';

  @override
  String get passwordInputCardEnterNewPassword => 'Enter new password';

  @override
  String get passwordInputCardConfirmPassword => 'CONFIRM PASSWORD';

  @override
  String get passwordInputCardReEnterNewPassword => 'Re-enter new password';

  @override
  String get passwordInputCardStrength => 'STRENGTH';

  @override
  String get passwordStrengthVeryWeak => 'Very Weak';

  @override
  String get passwordStrengthWeak => 'Weak';

  @override
  String get passwordStrengthFair => 'Fair';

  @override
  String get passwordStrengthStrong => 'Strong';

  @override
  String get passwordStrengthVeryStrong => 'Very Strong';

  @override
  String get passwordInputCardRequirements => 'PASSWORD REQUIREMENTS';

  @override
  String get passwordInputCardPasswordsMatch => 'Passwords match';

  @override
  String get passwordInputCardPasswordsDoNotMatch => 'Passwords do not match';

  @override
  String get passwordInputCardResetPassword => 'Reset Password';

  @override
  String get passwordInputCardSecurityTip =>
      'Use a strong, unique password that you don\'t use on other websites.';

  @override
  String get resetPasswordHeaderSuccessTitle => 'Password Reset!';

  @override
  String get resetPasswordHeaderTitle => 'Reset Password';

  @override
  String get resetPasswordHeaderSuccessSubtitle =>
      'Your new password is ready ';

  @override
  String get resetPasswordHeaderSubtitle => 'Create a strong new password ';

  @override
  String get resetPasswordHeaderStatusUpdated => 'PASSWORD UPDATED';

  @override
  String get resetPasswordHeaderStatusCreate => 'CREATE NEW PASSWORD';

  @override
  String get passwordRequirementLength => 'At least 8 characters';

  @override
  String get passwordRequirementUppercase => 'Contains uppercase letter';

  @override
  String get passwordRequirementLowercase => 'Contains lowercase letter';

  @override
  String get passwordRequirementNumber => 'Contains number';

  @override
  String get passwordRequirementSpecial => 'Contains special character';

  @override
  String get resetPasswordProviderError =>
      'Failed to reset password. Please try again.';

  @override
  String get successCardSecurityStatus => 'Security Status';

  @override
  String get successCardPasswordUpdated => 'Password Updated';

  @override
  String get successCardProTip => 'Pro tip: ';

  @override
  String get successCardPasswordManagerTip =>
      'Use a password manager to securely store your credentials.';

  @override
  String get successCardContinueToLogin => 'Continue to Login';

  @override
  String get homePageFailedToLoad => 'Failed to load data';

  @override
  String get greetingGoodMorning => 'Good Morning';

  @override
  String get greetingGoodAfternoon => 'Good Afternoon';

  @override
  String get greetingGoodEvening => 'Good Evening';

  @override
  String get greetingGoodNight => 'Good Night';

  @override
  String get heroSectionProtein => 'PROTEIN';

  @override
  String get macrosCardTitle => 'Today\'s Macros';

  @override
  String get macrosCardCalories => 'CALORIES';

  @override
  String get macrosCardProtein => 'PROTEIN';

  @override
  String get macrosCardCarbs => 'CARBS';

  @override
  String get macrosCardFats => 'FATS';

  @override
  String get quickActionsAddMeal => 'Add Meal';

  @override
  String get quickActionsAiPlan => 'AI Plan';

  @override
  String get savedMealsTitle => 'Saved Meals';

  @override
  String get savedMealsEmpty => 'No saved Meals';

  @override
  String get savedMealsProtein => ' Protein';

  @override
  String get scheduleMealCardTitle => 'Today\'s Schedule';

  @override
  String get scheduleMealCardViewAll => 'VIEW ALL';

  @override
  String get scheduleMealCardEmpty => 'No meals scheduled';

  @override
  String get emptyNotificationsTitle => 'All Caught Up!';

  @override
  String get emptyNotificationsSubtitle => 'You have no new notifications';

  @override
  String get notificationCardDelete => 'Delete';

  @override
  String get notificationHeaderTitle => 'Notifications';

  @override
  String get notificationHeaderMarkAllRead => 'Mark All Read';

  @override
  String notificationHeaderUnread(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count new notifications',
      one: '1 new notification',
    );
    return '$_temp0';
  }

  @override
  String nutritionDetailsError(Object error) {
    return 'Error: $error';
  }

  @override
  String get nutritionDetailsUnknownDish => 'Unknown Dish';

  @override
  String get nutritionDetailsInsight =>
      'This meal is optimized for your daily nutrition goals. Track consistently for best results.';

  @override
  String get nutritionDetailsNoInsight => 'No insight available.';

  @override
  String get nutritionDetailsSelectMealType =>
      'Please select at least one meal type';

  @override
  String get nutritionDetailsAddedToTodo => 'Added to Todo List';

  @override
  String get nutritionDetailsFailedToAdd => 'Failed to add to Todo List';

  @override
  String get nutritionDetailsMealType => 'MEAL TYPE';

  @override
  String get mealTypeBreakfast => 'Breakfast';

  @override
  String get mealTypeLunch => 'Lunch';

  @override
  String get mealTypeDinner => 'Dinner';

  @override
  String get scheduleMealDialogTitle => 'Schedule Meal';

  @override
  String get scheduleMealDialogSelectDays => 'SELECT DAYS';

  @override
  String get scheduleMealDialogCancel => 'Cancel';

  @override
  String get scheduleMealDialogAdd => 'Add';

  @override
  String get notificationMealTimeTitle => '🍽️ Time to eat!';

  @override
  String notificationMealTimeBody(Object dishName) {
    return 'Your $dishName is scheduled now.';
  }

  @override
  String get energyMixTitle => 'ENERGY MIX';

  @override
  String get energyMixBalanced => 'BALANCED';

  @override
  String get energyMixProtein => 'Protein';

  @override
  String get energyMixCarbs => 'Carbs';

  @override
  String get energyMixCalories => 'Calories';

  @override
  String get ingredientsTitle => 'INGREDIENTS';

  @override
  String goalInsightCardQuote(Object insight) {
    return '\"$insight\"';
  }

  @override
  String get nutritionBottomBarAddMeal => 'ADD MEAL';

  @override
  String get nutritionListFailedToLoad => 'Failed to load nutrition data';

  @override
  String get nutritionListNoData => 'No nutrition data found';

  @override
  String nutritionListNoResults(Object query) {
    return 'No results for \"$query\"';
  }

  @override
  String nutritionListShowingResults(Object total, Object visible) {
    return 'Showing $visible of $total results';
  }

  @override
  String nutritionListLoadMore(Object count) {
    return 'Load $count more';
  }

  @override
  String nutritionListRemaining(Object count) {
    return '$count left';
  }

  @override
  String nutritionListAllResultsShown(Object total) {
    return 'All $total results shown';
  }

  @override
  String get nutritionListHeaderTitle => 'Nutrition List';

  @override
  String get nutritionListHeaderSubtitle =>
      'Explore detailed nutritional information\nfor various foods.';

  @override
  String get nutritionSearchBarHint => 'Search meals or nutrients...';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboardingContinue => 'Continue';

  @override
  String get onboardingOf => ' of ';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingWelcomeTitle => 'Welcome to Intake Helper';

  @override
  String get onboardingWelcomeDescription =>
      'Your personal nutrition companion for achieving your health goals';

  @override
  String get onboardingWelcomeFeature1 => 'Track your daily protein and macros';

  @override
  String get onboardingWelcomeFeature2 => 'Get AI-powered nutrition insights';

  @override
  String get onboardingWelcomeFeature3 => 'Build healthy eating habits';

  @override
  String get onboardingTargetsTitle => 'Set Your Targets';

  @override
  String get onboardingTargetsDescription =>
      'Define your daily nutrition goals and watch your progress';

  @override
  String get onboardingTargetsFeature1 =>
      'Customize protein, carbs, and fat goals';

  @override
  String get onboardingTargetsFeature2 =>
      'Visual progress rings show your status';

  @override
  String get onboardingTargetsFeature3 => 'Weekly tracking charts';

  @override
  String get onboardingMealsTitle => 'Track Your Meals';

  @override
  String get onboardingMealsDescription =>
      'Log breakfast, lunch, dinner, and snacks with ease';

  @override
  String get onboardingMealsFeature1 =>
      'Quick meal logging with saved favorites';

  @override
  String get onboardingMealsFeature2 => 'Barcode scanner for packaged foods';

  @override
  String get onboardingMealsFeature3 =>
      'See completed, upcoming, and missed meals';

  @override
  String get onboardingInsightsTitle => 'Get AI Insights';

  @override
  String get onboardingInsightsDescription =>
      'Receive personalized recommendations to optimize your nutrition';

  @override
  String get onboardingInsightsFeature1 => 'AI analyzes your eating patterns';

  @override
  String get onboardingInsightsFeature2 => 'Personalized meal suggestions';

  @override
  String get onboardingInsightsFeature3 => 'Tips to reach your goals faster';

  @override
  String get onboardingStreakTitle => 'Build Your Streak';

  @override
  String get onboardingStreakDescription =>
      'Stay consistent and earn achievements for your dedication';

  @override
  String get onboardingStreakFeature1 => 'Track your consistency streak';

  @override
  String get onboardingStreakFeature2 => 'Unlock badges and achievements';

  @override
  String get onboardingStreakFeature3 => 'Celebrate your milestones';

  @override
  String get onboardingPlaceholder =>
      'This is a placeholder for the onboarding content.';

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String get achievementsEmpty => 'No achievements yet';

  @override
  String get avatarModalTitle => 'Choose Avatar';

  @override
  String get avatarModalUpdate => 'Update';

  @override
  String get logoutButton => 'Logout';

  @override
  String get physicalStatsTitle => 'Physical Stats';

  @override
  String get physicalStatsEdit => 'Edit';

  @override
  String get physicalStatsHeight => 'Height';

  @override
  String get physicalStatsWeight => 'Weight';

  @override
  String get physicalStatsAge => 'Age';

  @override
  String get physicalStatsBodyFat => 'Body Fat';

  @override
  String get physicalStatsGender => 'Gender';

  @override
  String get physicalStatsAdd => 'Add your stats';

  @override
  String get physicalStatsAddSubtitle => 'Tap to enter height, weight & more';

  @override
  String get profileHeaderName => 'Pranav';

  @override
  String get profileHeaderMotto => 'Consistency Builds Strength 💪';

  @override
  String get reminderSettingsTitle => 'Reminder Settings';

  @override
  String get reminderSettingsDaily => 'Daily Reminder';

  @override
  String get reminderSettingsTapToChange => 'Tap time below to change';

  @override
  String get reminderSettingsTurnOn => 'Turn on to set a reminder';

  @override
  String get reminderSettingsTime => 'Reminder Time';

  @override
  String get settingsTitle => 'Settings & Preferences';

  @override
  String get settingsReminder => 'Reminder Settings';

  @override
  String get settingsDailyAt => 'Daily at ';

  @override
  String get settingsOff => 'Off';

  @override
  String get settingsUnits => 'Units (kg/lbs)';

  @override
  String get settingsKilograms => 'Kilograms';

  @override
  String get settingsPounds => 'Pounds';

  @override
  String get settingsDarkMode => 'Dark Mode';

  @override
  String get unitsTitle => 'Units';

  @override
  String get unitsKilograms => 'Kilograms (kg)';

  @override
  String get unitsPounds => 'Pounds (lbs)';

  @override
  String get addDetailsTitle => 'Add Details';

  @override
  String get addDetailsEnterAge => 'Enter your Age';

  @override
  String get addDetailsEnterWeight => 'Enter your Weight (kg)';

  @override
  String get addDetailsEnterHeight => 'Enter your Height (cm)';

  @override
  String get addDetailsSelectDob => 'Select Date of Birth';

  @override
  String get addDetailsSave => 'Save';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageHindi => 'Hindi (हिंदी)';

  @override
  String get navHome => 'Home';

  @override
  String get navMeals => 'Meals';

  @override
  String get navNutrition => 'Nutrition';

  @override
  String get navProfile => 'Profile';
}
