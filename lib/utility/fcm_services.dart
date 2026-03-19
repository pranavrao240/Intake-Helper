import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/utility/local_notiifcations.dart';
import 'package:intake_helper/utility/logger.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FCMService {
  factory FCMService() => _instance;
  final dio = Dio();
  final String oAuthKey = dotenv.get('O_AUTH_KEY');

  FCMService._internal();

  static final FCMService _instance = FCMService._internal();

  final Logger log = CustomLogger.getLogger('FCM');

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  /// --------------------
  /// PUBLIC INIT
  /// --------------------
  Future<void> init() async {
    await _requestPermission();
    await _initFCMToken();
    _setupListeners();
  }

  /// --------------------
  /// Permission
  /// --------------------
  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission();
    log.i('🔔 Permission Status: ${settings.authorizationStatus}');
  }

  /// --------------------
  /// FCM Token Handling
  /// --------------------
  Future<void> _initFCMToken() async {
    final fcmToken = await _messaging.getToken();

    if (fcmToken != null) {
      await sendTokenIfChanged(fcmToken);
    }

    // Listen for refreshed fcm_token
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      await sendTokenIfChanged(newToken);
    });
  }

  Future<void> sendTokenIfChanged(String newToken) async {
    final prefs = await SharedPreferences.getInstance();
    final existingToken = prefs.getString('fcm_token');

    log.i('🔍 Token check - New: $newToken');
    log.i('🔍 Token check - Existing: $existingToken');

    // ✅ Always store locally (single source of truth)
    if (existingToken != newToken) {
      await prefs.setString('fcm_token', newToken);
      log.i('💾 fcm_token stored locally');
    } else {
      log.i('🟢 fcm_token unchanged locally');
    }

    final currentUser = prefs.getString('userId');

    if (currentUser == null) {
      log.w('⚠️ No authenticated user. Backend sync skipped.');
      return;
    }
  }

  void _setupListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      log.i('📩 Foreground message: ${message.notification?.title}');

      await showForegroundNotification(
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        payload: message.data['route'] as String? ?? 'data-entry',
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      log.i('➡️ Notification Clicked');
      final route =
          message.data['route'] as String? ?? RouteConstants.home.name;

      await appRouter.pushNamed(route);
    });
  }

  Future<void> checkInitialMessage() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      log.i('🚀 App opened via notification (terminated)');
      await appRouter.pushNamed(RouteConstants.home.name);
    }
  }

  Future<void> sendFirebaseMessage() async {
    final response = await dio.post(
      Config.firebaseMessagingAPI,
      options: Options(
        headers: {
          'Authorization': 'Bearer $oAuthKey',
          'Content-Type': 'application/json',
        },
      ),
      data: jsonEncode({
        "message": {
          "token":
              "fMtYryNjQA6VKHifJt6F8s:APA91bEN3Lydam4uXDftwplPgZkJKUimn_Yr59-gDVb7uSFdptG84ZzJ9PVaSIM8j0rIm4mxQDM3sS86Z8gsuK-mjmsxUZiUOIrflA05nuxXEubQADsvcYA",
          "data": {"mydata1": "myvalue", "mydata2": "25"},
          "notification": {
            "body": "This is the notification body",
            "title": "Notification title"
          }
        }
      }),
    );
  }
}
