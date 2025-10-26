import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/pages/HomePage.dart';
import 'package:intake_helper/pages/Login_page.dart';
import 'package:intake_helper/pages/Settings_page.dart';
import 'package:intake_helper/pages/nutritionDetailsScreen.dart';
import 'package:intake_helper/pages/nutritionScreen.dart';
import 'package:intake_helper/pages/register_page.dart';
import 'package:intake_helper/pages/todoListScreen.dart';
import 'package:intake_helper/utility/notification.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// Initialize timezones
Future<void> _initializeApp() async {
  try {
    // initialize tz database
    tz.initializeTimeZones();

    // get device timezone name (e.g. "Asia/Kolkata")
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();

    // set local timezone for the timezone package
    tz.setLocalLocation(tz.getLocation(timeZoneName));
    debugPrint(
        '✅ Initialized timezone: $timeZoneName (tz.local: ${tz.local.name})');
  } catch (e, st) {
    debugPrint('⚠️ Error initializing timezone: $e\n$st');
    tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
  }
}

// Helper function to get the current timezone name
Future<String> _getTimeZoneName() async {
  try {
    // First try to get the local timezone
    final String localTimeZone = await tz.local.name;
    if (localTimeZone.isNotEmpty) {
      return localTimeZone;
    }
    // Fallback to system timezone
    final DateTime now = DateTime.now();
    final String timeZoneName = now.timeZoneName;
    if (timeZoneName.isNotEmpty) {
      return timeZoneName;
    }
    // Final fallback to UTC
    return 'UTC';
  } catch (e) {
    debugPrint('Error getting timezone name: $e');
    return 'UTC';
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Widget _defaultHome = const RegisterPage();

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();

  // Initialize notifications
  await CustomNotification().init();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // You can add any timezone-related initialization here if needed
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intake Helper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 39, 38, 38),
      ),
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => _defaultHome,
        '/home': (context) => const Homepage(),
        '/meal-details': (context) => const NutritionDetailScreen(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const Loginpage(),
        '/todo-page': (context) => const TodolistScreen(),
        '/nutrition': (context) => const NutritionScreen(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
