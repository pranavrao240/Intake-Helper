import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/pages/register_page.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/theme/app_theme.dart';
import 'package:intake_helper/utility/notification.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Widget _defaultHome = const RegisterPage();

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
    // return MaterialApp(
    //   title: 'Intake Helper',
    //   debugShowCheckedModeBanner: false,
    //   theme: AppTheme.lightTheme,
    //   darkTheme: AppTheme.lightTheme,
    //   themeMode: ThemeMode.system,
    //   navigatorKey: navigatorKey,
    //   initialRoute: '/',
    //   routes: {
    //     '/': (context) => _defaultHome,
    //     '/home': (context) => Homepage(),
    //     '/meal-details': (context) => const NutritionDetailScreen(),
    //     '/register': (context) => const RegisterPage(),
    //     '/login': (context) => const LoginPage(),
    //     '/todo-page': (context) => const TodolistScreen(),
    //     '/nutrition': (context) => const NutritionScreen(),
    //     '/settings': (context) => const SettingsPage(),
    //   },
    // );
  }
}
