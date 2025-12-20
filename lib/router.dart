import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
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
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  if (token == null || token.isEmpty) return false;

  // Check if token is expired
  final expired = await isTokenExpired();
  if (expired) {
    await clearAuthData(); // Clear auth data if token is expired
    return false;
  }

  return true;
}

// Add this function to clear auth data
Future<void> clearAuthData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  await prefs.remove('token_expiry');
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
];

/// ---------- GO ROUTER ----------
final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: RouteConstants.login.path,
  redirect: (context, state) async {
    final loggedIn = await isUserLoggedIn();
    final path = state.uri.path;

    // If token is expired, redirect to login
    if (await isTokenExpired()) {
      await clearAuthData();
      return RouteConstants.login.path;
    }

    // Not logged in → protected page
    if (!loggedIn && protectedRoutes.contains(path)) {
      return RouteConstants.login.path;
    }

    // Logged in → auth pages
    if (loggedIn && publicRoutes.contains(path)) {
      return RouteConstants.home.path;
    }

    return null;
  },
  routes: [
    /// ---------- PUBLIC ----------
    GoRoute(
      name: RouteConstants.login.name,
      path: RouteConstants.login.path,
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      name: RouteConstants.register.name,
      path: RouteConstants.register.path,
      builder: (_, __) => const RegisterPage(),
    ),

    /// ---------- PROTECTED ----------
    GoRoute(
      name: RouteConstants.home.name,
      path: RouteConstants.home.path,
      builder: (_, __) => const Homepage(),
    ),
    GoRoute(
      name: RouteConstants.settings.name,
      path: RouteConstants.settings.path,
      builder: (_, __) => const SettingsPage(),
    ),
    GoRoute(
      name: RouteConstants.todo.name,
      path: RouteConstants.todo.path,
      builder: (_, __) => const TodolistScreen(),
    ),
    GoRoute(
      name: RouteConstants.nutrition.name,
      path: RouteConstants.nutrition.path,
      builder: (_, __) => const NutritionScreen(),
    ),
    GoRoute(
      name: RouteConstants.mealDetails.name,
      path: '${RouteConstants.mealDetails.path}/:id', // Add :id to the path
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? ''; // Get ID from URL
        return NutritionDetailScreen(id: id);
      },
    )
  ],
);

// Add this function to save auth data after successful login
Future<void> saveAuthData(String token, {int expiresIn = 3600}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);

  // Set expiry time (current time + expiresIn seconds)
  final expiryTime = DateTime.now().millisecondsSinceEpoch + (expiresIn * 1000);
  await prefs.setInt('token_expiry', expiryTime);
}
