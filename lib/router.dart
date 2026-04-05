import 'package:go_router/go_router.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/ai_meal_planner_screen.dart';
import 'package:intake_helper/pages/auth/email%20verfication/email_verification_page.dart';
import 'package:intake_helper/pages/auth/forgot%20page/forgot_password_page.dart';
import 'package:intake_helper/pages/auth/reset%20password/reset_password_page.dart';
import 'package:intake_helper/pages/notifications/notifications_page.dart';
import 'package:intake_helper/pages/on%20boarding/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'pages/home page/HomePage.dart';
import 'pages/auth/login/Login_page.dart';
import 'pages/auth/register/register_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/Todos/todo_page.dart';
import 'pages/nutritions/nutrition list/nutritionScreen.dart';
import 'pages/nutritions/nutrition details/nutritionDetailsScreen.dart';

class AppRoute {
  const AppRoute({required this.path, required this.name});
  final String path;
  final String name;
}

class RouteConstants {
  static const login = AppRoute(path: '/login', name: 'login');
  static const register = AppRoute(path: '/register', name: 'register');
  static const emailVerification =
      AppRoute(path: '/email-verification', name: 'email-verification');
  static const forgotPassword =
      AppRoute(path: '/forgot-password', name: 'forgot-password');
  static const resetPassword =
      AppRoute(path: '/reset-password', name: 'reset-password');

  static const home = AppRoute(path: '/home', name: 'home');
  static const onboarding = AppRoute(path: '/onboarding', name: 'onboarding');
  static const profile = AppRoute(path: '/profile', name: 'profile');
  static const todo = AppRoute(path: '/todo', name: 'todo');
  static const nutrition = AppRoute(path: '/nutrition', name: 'nutrition');
  static const notification =
      AppRoute(path: '/notification', name: 'notification');
  static const mealDetails =
      AppRoute(path: '/meal-details', name: 'meal-details');
  static const aiMealPlanner =
      AppRoute(path: '/ai-meal-planner', name: 'ai-meal-planner');
}

const _kOnboardingKey = 'hasSeenOnboarding';

Future<bool> hasSeenOnboarding() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(_kOnboardingKey) ?? false;
}

Future<void> markOnboardingSeen() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(_kOnboardingKey, true);
}

Future<bool> isTokenExpired() async {
  final prefs = await SharedPreferences.getInstance();
  final expiryTime = prefs.getInt('token_expiry');
  if (expiryTime == null) return true;

  final now = DateTime.now().millisecondsSinceEpoch;
  return now > expiryTime;
}

Future<bool> isUserLoggedIn() async {
  try {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    if (token == null || token.isEmpty) {
      return false;
    }

    return true;
  } on Exception {
    return false;
  }
}

final publicRoutes = [
  RouteConstants.login.path,
  RouteConstants.register.path,
  RouteConstants.forgotPassword.path,
  RouteConstants.resetPassword.path,
  RouteConstants.emailVerification.path,
];

final protectedRoutes = [
  RouteConstants.home.path,
  RouteConstants.profile.path,
  RouteConstants.todo.path,
  RouteConstants.nutrition.path,
  RouteConstants.mealDetails.path,
  RouteConstants.aiMealPlanner.path,
  RouteConstants.notification.path,
];

final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: RouteConstants.login.path,
  redirect: (context, state) async {
    final isLoggedIn = await isUserLoggedIn();
    final onboardingDone = await hasSeenOnboarding();
    final path = state.uri.path;

    if (!isLoggedIn && protectedRoutes.contains(path)) {
      return RouteConstants.login.path;
    }

    if (isLoggedIn &&
        !onboardingDone &&
        path != RouteConstants.onboarding.path) {
      return RouteConstants.onboarding.path;
    }

    if (isLoggedIn &&
        onboardingDone &&
        publicRoutes.contains(path) &&
        path != RouteConstants.emailVerification.path) {
      return RouteConstants.home.path;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: RouteConstants.onboarding.path,
      name: RouteConstants.onboarding.name,
      builder: (_, __) => const OnboardingPage(),
    ),
    GoRoute(
      path: RouteConstants.login.path,
      name: RouteConstants.login.name,
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: RouteConstants.register.path,
      name: RouteConstants.register.name,
      builder: (_, __) => const RegisterPage(),
    ),
    GoRoute(
      path: RouteConstants.forgotPassword.path,
      name: RouteConstants.forgotPassword.name,
      builder: (_, __) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: RouteConstants.resetPassword.path,
      name: RouteConstants.resetPassword.name,
      builder: (_, __) => const ResetPasswordPage(),
    ),
    GoRoute(
      path: RouteConstants.home.path,
      name: RouteConstants.home.name,
      builder: (_, __) => const Homepage(),
    ),
    GoRoute(
      path: RouteConstants.profile.path,
      name: RouteConstants.profile.name,
      builder: (_, __) => const ProfilePage(),
    ),
    GoRoute(
      path: RouteConstants.todo.path,
      name: RouteConstants.todo.name,
      builder: (_, __) => const TodoPage(),
    ),
    GoRoute(
      path: RouteConstants.nutrition.path,
      name: RouteConstants.nutrition.name,
      builder: (_, __) => const NutritionScreen(),
    ),
    GoRoute(
      path: RouteConstants.notification.path,
      name: RouteConstants.notification.name,
      builder: (_, __) => const NotificationsPage(),
    ),
    GoRoute(
      path: RouteConstants.aiMealPlanner.path,
      name: RouteConstants.aiMealPlanner.name,
      builder: (_, __) => const AiMealPlannerScreen(),
    ),
    GoRoute(
      path: '${RouteConstants.mealDetails.path}/:id',
      name: RouteConstants.mealDetails.name,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return NutritionDetailScreen(id: id);
      },
    ),
    GoRoute(
      path: RouteConstants.emailVerification.path,
      name: RouteConstants.emailVerification.name,
      builder: (_, state) =>
          EmailVerificationPage(email: state.extra as String),
    ),
  ],
);

Future<void> saveAuthData(String token, {int expiresIn = 2592000}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}
