import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi')
  ];

  /// No description provided for @aiMealPlannerTitle.
  ///
  /// In en, this message translates to:
  /// **'✨ AI Meal Planner'**
  String get aiMealPlannerTitle;

  /// No description provided for @aiMealPlannerSorryMessage.
  ///
  /// In en, this message translates to:
  /// **'Sorry, I could not generate a meal plan.'**
  String get aiMealPlannerSorryMessage;

  /// No description provided for @aiMealPlannerMealsSaved.
  ///
  /// In en, this message translates to:
  /// **'{count} meal(s) saved!'**
  String aiMealPlannerMealsSaved(Object count);

  /// No description provided for @aiBubbleCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get aiBubbleCopiedToClipboard;

  /// No description provided for @aiBubbleThanksForFeedback.
  ///
  /// In en, this message translates to:
  /// **'Thanks for your feedback!'**
  String get aiBubbleThanksForFeedback;

  /// No description provided for @aiBubbleMealName.
  ///
  /// In en, this message translates to:
  /// **'Meal Name'**
  String get aiBubbleMealName;

  /// No description provided for @aiBubbleMealType.
  ///
  /// In en, this message translates to:
  /// **'Meal Type'**
  String get aiBubbleMealType;

  /// No description provided for @aiBubbleQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get aiBubbleQuantity;

  /// No description provided for @aiBubbleSteps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get aiBubbleSteps;

  /// No description provided for @aiBubbleNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get aiBubbleNutrition;

  /// No description provided for @aiBubbleNutritionCaps.
  ///
  /// In en, this message translates to:
  /// **'NUTRITION'**
  String get aiBubbleNutritionCaps;

  /// No description provided for @chatInputBarHint.
  ///
  /// In en, this message translates to:
  /// **'Edit or send a new prompt...'**
  String get chatInputBarHint;

  /// No description provided for @emptyStateViewBuildYourPerfect.
  ///
  /// In en, this message translates to:
  /// **'BUILD YOUR PERFECT'**
  String get emptyStateViewBuildYourPerfect;

  /// No description provided for @emptyStateViewMealPlan.
  ///
  /// In en, this message translates to:
  /// **'MEAL PLAN'**
  String get emptyStateViewMealPlan;

  /// No description provided for @emptyStateViewDescription.
  ///
  /// In en, this message translates to:
  /// **'Describe your goals, dietary needs,\nor favourite foods to get started.'**
  String get emptyStateViewDescription;

  /// No description provided for @mealPlanDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Meals to Save'**
  String get mealPlanDialogTitle;

  /// No description provided for @mealPlanDialogSelectedCount.
  ///
  /// In en, this message translates to:
  /// **'{selected} of {total} selected'**
  String mealPlanDialogSelectedCount(Object selected, Object total);

  /// No description provided for @mealPlanDialogClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get mealPlanDialogClose;

  /// No description provided for @mealPlanDialogSaveSelected.
  ///
  /// In en, this message translates to:
  /// **'Save Selected'**
  String get mealPlanDialogSaveSelected;

  /// No description provided for @selectableMealCardCalories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get selectableMealCardCalories;

  /// No description provided for @selectableMealCardProtein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get selectableMealCardProtein;

  /// No description provided for @selectableMealCardCarbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get selectableMealCardCarbs;

  /// No description provided for @todoPageAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get todoPageAll;

  /// No description provided for @todoPageError.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String todoPageError(Object error);

  /// No description provided for @todoPageNoMealsPlanned.
  ///
  /// In en, this message translates to:
  /// **'No meals planned for this day'**
  String get todoPageNoMealsPlanned;

  /// No description provided for @todoPageNoMealsInCategory.
  ///
  /// In en, this message translates to:
  /// **'No {category} meals on this day'**
  String todoPageNoMealsInCategory(Object category);

  /// No description provided for @todoPageNoMealsScheduled.
  ///
  /// In en, this message translates to:
  /// **'No meals scheduled for today 🍽️'**
  String get todoPageNoMealsScheduled;

  /// No description provided for @todoPageAllMealsDone.
  ///
  /// In en, this message translates to:
  /// **'All meals done! Great job today 🎉'**
  String get todoPageAllMealsDone;

  /// No description provided for @todoPageProgressMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'re {progress}% closer to today\'s goal 💪'**
  String todoPageProgressMessage(Object progress);

  /// No description provided for @mealActionDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Meal Action'**
  String get mealActionDialogTitle;

  /// No description provided for @mealActionDialogQuestion.
  ///
  /// In en, this message translates to:
  /// **'What would you like to do?'**
  String get mealActionDialogQuestion;

  /// No description provided for @mealActionDialogMarkAsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Mark as Completed'**
  String get mealActionDialogMarkAsCompleted;

  /// No description provided for @mealActionDialogConfirmCompletion.
  ///
  /// In en, this message translates to:
  /// **'Confirm completion for today'**
  String get mealActionDialogConfirmCompletion;

  /// No description provided for @mealActionDialogDeleteMeal.
  ///
  /// In en, this message translates to:
  /// **'Delete Meal'**
  String get mealActionDialogDeleteMeal;

  /// No description provided for @mealActionDialogRemoveMeal.
  ///
  /// In en, this message translates to:
  /// **'Remove this meal from your plan'**
  String get mealActionDialogRemoveMeal;

  /// No description provided for @mealActionDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get mealActionDialogCancel;

  /// No description provided for @todoAlertBannerLunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch in 20 minutes'**
  String get todoAlertBannerLunch;

  /// No description provided for @todoAlertBannerMarkDone.
  ///
  /// In en, this message translates to:
  /// **'Mark Done'**
  String get todoAlertBannerMarkDone;

  /// No description provided for @todoAlertBannerSnooze.
  ///
  /// In en, this message translates to:
  /// **'Snooze'**
  String get todoAlertBannerSnooze;

  /// No description provided for @todoAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Meals'**
  String get todoAppBarTitle;

  /// No description provided for @todoAppBarStreak.
  ///
  /// In en, this message translates to:
  /// **'{streak} day streak'**
  String todoAppBarStreak(Object streak);

  /// No description provided for @todoAppBarProgress.
  ///
  /// In en, this message translates to:
  /// **'{completed} / {total} done'**
  String todoAppBarProgress(Object completed, Object total);

  /// No description provided for @monthJanuary.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get monthJanuary;

  /// No description provided for @monthFebruary.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get monthFebruary;

  /// No description provided for @monthMarch.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get monthMarch;

  /// No description provided for @monthApril.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get monthApril;

  /// No description provided for @monthMay.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthMay;

  /// No description provided for @monthJune.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get monthJune;

  /// No description provided for @monthJuly.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get monthJuly;

  /// No description provided for @monthAugust.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get monthAugust;

  /// No description provided for @monthSeptember.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get monthSeptember;

  /// No description provided for @monthOctober.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get monthOctober;

  /// No description provided for @monthNovember.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get monthNovember;

  /// No description provided for @monthDecember.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get monthDecember;

  /// No description provided for @quickSelectToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get quickSelectToday;

  /// No description provided for @quickSelectYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get quickSelectYesterday;

  /// No description provided for @quickSelectLastWeek.
  ///
  /// In en, this message translates to:
  /// **'Last Week'**
  String get quickSelectLastWeek;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @categoryBreakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get categoryBreakfast;

  /// No description provided for @categoryLunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get categoryLunch;

  /// No description provided for @categoryDinner.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get categoryDinner;

  /// No description provided for @completedMealCardProtein.
  ///
  /// In en, this message translates to:
  /// **'+{protein}g Protein'**
  String completedMealCardProtein(Object protein);

  /// No description provided for @activeMealCardActiveNow.
  ///
  /// In en, this message translates to:
  /// **'{time} · Active now'**
  String activeMealCardActiveNow(Object time);

  /// No description provided for @activeMealCardMacrosKg.
  ///
  /// In en, this message translates to:
  /// **'{protein} g Protein · {calories} kcal'**
  String activeMealCardMacrosKg(Object calories, Object protein);

  /// No description provided for @activeMealCardMacrosLb.
  ///
  /// In en, this message translates to:
  /// **'{protein} lb Protein · {calories} kcal'**
  String activeMealCardMacrosLb(Object calories, Object protein);

  /// No description provided for @missedMealCardMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get missedMealCardMissed;

  /// No description provided for @upcomingMealCardMacros.
  ///
  /// In en, this message translates to:
  /// **'{protein}g Protein · {calories} kcal'**
  String upcomingMealCardMacros(Object calories, Object protein);

  /// No description provided for @upcomingMealCardTonight.
  ///
  /// In en, this message translates to:
  /// **'Tonight'**
  String get upcomingMealCardTonight;

  /// No description provided for @todoProgressBarMealsCompleted.
  ///
  /// In en, this message translates to:
  /// **'{completed}/{total} Meals Completed'**
  String todoProgressBarMealsCompleted(Object completed, Object total);

  /// No description provided for @emailVerificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get emailVerificationTitle;

  /// No description provided for @emailVerificationCheckInbox.
  ///
  /// In en, this message translates to:
  /// **'Check your inbox to get started '**
  String get emailVerificationCheckInbox;

  /// No description provided for @emailVerificationPending.
  ///
  /// In en, this message translates to:
  /// **'VERIFICATION PENDING'**
  String get emailVerificationPending;

  /// No description provided for @emailVerificationEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'EMAIL'**
  String get emailVerificationEmailLabel;

  /// No description provided for @emailVerificationSent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get emailVerificationSent;

  /// No description provided for @emailVerificationLinkSent.
  ///
  /// In en, this message translates to:
  /// **'A verification link was sent. Click it to activate your account.'**
  String get emailVerificationLinkSent;

  /// No description provided for @emailVerificationStepCheckInbox.
  ///
  /// In en, this message translates to:
  /// **'Check inbox'**
  String get emailVerificationStepCheckInbox;

  /// No description provided for @emailVerificationStepClickLink.
  ///
  /// In en, this message translates to:
  /// **'Click link'**
  String get emailVerificationStepClickLink;

  /// No description provided for @emailVerificationStepVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get emailVerificationStepVerified;

  /// No description provided for @emailVerificationGoToLogin.
  ///
  /// In en, this message translates to:
  /// **'Go to Login'**
  String get emailVerificationGoToLogin;

  /// No description provided for @emailVerificationOrContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get emailVerificationOrContinueWith;

  /// No description provided for @emailVerificationDidNotReceive.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the email? '**
  String get emailVerificationDidNotReceive;

  /// No description provided for @emailVerificationResent.
  ///
  /// In en, this message translates to:
  /// **'Sent ✓'**
  String get emailVerificationResent;

  /// No description provided for @emailVerificationResend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get emailVerificationResend;

  /// No description provided for @emailVerificationNeedHelp.
  ///
  /// In en, this message translates to:
  /// **'Need help? '**
  String get emailVerificationNeedHelp;

  /// No description provided for @emailVerificationContactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get emailVerificationContactSupport;

  /// No description provided for @emailSentMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get emailSentMessageTitle;

  /// No description provided for @emailSentMessageLinkSentTo.
  ///
  /// In en, this message translates to:
  /// **'A verification link has been sent to'**
  String get emailSentMessageLinkSentTo;

  /// No description provided for @emailSentMessageCheckInbox.
  ///
  /// In en, this message translates to:
  /// **'Please check your inbox and click the link to verify your account.'**
  String get emailSentMessageCheckInbox;

  /// No description provided for @forgotPasswordEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get forgotPasswordEnterEmail;

  /// No description provided for @forgotPasswordInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get forgotPasswordInvalidEmail;

  /// No description provided for @forgotPasswordSendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get forgotPasswordSendResetLink;

  /// No description provided for @emailInputCardEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'EMAIL'**
  String get emailInputCardEmailLabel;

  /// No description provided for @emailInputCardEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailInputCardEnterEmail;

  /// No description provided for @forgotPasswordTryAnotherEmail.
  ///
  /// In en, this message translates to:
  /// **'Try another email'**
  String get forgotPasswordTryAnotherEmail;

  /// No description provided for @forgotPasswordRememberPassword.
  ///
  /// In en, this message translates to:
  /// **'Remember your password?  '**
  String get forgotPasswordRememberPassword;

  /// No description provided for @forgotPasswordSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get forgotPasswordSignIn;

  /// No description provided for @forgotPasswordOrContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get forgotPasswordOrContinueWith;

  /// No description provided for @forgotPasswordHeaderCheckInbox.
  ///
  /// In en, this message translates to:
  /// **'Check Inbox'**
  String get forgotPasswordHeaderCheckInbox;

  /// No description provided for @forgotPasswordHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordHeaderTitle;

  /// No description provided for @forgotPasswordHeaderResetLinkSent.
  ///
  /// In en, this message translates to:
  /// **'Reset link sent to your email '**
  String get forgotPasswordHeaderResetLinkSent;

  /// No description provided for @forgotPasswordHeaderEnterEmailToReset.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to reset password '**
  String get forgotPasswordHeaderEnterEmailToReset;

  /// No description provided for @forgotPasswordHeaderEmailSent.
  ///
  /// In en, this message translates to:
  /// **'EMAIL SENT'**
  String get forgotPasswordHeaderEmailSent;

  /// No description provided for @forgotPasswordHeaderPasswordReset.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD RESET'**
  String get forgotPasswordHeaderPasswordReset;

  /// No description provided for @forgotPasswordProviderError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get forgotPasswordProviderError;

  /// No description provided for @successInfoCardWhatsNext.
  ///
  /// In en, this message translates to:
  /// **'What\'s next?'**
  String get successInfoCardWhatsNext;

  /// No description provided for @successInfoCardCheckInbox.
  ///
  /// In en, this message translates to:
  /// **'Check your inbox and spam folder'**
  String get successInfoCardCheckInbox;

  /// No description provided for @successInfoCardClickResetLink.
  ///
  /// In en, this message translates to:
  /// **'Click the reset link in the email'**
  String get successInfoCardClickResetLink;

  /// No description provided for @successInfoCardCreateNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create a new secure password'**
  String get successInfoCardCreateNewPassword;

  /// No description provided for @successInfoCardBackToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get successInfoCardBackToLogin;

  /// No description provided for @loginPageFillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields.'**
  String get loginPageFillAllFields;

  /// No description provided for @loginPageInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password.'**
  String get loginPageInvalidCredentials;

  /// No description provided for @loginPageGenericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get loginPageGenericError;

  /// No description provided for @loginFormCardEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginFormCardEmailLabel;

  /// No description provided for @loginFormCardEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'you@example.com'**
  String get loginFormCardEmailPlaceholder;

  /// No description provided for @loginFormCardEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get loginFormCardEnterEmail;

  /// No description provided for @loginFormCardInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get loginFormCardInvalidEmail;

  /// No description provided for @loginFormCardPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginFormCardPasswordLabel;

  /// No description provided for @loginFormCardPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get loginFormCardPasswordPlaceholder;

  /// No description provided for @loginFormCardEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get loginFormCardEnterPassword;

  /// No description provided for @loginFormCardPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get loginFormCardPasswordTooShort;

  /// No description provided for @loginFormCardForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get loginFormCardForgotPassword;

  /// No description provided for @loginFormCardSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginFormCardSignIn;

  /// No description provided for @loginFormCardNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get loginFormCardNoAccount;

  /// No description provided for @loginFormCardRegister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get loginFormCardRegister;

  /// No description provided for @loginHeaderSystemOnline.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM ONLINE'**
  String get loginHeaderSystemOnline;

  /// No description provided for @loginHeaderWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get loginHeaderWelcomeBack;

  /// No description provided for @loginHeaderSignInToContinue.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue your journey 💪'**
  String get loginHeaderSignInToContinue;

  /// No description provided for @socialLoginOrContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get socialLoginOrContinueWith;

  /// No description provided for @socialLoginGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get socialLoginGoogle;

  /// No description provided for @socialLoginApple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get socialLoginApple;

  /// No description provided for @registerPageGenericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get registerPageGenericError;

  /// No description provided for @registerFormCardFullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get registerFormCardFullNameLabel;

  /// No description provided for @registerFormCardFullNamePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Name'**
  String get registerFormCardFullNamePlaceholder;

  /// No description provided for @registerFormCardEnterFullName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your full name'**
  String get registerFormCardEnterFullName;

  /// No description provided for @registerFormCardEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get registerFormCardEmailLabel;

  /// No description provided for @registerFormCardEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'you@example.com'**
  String get registerFormCardEmailPlaceholder;

  /// No description provided for @registerFormCardEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get registerFormCardEnterEmail;

  /// No description provided for @registerFormCardInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get registerFormCardInvalidEmail;

  /// No description provided for @registerFormCardPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registerFormCardPasswordLabel;

  /// No description provided for @registerFormCardPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get registerFormCardPasswordPlaceholder;

  /// No description provided for @registerFormCardEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get registerFormCardEnterPassword;

  /// No description provided for @registerFormCardPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get registerFormCardPasswordTooShort;

  /// No description provided for @registerFormCardConfirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get registerFormCardConfirmPasswordLabel;

  /// No description provided for @registerFormCardConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get registerFormCardConfirmPassword;

  /// No description provided for @registerFormCardPasswordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get registerFormCardPasswordsDoNotMatch;

  /// No description provided for @registerFormCardCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerFormCardCreateAccount;

  /// No description provided for @registerFormCardHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get registerFormCardHaveAccount;

  /// No description provided for @registerFormCardSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get registerFormCardSignIn;

  /// No description provided for @registerFormCardTerms.
  ///
  /// In en, this message translates to:
  /// **'By signing up, you agree to our Terms of Service and Privacy Policy'**
  String get registerFormCardTerms;

  /// No description provided for @registerHeaderJoinMembers.
  ///
  /// In en, this message translates to:
  /// **'JOIN 10K+ MEMBERS'**
  String get registerHeaderJoinMembers;

  /// No description provided for @registerHeaderCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerHeaderCreateAccount;

  /// No description provided for @registerHeaderStartJourney.
  ///
  /// In en, this message translates to:
  /// **'Start your nutrition journey today 🥗'**
  String get registerHeaderStartJourney;

  /// No description provided for @registerSocialOrContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get registerSocialOrContinueWith;

  /// No description provided for @registerSocialGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get registerSocialGoogle;

  /// No description provided for @registerSocialApple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get registerSocialApple;

  /// No description provided for @passwordInputCardNewPassword.
  ///
  /// In en, this message translates to:
  /// **'NEW PASSWORD'**
  String get passwordInputCardNewPassword;

  /// No description provided for @passwordInputCardEnterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get passwordInputCardEnterNewPassword;

  /// No description provided for @passwordInputCardConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM PASSWORD'**
  String get passwordInputCardConfirmPassword;

  /// No description provided for @passwordInputCardReEnterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Re-enter new password'**
  String get passwordInputCardReEnterNewPassword;

  /// No description provided for @passwordInputCardStrength.
  ///
  /// In en, this message translates to:
  /// **'STRENGTH'**
  String get passwordInputCardStrength;

  /// No description provided for @passwordStrengthVeryWeak.
  ///
  /// In en, this message translates to:
  /// **'Very Weak'**
  String get passwordStrengthVeryWeak;

  /// No description provided for @passwordStrengthWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get passwordStrengthWeak;

  /// No description provided for @passwordStrengthFair.
  ///
  /// In en, this message translates to:
  /// **'Fair'**
  String get passwordStrengthFair;

  /// No description provided for @passwordStrengthStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get passwordStrengthStrong;

  /// No description provided for @passwordStrengthVeryStrong.
  ///
  /// In en, this message translates to:
  /// **'Very Strong'**
  String get passwordStrengthVeryStrong;

  /// No description provided for @passwordInputCardRequirements.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD REQUIREMENTS'**
  String get passwordInputCardRequirements;

  /// No description provided for @passwordInputCardPasswordsMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords match'**
  String get passwordInputCardPasswordsMatch;

  /// No description provided for @passwordInputCardPasswordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordInputCardPasswordsDoNotMatch;

  /// No description provided for @passwordInputCardResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get passwordInputCardResetPassword;

  /// No description provided for @passwordInputCardSecurityTip.
  ///
  /// In en, this message translates to:
  /// **'Use a strong, unique password that you don\'t use on other websites.'**
  String get passwordInputCardSecurityTip;

  /// No description provided for @resetPasswordHeaderSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Password Reset!'**
  String get resetPasswordHeaderSuccessTitle;

  /// No description provided for @resetPasswordHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordHeaderTitle;

  /// No description provided for @resetPasswordHeaderSuccessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your new password is ready '**
  String get resetPasswordHeaderSuccessSubtitle;

  /// No description provided for @resetPasswordHeaderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a strong new password '**
  String get resetPasswordHeaderSubtitle;

  /// No description provided for @resetPasswordHeaderStatusUpdated.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD UPDATED'**
  String get resetPasswordHeaderStatusUpdated;

  /// No description provided for @resetPasswordHeaderStatusCreate.
  ///
  /// In en, this message translates to:
  /// **'CREATE NEW PASSWORD'**
  String get resetPasswordHeaderStatusCreate;

  /// No description provided for @passwordRequirementLength.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get passwordRequirementLength;

  /// No description provided for @passwordRequirementUppercase.
  ///
  /// In en, this message translates to:
  /// **'Contains uppercase letter'**
  String get passwordRequirementUppercase;

  /// No description provided for @passwordRequirementLowercase.
  ///
  /// In en, this message translates to:
  /// **'Contains lowercase letter'**
  String get passwordRequirementLowercase;

  /// No description provided for @passwordRequirementNumber.
  ///
  /// In en, this message translates to:
  /// **'Contains number'**
  String get passwordRequirementNumber;

  /// No description provided for @passwordRequirementSpecial.
  ///
  /// In en, this message translates to:
  /// **'Contains special character'**
  String get passwordRequirementSpecial;

  /// No description provided for @resetPasswordProviderError.
  ///
  /// In en, this message translates to:
  /// **'Failed to reset password. Please try again.'**
  String get resetPasswordProviderError;

  /// No description provided for @successCardSecurityStatus.
  ///
  /// In en, this message translates to:
  /// **'Security Status'**
  String get successCardSecurityStatus;

  /// No description provided for @successCardPasswordUpdated.
  ///
  /// In en, this message translates to:
  /// **'Password Updated'**
  String get successCardPasswordUpdated;

  /// No description provided for @successCardProTip.
  ///
  /// In en, this message translates to:
  /// **'Pro tip: '**
  String get successCardProTip;

  /// No description provided for @successCardPasswordManagerTip.
  ///
  /// In en, this message translates to:
  /// **'Use a password manager to securely store your credentials.'**
  String get successCardPasswordManagerTip;

  /// No description provided for @successCardContinueToLogin.
  ///
  /// In en, this message translates to:
  /// **'Continue to Login'**
  String get successCardContinueToLogin;

  /// No description provided for @homePageFailedToLoad.
  ///
  /// In en, this message translates to:
  /// **'Failed to load data'**
  String get homePageFailedToLoad;

  /// No description provided for @greetingGoodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get greetingGoodMorning;

  /// No description provided for @greetingGoodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon'**
  String get greetingGoodAfternoon;

  /// No description provided for @greetingGoodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get greetingGoodEvening;

  /// No description provided for @greetingGoodNight.
  ///
  /// In en, this message translates to:
  /// **'Good Night'**
  String get greetingGoodNight;

  /// No description provided for @heroSectionProtein.
  ///
  /// In en, this message translates to:
  /// **'PROTEIN'**
  String get heroSectionProtein;

  /// No description provided for @macrosCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Macros'**
  String get macrosCardTitle;

  /// No description provided for @macrosCardCalories.
  ///
  /// In en, this message translates to:
  /// **'CALORIES'**
  String get macrosCardCalories;

  /// No description provided for @macrosCardProtein.
  ///
  /// In en, this message translates to:
  /// **'PROTEIN'**
  String get macrosCardProtein;

  /// No description provided for @macrosCardCarbs.
  ///
  /// In en, this message translates to:
  /// **'CARBS'**
  String get macrosCardCarbs;

  /// No description provided for @macrosCardFats.
  ///
  /// In en, this message translates to:
  /// **'FATS'**
  String get macrosCardFats;

  /// No description provided for @quickActionsAddMeal.
  ///
  /// In en, this message translates to:
  /// **'Add Meal'**
  String get quickActionsAddMeal;

  /// No description provided for @quickActionsAiPlan.
  ///
  /// In en, this message translates to:
  /// **'AI Plan'**
  String get quickActionsAiPlan;

  /// No description provided for @savedMealsTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved Meals'**
  String get savedMealsTitle;

  /// No description provided for @savedMealsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No saved Meals'**
  String get savedMealsEmpty;

  /// No description provided for @savedMealsProtein.
  ///
  /// In en, this message translates to:
  /// **' Protein'**
  String get savedMealsProtein;

  /// No description provided for @scheduleMealCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Schedule'**
  String get scheduleMealCardTitle;

  /// No description provided for @scheduleMealCardViewAll.
  ///
  /// In en, this message translates to:
  /// **'VIEW ALL'**
  String get scheduleMealCardViewAll;

  /// No description provided for @scheduleMealCardEmpty.
  ///
  /// In en, this message translates to:
  /// **'No meals scheduled'**
  String get scheduleMealCardEmpty;

  /// No description provided for @emptyNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'All Caught Up!'**
  String get emptyNotificationsTitle;

  /// No description provided for @emptyNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You have no new notifications'**
  String get emptyNotificationsSubtitle;

  /// No description provided for @notificationCardDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get notificationCardDelete;

  /// No description provided for @notificationHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationHeaderTitle;

  /// No description provided for @notificationHeaderMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark All Read'**
  String get notificationHeaderMarkAllRead;

  /// No description provided for @notificationHeaderUnread.
  ///
  /// In en, this message translates to:
  /// **'{count,plural, =1{1 new notification}other{{count} new notifications}}'**
  String notificationHeaderUnread(num count);

  /// No description provided for @nutritionDetailsError.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String nutritionDetailsError(Object error);

  /// No description provided for @nutritionDetailsUnknownDish.
  ///
  /// In en, this message translates to:
  /// **'Unknown Dish'**
  String get nutritionDetailsUnknownDish;

  /// No description provided for @nutritionDetailsInsight.
  ///
  /// In en, this message translates to:
  /// **'This meal is optimized for your daily nutrition goals. Track consistently for best results.'**
  String get nutritionDetailsInsight;

  /// No description provided for @nutritionDetailsNoInsight.
  ///
  /// In en, this message translates to:
  /// **'No insight available.'**
  String get nutritionDetailsNoInsight;

  /// No description provided for @nutritionDetailsSelectMealType.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one meal type'**
  String get nutritionDetailsSelectMealType;

  /// No description provided for @nutritionDetailsAddedToTodo.
  ///
  /// In en, this message translates to:
  /// **'Added to Todo List'**
  String get nutritionDetailsAddedToTodo;

  /// No description provided for @nutritionDetailsFailedToAdd.
  ///
  /// In en, this message translates to:
  /// **'Failed to add to Todo List'**
  String get nutritionDetailsFailedToAdd;

  /// No description provided for @nutritionDetailsMealType.
  ///
  /// In en, this message translates to:
  /// **'MEAL TYPE'**
  String get nutritionDetailsMealType;

  /// No description provided for @mealTypeBreakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get mealTypeBreakfast;

  /// No description provided for @mealTypeLunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get mealTypeLunch;

  /// No description provided for @mealTypeDinner.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get mealTypeDinner;

  /// No description provided for @scheduleMealDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule Meal'**
  String get scheduleMealDialogTitle;

  /// No description provided for @scheduleMealDialogSelectDays.
  ///
  /// In en, this message translates to:
  /// **'SELECT DAYS'**
  String get scheduleMealDialogSelectDays;

  /// No description provided for @scheduleMealDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get scheduleMealDialogCancel;

  /// No description provided for @scheduleMealDialogAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get scheduleMealDialogAdd;

  /// No description provided for @notificationMealTimeTitle.
  ///
  /// In en, this message translates to:
  /// **'🍽️ Time to eat!'**
  String get notificationMealTimeTitle;

  /// No description provided for @notificationMealTimeBody.
  ///
  /// In en, this message translates to:
  /// **'Your {dishName} is scheduled now.'**
  String notificationMealTimeBody(Object dishName);

  /// No description provided for @energyMixTitle.
  ///
  /// In en, this message translates to:
  /// **'ENERGY MIX'**
  String get energyMixTitle;

  /// No description provided for @energyMixBalanced.
  ///
  /// In en, this message translates to:
  /// **'BALANCED'**
  String get energyMixBalanced;

  /// No description provided for @energyMixProtein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get energyMixProtein;

  /// No description provided for @energyMixCarbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get energyMixCarbs;

  /// No description provided for @energyMixCalories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get energyMixCalories;

  /// No description provided for @ingredientsTitle.
  ///
  /// In en, this message translates to:
  /// **'INGREDIENTS'**
  String get ingredientsTitle;

  /// No description provided for @goalInsightCardQuote.
  ///
  /// In en, this message translates to:
  /// **'\"{insight}\"'**
  String goalInsightCardQuote(Object insight);

  /// No description provided for @nutritionBottomBarAddMeal.
  ///
  /// In en, this message translates to:
  /// **'ADD MEAL'**
  String get nutritionBottomBarAddMeal;

  /// No description provided for @nutritionListFailedToLoad.
  ///
  /// In en, this message translates to:
  /// **'Failed to load nutrition data'**
  String get nutritionListFailedToLoad;

  /// No description provided for @nutritionListNoData.
  ///
  /// In en, this message translates to:
  /// **'No nutrition data found'**
  String get nutritionListNoData;

  /// No description provided for @nutritionListNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results for \"{query}\"'**
  String nutritionListNoResults(Object query);

  /// No description provided for @nutritionListShowingResults.
  ///
  /// In en, this message translates to:
  /// **'Showing {visible} of {total} results'**
  String nutritionListShowingResults(Object total, Object visible);

  /// No description provided for @nutritionListLoadMore.
  ///
  /// In en, this message translates to:
  /// **'Load {count} more'**
  String nutritionListLoadMore(Object count);

  /// No description provided for @nutritionListRemaining.
  ///
  /// In en, this message translates to:
  /// **'{count} left'**
  String nutritionListRemaining(Object count);

  /// No description provided for @nutritionListAllResultsShown.
  ///
  /// In en, this message translates to:
  /// **'All {total} results shown'**
  String nutritionListAllResultsShown(Object total);

  /// No description provided for @nutritionListHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'Nutrition List'**
  String get nutritionListHeaderTitle;

  /// No description provided for @nutritionListHeaderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore detailed nutritional information\nfor various foods.'**
  String get nutritionListHeaderSubtitle;

  /// No description provided for @nutritionSearchBarHint.
  ///
  /// In en, this message translates to:
  /// **'Search meals or nutrients...'**
  String get nutritionSearchBarHint;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @onboardingContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingContinue;

  /// No description provided for @onboardingOf.
  ///
  /// In en, this message translates to:
  /// **' of '**
  String get onboardingOf;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Intake Helper'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Your personal nutrition companion for achieving your health goals'**
  String get onboardingWelcomeDescription;

  /// No description provided for @onboardingWelcomeFeature1.
  ///
  /// In en, this message translates to:
  /// **'Track your daily protein and macros'**
  String get onboardingWelcomeFeature1;

  /// No description provided for @onboardingWelcomeFeature2.
  ///
  /// In en, this message translates to:
  /// **'Get AI-powered nutrition insights'**
  String get onboardingWelcomeFeature2;

  /// No description provided for @onboardingWelcomeFeature3.
  ///
  /// In en, this message translates to:
  /// **'Build healthy eating habits'**
  String get onboardingWelcomeFeature3;

  /// No description provided for @onboardingTargetsTitle.
  ///
  /// In en, this message translates to:
  /// **'Set Your Targets'**
  String get onboardingTargetsTitle;

  /// No description provided for @onboardingTargetsDescription.
  ///
  /// In en, this message translates to:
  /// **'Define your daily nutrition goals and watch your progress'**
  String get onboardingTargetsDescription;

  /// No description provided for @onboardingTargetsFeature1.
  ///
  /// In en, this message translates to:
  /// **'Customize protein, carbs, and fat goals'**
  String get onboardingTargetsFeature1;

  /// No description provided for @onboardingTargetsFeature2.
  ///
  /// In en, this message translates to:
  /// **'Visual progress rings show your status'**
  String get onboardingTargetsFeature2;

  /// No description provided for @onboardingTargetsFeature3.
  ///
  /// In en, this message translates to:
  /// **'Weekly tracking charts'**
  String get onboardingTargetsFeature3;

  /// No description provided for @onboardingMealsTitle.
  ///
  /// In en, this message translates to:
  /// **'Track Your Meals'**
  String get onboardingMealsTitle;

  /// No description provided for @onboardingMealsDescription.
  ///
  /// In en, this message translates to:
  /// **'Log breakfast, lunch, dinner, and snacks with ease'**
  String get onboardingMealsDescription;

  /// No description provided for @onboardingMealsFeature1.
  ///
  /// In en, this message translates to:
  /// **'Quick meal logging with saved favorites'**
  String get onboardingMealsFeature1;

  /// No description provided for @onboardingMealsFeature2.
  ///
  /// In en, this message translates to:
  /// **'Barcode scanner for packaged foods'**
  String get onboardingMealsFeature2;

  /// No description provided for @onboardingMealsFeature3.
  ///
  /// In en, this message translates to:
  /// **'See completed, upcoming, and missed meals'**
  String get onboardingMealsFeature3;

  /// No description provided for @onboardingInsightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Get AI Insights'**
  String get onboardingInsightsTitle;

  /// No description provided for @onboardingInsightsDescription.
  ///
  /// In en, this message translates to:
  /// **'Receive personalized recommendations to optimize your nutrition'**
  String get onboardingInsightsDescription;

  /// No description provided for @onboardingInsightsFeature1.
  ///
  /// In en, this message translates to:
  /// **'AI analyzes your eating patterns'**
  String get onboardingInsightsFeature1;

  /// No description provided for @onboardingInsightsFeature2.
  ///
  /// In en, this message translates to:
  /// **'Personalized meal suggestions'**
  String get onboardingInsightsFeature2;

  /// No description provided for @onboardingInsightsFeature3.
  ///
  /// In en, this message translates to:
  /// **'Tips to reach your goals faster'**
  String get onboardingInsightsFeature3;

  /// No description provided for @onboardingStreakTitle.
  ///
  /// In en, this message translates to:
  /// **'Build Your Streak'**
  String get onboardingStreakTitle;

  /// No description provided for @onboardingStreakDescription.
  ///
  /// In en, this message translates to:
  /// **'Stay consistent and earn achievements for your dedication'**
  String get onboardingStreakDescription;

  /// No description provided for @onboardingStreakFeature1.
  ///
  /// In en, this message translates to:
  /// **'Track your consistency streak'**
  String get onboardingStreakFeature1;

  /// No description provided for @onboardingStreakFeature2.
  ///
  /// In en, this message translates to:
  /// **'Unlock badges and achievements'**
  String get onboardingStreakFeature2;

  /// No description provided for @onboardingStreakFeature3.
  ///
  /// In en, this message translates to:
  /// **'Celebrate your milestones'**
  String get onboardingStreakFeature3;

  /// No description provided for @onboardingPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'This is a placeholder for the onboarding content.'**
  String get onboardingPlaceholder;

  /// No description provided for @achievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsTitle;

  /// No description provided for @achievementsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No achievements yet'**
  String get achievementsEmpty;

  /// No description provided for @avatarModalTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose Avatar'**
  String get avatarModalTitle;

  /// No description provided for @avatarModalUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get avatarModalUpdate;

  /// No description provided for @logoutButton.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutButton;

  /// No description provided for @physicalStatsTitle.
  ///
  /// In en, this message translates to:
  /// **'Physical Stats'**
  String get physicalStatsTitle;

  /// No description provided for @physicalStatsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get physicalStatsEdit;

  /// No description provided for @physicalStatsHeight.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get physicalStatsHeight;

  /// No description provided for @physicalStatsWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get physicalStatsWeight;

  /// No description provided for @physicalStatsAge.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get physicalStatsAge;

  /// No description provided for @physicalStatsBodyFat.
  ///
  /// In en, this message translates to:
  /// **'Body Fat'**
  String get physicalStatsBodyFat;

  /// No description provided for @physicalStatsGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get physicalStatsGender;

  /// No description provided for @physicalStatsAdd.
  ///
  /// In en, this message translates to:
  /// **'Add your stats'**
  String get physicalStatsAdd;

  /// No description provided for @physicalStatsAddSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap to enter height, weight & more'**
  String get physicalStatsAddSubtitle;

  /// No description provided for @profileHeaderName.
  ///
  /// In en, this message translates to:
  /// **'Pranav'**
  String get profileHeaderName;

  /// No description provided for @profileHeaderMotto.
  ///
  /// In en, this message translates to:
  /// **'Consistency Builds Strength 💪'**
  String get profileHeaderMotto;

  /// No description provided for @reminderSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminder Settings'**
  String get reminderSettingsTitle;

  /// No description provided for @reminderSettingsDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily Reminder'**
  String get reminderSettingsDaily;

  /// No description provided for @reminderSettingsTapToChange.
  ///
  /// In en, this message translates to:
  /// **'Tap time below to change'**
  String get reminderSettingsTapToChange;

  /// No description provided for @reminderSettingsTurnOn.
  ///
  /// In en, this message translates to:
  /// **'Turn on to set a reminder'**
  String get reminderSettingsTurnOn;

  /// No description provided for @reminderSettingsTime.
  ///
  /// In en, this message translates to:
  /// **'Reminder Time'**
  String get reminderSettingsTime;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings & Preferences'**
  String get settingsTitle;

  /// No description provided for @settingsReminder.
  ///
  /// In en, this message translates to:
  /// **'Reminder Settings'**
  String get settingsReminder;

  /// No description provided for @settingsDailyAt.
  ///
  /// In en, this message translates to:
  /// **'Daily at '**
  String get settingsDailyAt;

  /// No description provided for @settingsOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get settingsOff;

  /// No description provided for @settingsUnits.
  ///
  /// In en, this message translates to:
  /// **'Units (kg/lbs)'**
  String get settingsUnits;

  /// No description provided for @settingsKilograms.
  ///
  /// In en, this message translates to:
  /// **'Kilograms'**
  String get settingsKilograms;

  /// No description provided for @settingsPounds.
  ///
  /// In en, this message translates to:
  /// **'Pounds'**
  String get settingsPounds;

  /// No description provided for @settingsDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settingsDarkMode;

  /// No description provided for @unitsTitle.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get unitsTitle;

  /// No description provided for @unitsKilograms.
  ///
  /// In en, this message translates to:
  /// **'Kilograms (kg)'**
  String get unitsKilograms;

  /// No description provided for @unitsPounds.
  ///
  /// In en, this message translates to:
  /// **'Pounds (lbs)'**
  String get unitsPounds;

  /// No description provided for @addDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Details'**
  String get addDetailsTitle;

  /// No description provided for @addDetailsEnterAge.
  ///
  /// In en, this message translates to:
  /// **'Enter your Age'**
  String get addDetailsEnterAge;

  /// No description provided for @addDetailsEnterWeight.
  ///
  /// In en, this message translates to:
  /// **'Enter your Weight (kg)'**
  String get addDetailsEnterWeight;

  /// No description provided for @addDetailsEnterHeight.
  ///
  /// In en, this message translates to:
  /// **'Enter your Height (cm)'**
  String get addDetailsEnterHeight;

  /// No description provided for @addDetailsSelectDob.
  ///
  /// In en, this message translates to:
  /// **'Select Date of Birth'**
  String get addDetailsSelectDob;

  /// No description provided for @addDetailsSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get addDetailsSave;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageHindi.
  ///
  /// In en, this message translates to:
  /// **'Hindi (हिंदी)'**
  String get languageHindi;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navMeals.
  ///
  /// In en, this message translates to:
  /// **'Meals'**
  String get navMeals;

  /// No description provided for @navNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get navNutrition;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
