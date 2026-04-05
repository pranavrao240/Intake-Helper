import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/Providers/locale_provider.dart';
import 'package:intake_helper/l10n/app_localizations.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/theme/app_theme.dart';
import 'package:intake_helper/utility/fcm_services.dart';
import 'package:intake_helper/utility/local_notiifcations.dart';
import 'package:intake_helper/utility/notification.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: 'https://vmhkcoenltymspivkagd.supabase.co',
    anonKey: 'sb_publishable_8_jUo-Lp4L-7vGShlBVrrA_G4p0542E',
  );

  // Initialize notifications
  await CustomNotification().init();

  runApp(
    const ProviderScope(
      child: AppWrapper(child: MyApp()),
    ),
  );

  await FCMService().checkInitialMessage();
  await FCMService().init();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
    return Consumer(
      builder: (context, ref, _) {
        final locale = ref.watch(localeProvider);
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: locale,

          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.lightTheme,

          routerConfig: appRouter,

          // 🌍 ADD THESE 👇
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],

          supportedLocales: const [
            Locale('en'),
            Locale('hi'),
          ],
        );
      },
    );
  }
}

class AppWrapper extends StatefulWidget {
  const AppWrapper({required this.child, super.key});
  final Widget child;

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final notification = message.notification;

      if (notification != null) {
        await showForegroundNotification(
          title: notification.title ?? '',
          body: notification.body ?? '',
          payload: message.data['route'] as String? ?? RouteConstants.home.name,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

/// Background notification handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
