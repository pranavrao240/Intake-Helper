import 'package:go_router/go_router.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/ai_meal_planner_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../pages/HomePage.dart';
import '../pages/Login_page.dart';
import '../pages/register_page.dart';
import '../pages/Settings_page.dart';
import '../pages/todoListScreen.dart';
import '../pages/nutritionScreen.dart';
import '../pages/nutritionDetailsScreen.dart';

/// ---------- ROUTE MODEL ----------
class AppRoute {
  const AppRoute({required this.path, required this.name});
  final String path;
  final String name;
}

/// ---------- ROUTE CONSTANTS ----------
class RouteConstants {
  static const login = AppRoute(path: '/login', name: 'login');
  static const register = AppRoute(path: '/register', name: 'register');

  static const home = AppRoute(path: '/home', name: 'home');
  static const settings = AppRoute(path: '/settings', name: 'settings');
  static const todo = AppRoute(path: '/todo', name: 'todo');
  static const nutrition = AppRoute(path: '/nutrition', name: 'nutrition');
  static const mealDetails =
      AppRoute(path: '/meal-details', name: 'meal-details');
  static const aiMealPlanner =
      AppRoute(path: '/ai-meal-planner', name: 'ai-meal-planner');
}

// Add this function to check if token is expired
Future<bool> isTokenExpired() async {
  final prefs = await SharedPreferences.getInstance();
  final expiryTime = prefs.getInt('token_expiry');
  if (expiryTime == null) return true;

  final now = DateTime.now().millisecondsSinceEpoch;
  return now > expiryTime;
}

// Update the isUserLoggedIn function
Future<bool> isUserLoggedIn() async {
  try {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    // Check if token exists and isn't empty
    if (token == null || token.isEmpty) {
      return false;
    }

    return true;
  } on Exception {
    return false;
  }
}

/// ---------- ROUTE GROUPS ----------
final publicRoutes = [
  RouteConstants.login.path,
  RouteConstants.register.path,
];

final protectedRoutes = [
  RouteConstants.home.path,
  RouteConstants.settings.path,
  RouteConstants.todo.path,
  RouteConstants.nutrition.path,
  RouteConstants.mealDetails.path,
  RouteConstants.aiMealPlanner.path,
];

/// ---------- GO ROUTER ----------
final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: RouteConstants.login.path,
  redirect: (context, state) async {
    final isLoggedIn = await isUserLoggedIn();
    final path = state.uri.path;

    // Redirect unauthenticated users from protected routes
    if (!isLoggedIn && protectedRoutes.contains(path)) {
      return RouteConstants.login.path;
    }

    if (isLoggedIn && publicRoutes.contains(path)) {
      return RouteConstants.home.path;
    }

    return null;
  },
  routes: [
    /// ---------- PUBLIC ----------
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

    /// ---------- PROTECTED ----------
    GoRoute(
      path: RouteConstants.home.path,
      name: RouteConstants.home.name,
      builder: (_, __) => const Homepage(),
    ),
    GoRoute(
      path: RouteConstants.settings.path,
      name: RouteConstants.settings.name,
      builder: (_, __) => const SettingsPage(),
    ),
    GoRoute(
      path: RouteConstants.todo.path,
      name: RouteConstants.todo.name,
      builder: (_, __) => const TodolistScreen(),
    ),
    GoRoute(
      path: RouteConstants.nutrition.path,
      name: RouteConstants.nutrition.name,
      builder: (_, __) => const NutritionScreen(),
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
  ],
);

// Add this function to save auth data after successful login
// expires in 30 days (2592000 seconds)
Future<void> saveAuthData(String token, {int expiresIn = 2592000}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}
