// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get aiMealPlannerTitle => '✨ AI मील प्लानर';

  @override
  String get aiMealPlannerSorryMessage =>
      'क्षमा करें, मील प्लान तैयार नहीं हो सका।';

  @override
  String aiMealPlannerMealsSaved(Object count) {
    return '$count मील सेव हो गए!';
  }

  @override
  String get aiBubbleCopiedToClipboard => 'क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get aiBubbleThanksForFeedback => 'आपकी प्रतिक्रिया के लिए धन्यवाद!';

  @override
  String get aiBubbleMealName => 'मील का नाम';

  @override
  String get aiBubbleMealType => 'मील का प्रकार';

  @override
  String get aiBubbleQuantity => 'मात्रा';

  @override
  String get aiBubbleSteps => 'चरण';

  @override
  String get aiBubbleNutrition => 'पोषण';

  @override
  String get aiBubbleNutritionCaps => 'पोषण';

  @override
  String get chatInputBarHint => 'संपादित करें या नया प्रॉम्प्ट भेजें...';

  @override
  String get emptyStateViewBuildYourPerfect => 'अपना परफेक्ट';

  @override
  String get emptyStateViewMealPlan => 'मील प्लान बनाएं';

  @override
  String get emptyStateViewDescription =>
      'शुरू करने के लिए अपने लक्ष्य, आहार संबंधी ज़रूरतें,\nया पसंदीदा खाने का वर्णन करें।';

  @override
  String get mealPlanDialogTitle => 'सेव करने के लिए मील चुनें';

  @override
  String mealPlanDialogSelectedCount(Object selected, Object total) {
    return '$total में से $selected चुने गए';
  }

  @override
  String get mealPlanDialogClose => 'बंद करें';

  @override
  String get mealPlanDialogSaveSelected => 'चुने हुए सेव करें';

  @override
  String get selectableMealCardCalories => 'कैलोरी';

  @override
  String get selectableMealCardProtein => 'प्रोटीन';

  @override
  String get selectableMealCardCarbs => 'कार्ब्स';

  @override
  String get todoPageAll => 'सभी';

  @override
  String todoPageError(Object error) {
    return 'त्रुटि: $error';
  }

  @override
  String get todoPageNoMealsPlanned => 'इस दिन के लिए कोई मील प्लान नहीं है';

  @override
  String todoPageNoMealsInCategory(Object category) {
    return 'इस दिन कोई $category मील नहीं है';
  }

  @override
  String get todoPageNoMealsScheduled =>
      'आज के लिए कोई मील शेड्यूल नहीं है 🍽️';

  @override
  String get todoPageAllMealsDone =>
      'सभी मील पूरे हो गए! आज बहुत अच्छा किया 🎉';

  @override
  String todoPageProgressMessage(Object progress) {
    return 'आप आज के लक्ष्य से $progress% करीब हैं 💪';
  }

  @override
  String get mealActionDialogTitle => 'मील क्रिया';

  @override
  String get mealActionDialogQuestion => 'आप क्या करना चाहेंगे?';

  @override
  String get mealActionDialogMarkAsCompleted => 'पूर्ण के रूप में चिह्नित करें';

  @override
  String get mealActionDialogConfirmCompletion =>
      'आज के लिए पूर्णता की पुष्टि करें';

  @override
  String get mealActionDialogDeleteMeal => 'मील हटाएं';

  @override
  String get mealActionDialogRemoveMeal => 'इस मील को अपने प्लान से हटाएं';

  @override
  String get mealActionDialogCancel => 'रद्द करें';

  @override
  String get todoAlertBannerLunch => '20 मिनट में लंच';

  @override
  String get todoAlertBannerMarkDone => 'पूर्ण चिह्नित करें';

  @override
  String get todoAlertBannerSnooze => 'स्नूज़ करें';

  @override
  String get todoAppBarTitle => 'आज के मील';

  @override
  String todoAppBarStreak(Object streak) {
    return '$streak दिन की स्ट्रीक';
  }

  @override
  String todoAppBarProgress(Object completed, Object total) {
    return '$completed / $total पूर्ण';
  }

  @override
  String get monthJanuary => 'जनवरी';

  @override
  String get monthFebruary => 'फरवरी';

  @override
  String get monthMarch => 'मार्च';

  @override
  String get monthApril => 'अप्रैल';

  @override
  String get monthMay => 'मई';

  @override
  String get monthJune => 'जून';

  @override
  String get monthJuly => 'जुलाई';

  @override
  String get monthAugust => 'अगस्त';

  @override
  String get monthSeptember => 'सितंबर';

  @override
  String get monthOctober => 'अक्टूबर';

  @override
  String get monthNovember => 'नवंबर';

  @override
  String get monthDecember => 'दिसंबर';

  @override
  String get quickSelectToday => 'आज';

  @override
  String get quickSelectYesterday => 'कल';

  @override
  String get quickSelectLastWeek => 'पिछला सप्ताह';

  @override
  String get categoryAll => 'सभी';

  @override
  String get categoryBreakfast => 'नाश्ता';

  @override
  String get categoryLunch => 'दोपहर का खाना';

  @override
  String get categoryDinner => 'रात का खाना';

  @override
  String completedMealCardProtein(Object protein) {
    return '+$proteinग्राम प्रोटीन';
  }

  @override
  String activeMealCardActiveNow(Object time) {
    return '$time · अभी सक्रिय';
  }

  @override
  String activeMealCardMacrosKg(Object calories, Object protein) {
    return '$protein ग्राम प्रोटीन · $calories किलोकैलोरी';
  }

  @override
  String activeMealCardMacrosLb(Object calories, Object protein) {
    return '$protein पाउंड प्रोटीन · $calories किलोकैलोरी';
  }

  @override
  String get missedMealCardMissed => 'छूट गया';

  @override
  String upcomingMealCardMacros(Object calories, Object protein) {
    return '$proteinग्राम प्रोटीन · $calories किलोकैलोरी';
  }

  @override
  String get upcomingMealCardTonight => 'आज रात';

  @override
  String todoProgressBarMealsCompleted(Object completed, Object total) {
    return '$completed/$total मील पूर्ण';
  }

  @override
  String get emailVerificationTitle => 'ईमेल सत्यापित करें';

  @override
  String get emailVerificationCheckInbox =>
      'शुरू करने के लिए अपना इनबॉक्स जांचें ';

  @override
  String get emailVerificationPending => 'सत्यापन लंबित';

  @override
  String get emailVerificationEmailLabel => 'ईमेल';

  @override
  String get emailVerificationSent => 'भेजा गया';

  @override
  String get emailVerificationLinkSent =>
      'एक सत्यापन लिंक भेजा गया है। अपना खाता सक्रिय करने के लिए उस पर क्लिक करें।';

  @override
  String get emailVerificationStepCheckInbox => 'इनबॉक्स जांचें';

  @override
  String get emailVerificationStepClickLink => 'लिंक पर क्लिक करें';

  @override
  String get emailVerificationStepVerified => 'सत्यापित';

  @override
  String get emailVerificationGoToLogin => 'लॉगिन पर जाएं';

  @override
  String get emailVerificationOrContinueWith => 'या इसके साथ जारी रखें';

  @override
  String get emailVerificationDidNotReceive => 'ईमेल नहीं मिला? ';

  @override
  String get emailVerificationResent => 'भेजा गया ✓';

  @override
  String get emailVerificationResend => 'पुनः भेजें';

  @override
  String get emailVerificationNeedHelp => 'सहायता चाहिए? ';

  @override
  String get emailVerificationContactSupport => 'सहायता से संपर्क करें';

  @override
  String get emailSentMessageTitle => 'अपना ईमेल सत्यापित करें';

  @override
  String get emailSentMessageLinkSentTo => 'एक सत्यापन लिंक भेजा गया है';

  @override
  String get emailSentMessageCheckInbox =>
      'कृपया अपना इनबॉक्स जांचें और अपना खाता सत्यापित करने के लिए लिंक पर क्लिक करें।';

  @override
  String get forgotPasswordEnterEmail => 'कृपया अपना ईमेल दर्ज करें';

  @override
  String get forgotPasswordInvalidEmail => 'कृपया एक वैध ईमेल दर्ज करें';

  @override
  String get forgotPasswordSendResetLink => 'रीसेट लिंक भेजें';

  @override
  String get emailInputCardEmailLabel => 'ईमेल';

  @override
  String get emailInputCardEnterEmail => 'अपना ईमेल दर्ज करें';

  @override
  String get forgotPasswordTryAnotherEmail => 'दूसरा ईमेल आज़माएं';

  @override
  String get forgotPasswordRememberPassword => 'पासवर्ड याद है?  ';

  @override
  String get forgotPasswordSignIn => 'साइन इन करें';

  @override
  String get forgotPasswordOrContinueWith => 'या इसके साथ जारी रखें';

  @override
  String get forgotPasswordHeaderCheckInbox => 'इनबॉक्स जांचें';

  @override
  String get forgotPasswordHeaderTitle => 'पासवर्ड भूल गए?';

  @override
  String get forgotPasswordHeaderResetLinkSent =>
      'रीसेट लिंक आपके ईमेल पर भेजा गया ';

  @override
  String get forgotPasswordHeaderEnterEmailToReset =>
      'पासवर्ड रीसेट करने के लिए अपना ईमेल दर्ज करें ';

  @override
  String get forgotPasswordHeaderEmailSent => 'ईमेल भेजा गया';

  @override
  String get forgotPasswordHeaderPasswordReset => 'पासवर्ड रीसेट';

  @override
  String get forgotPasswordProviderError =>
      'कुछ गलत हो गया। कृपया पुनः प्रयास करें।';

  @override
  String get successInfoCardWhatsNext => 'आगे क्या?';

  @override
  String get successInfoCardCheckInbox =>
      'अपना इनबॉक्स और स्पैम फ़ोल्डर जांचें';

  @override
  String get successInfoCardClickResetLink =>
      'ईमेल में रीसेट लिंक पर क्लिक करें';

  @override
  String get successInfoCardCreateNewPassword =>
      'एक नया सुरक्षित पासवर्ड बनाएं';

  @override
  String get successInfoCardBackToLogin => 'लॉगिन पर वापस जाएं';

  @override
  String get loginPageFillAllFields => 'कृपया सभी फ़ील्ड भरें।';

  @override
  String get loginPageInvalidCredentials => 'अमान्य ईमेल या पासवर्ड।';

  @override
  String get loginPageGenericError => 'कुछ गलत हो गया। कृपया पुनः प्रयास करें।';

  @override
  String get loginFormCardEmailLabel => 'ईमेल';

  @override
  String get loginFormCardEmailPlaceholder => 'you@example.com';

  @override
  String get loginFormCardEnterEmail => 'कृपया अपना ईमेल दर्ज करें';

  @override
  String get loginFormCardInvalidEmail => 'कृपया एक वैध ईमेल दर्ज करें';

  @override
  String get loginFormCardPasswordLabel => 'पासवर्ड';

  @override
  String get loginFormCardPasswordPlaceholder => '••••••••';

  @override
  String get loginFormCardEnterPassword => 'कृपया अपना पासवर्ड दर्ज करें';

  @override
  String get loginFormCardPasswordTooShort =>
      'पासवर्ड कम से कम 6 अक्षर का होना चाहिए';

  @override
  String get loginFormCardForgotPassword => 'पासवर्ड भूल गए?';

  @override
  String get loginFormCardSignIn => 'साइन इन करें';

  @override
  String get loginFormCardNoAccount => 'खाता नहीं है? ';

  @override
  String get loginFormCardRegister => 'पंजीकरण करें';

  @override
  String get loginHeaderSystemOnline => 'सिस्टम ऑनलाइन';

  @override
  String get loginHeaderWelcomeBack => 'वापस स्वागत है';

  @override
  String get loginHeaderSignInToContinue =>
      'अपनी यात्रा जारी रखने के लिए साइन इन करें 💪';

  @override
  String get socialLoginOrContinueWith => 'या इसके साथ जारी रखें';

  @override
  String get socialLoginGoogle => 'Google';

  @override
  String get socialLoginApple => 'Apple';

  @override
  String get registerPageGenericError =>
      'कुछ गलत हो गया। कृपया पुनः प्रयास करें।';

  @override
  String get registerFormCardFullNameLabel => 'पूरा नाम';

  @override
  String get registerFormCardFullNamePlaceholder => 'नाम दर्ज करें';

  @override
  String get registerFormCardEnterFullName => 'कृपया अपना पूरा नाम दर्ज करें';

  @override
  String get registerFormCardEmailLabel => 'ईमेल';

  @override
  String get registerFormCardEmailPlaceholder => 'you@example.com';

  @override
  String get registerFormCardEnterEmail => 'कृपया अपना ईमेल दर्ज करें';

  @override
  String get registerFormCardInvalidEmail => 'कृपया एक वैध ईमेल दर्ज करें';

  @override
  String get registerFormCardPasswordLabel => 'पासवर्ड';

  @override
  String get registerFormCardPasswordPlaceholder => '••••••••';

  @override
  String get registerFormCardEnterPassword => 'कृपया अपना पासवर्ड दर्ज करें';

  @override
  String get registerFormCardPasswordTooShort =>
      'पासवर्ड कम से कम 6 अक्षर का होना चाहिए';

  @override
  String get registerFormCardConfirmPasswordLabel => 'पासवर्ड की पुष्टि करें';

  @override
  String get registerFormCardConfirmPassword =>
      'कृपया अपने पासवर्ड की पुष्टि करें';

  @override
  String get registerFormCardPasswordsDoNotMatch => 'पासवर्ड मेल नहीं खाते';

  @override
  String get registerFormCardCreateAccount => 'खाता बनाएं';

  @override
  String get registerFormCardHaveAccount => 'पहले से खाता है? ';

  @override
  String get registerFormCardSignIn => 'साइन इन करें';

  @override
  String get registerFormCardTerms =>
      'साइन अप करके, आप हमारी सेवा की शर्तें और गोपनीयता नीति से सहमत होते हैं';

  @override
  String get registerHeaderJoinMembers => '10 हज़ार+ सदस्यों से जुड़ें';

  @override
  String get registerHeaderCreateAccount => 'खाता बनाएं';

  @override
  String get registerHeaderStartJourney => 'आज अपनी पोषण यात्रा शुरू करें 🥗';

  @override
  String get registerSocialOrContinueWith => 'या इसके साथ जारी रखें';

  @override
  String get registerSocialGoogle => 'Google';

  @override
  String get registerSocialApple => 'Apple';

  @override
  String get passwordInputCardNewPassword => 'नया पासवर्ड';

  @override
  String get passwordInputCardEnterNewPassword => 'नया पासवर्ड दर्ज करें';

  @override
  String get passwordInputCardConfirmPassword => 'पासवर्ड की पुष्टि करें';

  @override
  String get passwordInputCardReEnterNewPassword =>
      'नया पासवर्ड फिर से दर्ज करें';

  @override
  String get passwordInputCardStrength => 'मज़बूती';

  @override
  String get passwordStrengthVeryWeak => 'बहुत कमज़ोर';

  @override
  String get passwordStrengthWeak => 'कमज़ोर';

  @override
  String get passwordStrengthFair => 'ठीक-ठाक';

  @override
  String get passwordStrengthStrong => 'मज़बूत';

  @override
  String get passwordStrengthVeryStrong => 'बहुत मज़बूत';

  @override
  String get passwordInputCardRequirements => 'पासवर्ड की आवश्यकताएं';

  @override
  String get passwordInputCardPasswordsMatch => 'पासवर्ड मेल खाते हैं';

  @override
  String get passwordInputCardPasswordsDoNotMatch => 'पासवर्ड मेल नहीं खाते';

  @override
  String get passwordInputCardResetPassword => 'पासवर्ड रीसेट करें';

  @override
  String get passwordInputCardSecurityTip =>
      'एक मज़बूत, अद्वितीय पासवर्ड का उपयोग करें जो आप अन्य वेबसाइटों पर नहीं उपयोग करते।';

  @override
  String get resetPasswordHeaderSuccessTitle => 'पासवर्ड रीसेट हो गया!';

  @override
  String get resetPasswordHeaderTitle => 'पासवर्ड रीसेट करें';

  @override
  String get resetPasswordHeaderSuccessSubtitle => 'आपका नया पासवर्ड तैयार है ';

  @override
  String get resetPasswordHeaderSubtitle => 'एक मज़बूत नया पासवर्ड बनाएं ';

  @override
  String get resetPasswordHeaderStatusUpdated => 'पासवर्ड अपडेट हो गया';

  @override
  String get resetPasswordHeaderStatusCreate => 'नया पासवर्ड बनाएं';

  @override
  String get passwordRequirementLength => 'कम से कम 8 अक्षर';

  @override
  String get passwordRequirementUppercase => 'बड़े अक्षर शामिल हैं';

  @override
  String get passwordRequirementLowercase => 'छोटे अक्षर शामिल हैं';

  @override
  String get passwordRequirementNumber => 'संख्या शामिल है';

  @override
  String get passwordRequirementSpecial => 'विशेष वर्ण शामिल है';

  @override
  String get resetPasswordProviderError =>
      'पासवर्ड रीसेट नहीं हो सका। कृपया पुनः प्रयास करें।';

  @override
  String get successCardSecurityStatus => 'सुरक्षा स्थिति';

  @override
  String get successCardPasswordUpdated => 'पासवर्ड अपडेट हो गया';

  @override
  String get successCardProTip => 'प्रो टिप: ';

  @override
  String get successCardPasswordManagerTip =>
      'अपनी क्रेडेंशियल्स को सुरक्षित रूप से संग्रहीत करने के लिए पासवर्ड मैनेजर का उपयोग करें।';

  @override
  String get successCardContinueToLogin => 'लॉगिन पर जाएं';

  @override
  String get homePageFailedToLoad => 'डेटा लोड नहीं हो सका';

  @override
  String get greetingGoodMorning => 'सुप्रभात';

  @override
  String get greetingGoodAfternoon => 'नमस्कार';

  @override
  String get greetingGoodEvening => 'शुभ संध्या';

  @override
  String get greetingGoodNight => 'शुभ रात्रि';

  @override
  String get heroSectionProtein => 'प्रोटीन';

  @override
  String get macrosCardTitle => 'आज के मैक्रोज़';

  @override
  String get macrosCardCalories => 'कैलोरी';

  @override
  String get macrosCardProtein => 'प्रोटीन';

  @override
  String get macrosCardCarbs => 'कार्ब्स';

  @override
  String get macrosCardFats => 'वसा';

  @override
  String get quickActionsAddMeal => 'मील जोड़ें';

  @override
  String get quickActionsAiPlan => 'AI प्लान';

  @override
  String get savedMealsTitle => 'सेव किए गए मील';

  @override
  String get savedMealsEmpty => 'कोई सेव किया हुआ मील नहीं';

  @override
  String get savedMealsProtein => ' प्रोटीन';

  @override
  String get scheduleMealCardTitle => 'आज का शेड्यूल';

  @override
  String get scheduleMealCardViewAll => 'सभी देखें';

  @override
  String get scheduleMealCardEmpty => 'कोई मील शेड्यूल नहीं है';

  @override
  String get emptyNotificationsTitle => 'सब ठीक है!';

  @override
  String get emptyNotificationsSubtitle => 'आपके पास कोई नई सूचना नहीं है';

  @override
  String get notificationCardDelete => 'हटाएं';

  @override
  String get notificationHeaderTitle => 'सूचनाएं';

  @override
  String get notificationHeaderMarkAllRead => 'सभी पढ़ा हुआ चिह्नित करें';

  @override
  String notificationHeaderUnread(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count नई सूचनाएं',
      one: '1 नई सूचना',
    );
    return '$_temp0';
  }

  @override
  String nutritionDetailsError(Object error) {
    return 'त्रुटि: $error';
  }

  @override
  String get nutritionDetailsUnknownDish => 'अज्ञात व्यंजन';

  @override
  String get nutritionDetailsInsight =>
      'यह मील आपके दैनिक पोषण लक्ष्यों के लिए अनुकूलित है। सर्वोत्तम परिणामों के लिए लगातार ट्रैक करें।';

  @override
  String get nutritionDetailsNoInsight => 'कोई जानकारी उपलब्ध नहीं है।';

  @override
  String get nutritionDetailsSelectMealType =>
      'कृपया कम से कम एक मील प्रकार चुनें';

  @override
  String get nutritionDetailsAddedToTodo => 'टू-डू लिस्ट में जोड़ा गया';

  @override
  String get nutritionDetailsFailedToAdd => 'टू-डू लिस्ट में जोड़ने में विफल';

  @override
  String get nutritionDetailsMealType => 'मील का प्रकार';

  @override
  String get mealTypeBreakfast => 'नाश्ता';

  @override
  String get mealTypeLunch => 'दोपहर का खाना';

  @override
  String get mealTypeDinner => 'रात का खाना';

  @override
  String get scheduleMealDialogTitle => 'मील शेड्यूल करें';

  @override
  String get scheduleMealDialogSelectDays => 'दिन चुनें';

  @override
  String get scheduleMealDialogCancel => 'रद्द करें';

  @override
  String get scheduleMealDialogAdd => 'जोड़ें';

  @override
  String get notificationMealTimeTitle => '🍽️ खाने का समय!';

  @override
  String notificationMealTimeBody(Object dishName) {
    return 'आपका $dishName अभी शेड्यूल है।';
  }

  @override
  String get energyMixTitle => 'ऊर्जा मिश्रण';

  @override
  String get energyMixBalanced => 'संतुलित';

  @override
  String get energyMixProtein => 'प्रोटीन';

  @override
  String get energyMixCarbs => 'कार्ब्स';

  @override
  String get energyMixCalories => 'कैलोरी';

  @override
  String get ingredientsTitle => 'सामग्री';

  @override
  String goalInsightCardQuote(Object insight) {
    return '\"$insight\"';
  }

  @override
  String get nutritionBottomBarAddMeal => 'मील जोड़ें';

  @override
  String get nutritionListFailedToLoad => 'पोषण डेटा लोड नहीं हो सका';

  @override
  String get nutritionListNoData => 'कोई पोषण डेटा नहीं मिला';

  @override
  String nutritionListNoResults(Object query) {
    return '\"$query\" के लिए कोई परिणाम नहीं';
  }

  @override
  String nutritionListShowingResults(Object total, Object visible) {
    return '$total में से $visible परिणाम दिखाए जा रहे हैं';
  }

  @override
  String nutritionListLoadMore(Object count) {
    return '$count और लोड करें';
  }

  @override
  String nutritionListRemaining(Object count) {
    return '$count बाकी';
  }

  @override
  String nutritionListAllResultsShown(Object total) {
    return 'सभी $total परिणाम दिखाए गए';
  }

  @override
  String get nutritionListHeaderTitle => 'पोषण सूची';

  @override
  String get nutritionListHeaderSubtitle =>
      'विभिन्न खाद्य पदार्थों की विस्तृत पोषण संबंधी जानकारी\nखोजें।';

  @override
  String get nutritionSearchBarHint => 'मील या पोषक तत्व खोजें...';

  @override
  String get onboardingGetStarted => 'शुरू करें';

  @override
  String get onboardingContinue => 'जारी रखें';

  @override
  String get onboardingOf => ' में से ';

  @override
  String get onboardingSkip => 'छोड़ें';

  @override
  String get onboardingWelcomeTitle => 'Intake Helper में आपका स्वागत है';

  @override
  String get onboardingWelcomeDescription =>
      'आपके स्वास्थ्य लक्ष्यों को प्राप्त करने के लिए आपका व्यक्तिगत पोषण साथी';

  @override
  String get onboardingWelcomeFeature1 =>
      'अपने दैनिक प्रोटीन और मैक्रोज़ ट्रैक करें';

  @override
  String get onboardingWelcomeFeature2 =>
      'AI-संचालित पोषण संबंधी जानकारी प्राप्त करें';

  @override
  String get onboardingWelcomeFeature3 => 'स्वस्थ खाने की आदतें बनाएं';

  @override
  String get onboardingTargetsTitle => 'अपने लक्ष्य निर्धारित करें';

  @override
  String get onboardingTargetsDescription =>
      'अपने दैनिक पोषण लक्ष्य निर्धारित करें और अपनी प्रगति देखें';

  @override
  String get onboardingTargetsFeature1 =>
      'प्रोटीन, कार्ब्स और वसा के लक्ष्य अनुकूलित करें';

  @override
  String get onboardingTargetsFeature2 =>
      'विज़ुअल प्रगति रिंग आपकी स्थिति दिखाती हैं';

  @override
  String get onboardingTargetsFeature3 => 'साप्ताहिक ट्रैकिंग चार्ट';

  @override
  String get onboardingMealsTitle => 'अपने मील ट्रैक करें';

  @override
  String get onboardingMealsDescription =>
      'नाश्ता, दोपहर का खाना, रात का खाना और स्नैक्स आसानी से लॉग करें';

  @override
  String get onboardingMealsFeature1 =>
      'सेव किए गए पसंदीदा के साथ त्वरित मील लॉगिंग';

  @override
  String get onboardingMealsFeature2 =>
      'पैकेज्ड खाद्य पदार्थों के लिए बारकोड स्कैनर';

  @override
  String get onboardingMealsFeature3 => 'पूर्ण, आगामी और छूटे हुए मील देखें';

  @override
  String get onboardingInsightsTitle => 'AI जानकारी प्राप्त करें';

  @override
  String get onboardingInsightsDescription =>
      'अपने पोषण को अनुकूलित करने के लिए व्यक्तिगत सिफारिशें प्राप्त करें';

  @override
  String get onboardingInsightsFeature1 =>
      'AI आपके खाने के पैटर्न का विश्लेषण करता है';

  @override
  String get onboardingInsightsFeature2 => 'व्यक्तिगत मील सुझाव';

  @override
  String get onboardingInsightsFeature3 =>
      'अपने लक्ष्यों तक जल्दी पहुंचने के टिप्स';

  @override
  String get onboardingStreakTitle => 'अपनी स्ट्रीक बनाएं';

  @override
  String get onboardingStreakDescription =>
      'निरंतर रहें और अपनी लगन के लिए उपलब्धियां अर्जित करें';

  @override
  String get onboardingStreakFeature1 => 'अपनी निरंतरता स्ट्रीक ट्रैक करें';

  @override
  String get onboardingStreakFeature2 => 'बैज और उपलब्धियां अनलॉक करें';

  @override
  String get onboardingStreakFeature3 => 'अपने मील के पत्थर मनाएं';

  @override
  String get onboardingPlaceholder =>
      'यह ऑनबोर्डिंग सामग्री के लिए एक प्लेसहोल्डर है।';

  @override
  String get achievementsTitle => 'उपलब्धियां';

  @override
  String get achievementsEmpty => 'अभी तक कोई उपलब्धि नहीं';

  @override
  String get avatarModalTitle => 'अवतार चुनें';

  @override
  String get avatarModalUpdate => 'अपडेट करें';

  @override
  String get logoutButton => 'लॉगआउट';

  @override
  String get physicalStatsTitle => 'शारीरिक आंकड़े';

  @override
  String get physicalStatsEdit => 'संपादित करें';

  @override
  String get physicalStatsHeight => 'ऊंचाई';

  @override
  String get physicalStatsWeight => 'वज़न';

  @override
  String get physicalStatsAge => 'आयु';

  @override
  String get physicalStatsBodyFat => 'शरीर की वसा';

  @override
  String get physicalStatsGender => 'लिंग';

  @override
  String get physicalStatsAdd => 'अपने आंकड़े जोड़ें';

  @override
  String get physicalStatsAddSubtitle =>
      'ऊंचाई, वज़न और अधिक दर्ज करने के लिए टैप करें';

  @override
  String get profileHeaderName => 'Pranav';

  @override
  String get profileHeaderMotto => 'निरंतरता से शक्ति बनती है 💪';

  @override
  String get reminderSettingsTitle => 'रिमाइंडर सेटिंग्स';

  @override
  String get reminderSettingsDaily => 'दैनिक रिमाइंडर';

  @override
  String get reminderSettingsTapToChange => 'बदलने के लिए नीचे समय पर टैप करें';

  @override
  String get reminderSettingsTurnOn => 'रिमाइंडर सेट करने के लिए चालू करें';

  @override
  String get reminderSettingsTime => 'रिमाइंडर का समय';

  @override
  String get settingsTitle => 'सेटिंग्स और प्राथमिकताएं';

  @override
  String get settingsReminder => 'रिमाइंडर सेटिंग्स';

  @override
  String get settingsDailyAt => 'प्रतिदिन ';

  @override
  String get settingsOff => 'बंद';

  @override
  String get settingsUnits => 'इकाइयां (किग्रा/पाउंड)';

  @override
  String get settingsKilograms => 'किलोग्राम';

  @override
  String get settingsPounds => 'पाउंड';

  @override
  String get settingsDarkMode => 'डार्क मोड';

  @override
  String get unitsTitle => 'इकाइयां';

  @override
  String get unitsKilograms => 'किलोग्राम (kg)';

  @override
  String get unitsPounds => 'पाउंड (lbs)';

  @override
  String get addDetailsTitle => 'विवरण जोड़ें';

  @override
  String get addDetailsEnterAge => 'अपनी आयु दर्ज करें';

  @override
  String get addDetailsEnterWeight => 'अपना वज़न दर्ज करें (kg)';

  @override
  String get addDetailsEnterHeight => 'अपनी ऊंचाई दर्ज करें (cm)';

  @override
  String get addDetailsSelectDob => 'जन्म तिथि चुनें';

  @override
  String get addDetailsSave => 'सेव करें';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageHindi => 'Hindi (हिंदी)';

  @override
  String get navHome => 'होम';

  @override
  String get navMeals => 'मील';

  @override
  String get navNutrition => 'पोषण';

  @override
  String get navProfile => 'प्रोफाइल';
}
