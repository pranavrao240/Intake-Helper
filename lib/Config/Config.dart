import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  final String firebaseProjectId = dotenv.get('PROJECT_ID');
  // static const String baseUrl = "https://intake-helper-app-api.vercel.app";
  static const String baseUrl = "http://192.168.0.106:3000";
  // static const String baseUrl = "http://10.218.70.240:3000";
  static const String nutritionAPI = "api/nutrition/import";
  static const String detailAPI = "api/nutrition/";
  static const String nutritionDetailAPI = "api/nutrition";

  static const String getSavedNutritionAPI = "api/nutrition/saved";
  static const String changeSavedStateAPI = "api/nutrition/saved";

  static const String streakAPI = "api/streak";
  static const String updateStreakAPI = "api/streak/update";
  static const String resetStreakAPI = "api/streak/reset";

  static const String appName = "Intake Helper";
  static const String loginAPI = "api/login";
  static const String registerAPI = "api/register";
  static const String resetTodoAPI = "api/reset-todos";
  static const String todoAPI = "api/todos";
  static const String changeStatusAPI = "api/change-status";
  static const String statusTodosAPI = "api/status-todos";
  static const String profileAPI = "api/profile";

  static const String notificationAPI = "api/notifications";

  static String get firebaseMessagingAPI =>
      "https://fcm.googleapis.com/v1/projects/${Config().firebaseProjectId}/messages:send";

  //OpenAI Apis
  static const String getOpenAiResponse = "https://api.openai.com/v1/responses";

  static const String verifyEmailAPI = "api/verify-email";

  static const String resetPasswordAPI = "api/reset-password";
  static const String forgotPasswordAPI = "api/forgot-password";
}
