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

/// ---------- AUTH CHECK ----------
Future<bool> isUserLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  return token != null && token.isNotEmpty;
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

  /// 🔐 GLOBAL REDIRECT
  redirect: (context, state) async {
    final loggedIn = await isUserLoggedIn();
    final path = state.uri.path;

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

    /// ---------- DETAILS (with extra) ----------
    GoRoute(
      name: RouteConstants.mealDetails.name,
      path: RouteConstants.mealDetails.path,
      builder: (_, state) {
        final args = state.extra as Map<String, dynamic>;
        return NutritionDetailScreen();
      },
    ),
  ],
);
