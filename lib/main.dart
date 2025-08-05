import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/page/HomePage.dart';
import 'package:intake_helper/page/Login_page.dart';
import 'package:intake_helper/page/notification_service.dart';
import 'package:intake_helper/page/Settings_page.dart';
import 'package:intake_helper/page/nutritionDetailsScreen.dart';
import 'package:intake_helper/page/nutritionScreen.dart';
import 'package:intake_helper/page/register_page.dart';
import 'package:intake_helper/page/samplePage.dart';
import 'package:intake_helper/page/todoListScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void askPermissions() async {
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Widget _defaultHome = const Loginpage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _requestNotificationPermission();

  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
  _defaultHome = Homepage();
  await NotificationService.initialize();

  runApp(const ProviderScope(child: MyApp()));
}

Future<bool> isTokenValid(String token) async {
  return token != "expired";
}

Future<void> _requestNotificationPermission() async {
  if (Platform.isAndroid) {
    final status = await Permission.notification.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.notification.request();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intake Helper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 39, 38, 38),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => _defaultHome,
        '/login': (BuildContext context) => const Loginpage(),
        '/register': (BuildContext context) => const RegisterPage(),
        '/home': (BuildContext context) => const Homepage(),
        '/nutrition': (BuildContext context) => const NutritionScreen(),
        '/meal-details': (BuildContext context) =>
            const NutritionDetailScreen(),
        '/todo-page': (BuildContext context) => const TodolistScreen(),
        '/settings': (BuildContext context) => SettingsPage(),
      },
    );
  }
}
