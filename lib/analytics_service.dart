import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:flutter/material.dart';

class AnalyticsService {
  static bool _isInitialized = false;

  static Future<void> init() async {
    final apiKey = dotenv.env['POSTHOG_API_KEY'] ?? '';
    final host = dotenv.env['POSTHOG_HOST'] ?? 'https://us.i.posthog.com';
    try {
      final config = PostHogConfig(apiKey)
        ..host = host
        ..debug = true
        ..sessionReplay = true
        ..captureApplicationLifecycleEvents = true
        ..flushInterval = const Duration(seconds: 30);
      await Posthog().setup(config);
      _isInitialized = true;
      print('PostHog initialized successfully with session recording');

      // Start session recording
      try {
        Posthog().capture(
          eventName: 'session_recording_started',
          properties: {'enabled': true},
        );
        print('Session recording initiated');
      } catch (e) {
        print('Failed to initiate session recording: $e');
      }
    } catch (e) {
      print('PostHog initialization failed: $e');
      _isInitialized = false;
    }
  }

  static void trackEvent(String eventName, {Map<String, Object>? properties}) {
    if (!_isInitialized) {
      print('Analytics not initialized, skipping event: $eventName');
      return;
    }
    try {
      Posthog().capture(
        eventName: eventName,
        properties: properties ?? {},
      );
    } catch (e) {
      print('Failed to track event: $e');
    }
  }

  static void identifyUser(String userId, {Map<String, Object>? traits}) {
    if (!_isInitialized) {
      print('Analytics not initialized, skipping user identification: $userId');
      return;
    }
    try {
      Posthog().identify(
        userId: userId,
        userProperties: traits ?? {},
      );
    } catch (e) {
      print('Failed to identify user: $e');
    }
  }

  static void trackScreenView(String screenName) {
    if (!_isInitialized) {
      print('Analytics not initialized, skipping screen view: $screenName');
      return;
    }
    try {
      // Use PostHog's built-in screen tracking
      Posthog().screen(
        screenName: screenName,
      );
      print('Screen tracked: $screenName');
    } catch (e) {
      print('Failed to track screen view: $e');
      // Fallback to custom event
      trackEvent('screen_view', properties: {'screen': screenName});
    }
  }

  static void startSessionRecording() {
    if (!_isInitialized) {
      print('Analytics not initialized, cannot start session recording');
      return;
    }
    try {
      Posthog().capture(
        eventName: 'session_recording_started',
        properties: {'manual_start': true},
      );
      print('Session recording started manually');
    } catch (e) {
      print('Failed to start session recording: $e');
    }
  }

  static void stopSessionRecording() {
    if (!_isInitialized) {
      print('Analytics not initialized, cannot stop session recording');
      return;
    }
    try {
      Posthog().capture(
        eventName: 'session_recording_stopped',
        properties: {'manual_stop': true},
      );
      print('Session recording stopped manually');
    } catch (e) {
      print('Failed to stop session recording: $e');
    }
  }

  static void flush() {
    if (!_isInitialized) {
      print('Analytics not initialized, cannot flush');
      return;
    }
    try {
      Posthog().flush();
      print('Analytics data flushed');
    } catch (e) {
      print('Failed to flush analytics: $e');
    }
  }
}

class AnalyticsRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _trackRoute(route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _trackRoute(newRoute);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      _trackRoute(previousRoute);
    }
  }

  void _trackRoute(Route route) {
    final screenName = _getScreenName(route);
    if (screenName != null) {
      print('Router observer tracking screen: $screenName');
      AnalyticsService.trackScreenView(screenName);
    } else {
      print(
          'Router observer: Could not get screen name for route: ${route.settings.name}');
    }
  }

  String? _getScreenName(Route route) {
    print(
        'Getting screen name for route: ${route.settings.name}, path: ${route.settings.arguments}');
    if (route.settings.name != null) {
      final screenName = _formatScreenName(route.settings.name!);
      print('Formatted screen name: $screenName');
      return screenName;
    }
    return null;
  }

  String _formatScreenName(String routeName) {
    // Convert route names to readable screen names
    switch (routeName) {
      case 'login':
        return 'Login';
      case 'register':
        return 'Register';
      case 'email-verification':
        return 'Email Verification';
      case 'forgot-password':
        return 'Forgot Password';
      case 'reset-password':
        return 'Reset Password';
      case 'home':
        return 'Home';
      case 'onboarding':
        return 'Onboarding';
      case 'profile':
        return 'Profile';
      case 'todo':
        return 'Todo';
      case 'nutrition':
        return 'Nutrition';
      case 'notification':
        return 'Notifications';
      case 'meal-details':
        return 'Meal Details';
      case 'ai-meal-planner':
        return 'AI Meal Planner';
      default:
        // Convert kebab-case to Title Case
        return routeName
            .split('-')
            .map((word) => word[0].toUpperCase() + word.substring(1))
            .join(' ');
    }
  }
}
