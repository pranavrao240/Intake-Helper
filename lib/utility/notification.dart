import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intake_helper/main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// For Android foreground service notification
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // Handle background notification tap if needed
}

class CustomNotification {
  static final CustomNotification _instance = CustomNotification._internal();
  bool _initialized = false;
  late final FlutterLocalNotificationsPlugin _notificationsPlugin;
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  factory CustomNotification() {
    return _instance;
  }

  CustomNotification._internal() {
    _notificationsPlugin = FlutterLocalNotificationsPlugin();
  }

  Future<void> init() async {
    if (_initialized) return;

    try {
      // Initialize timezone

      // Request notification permission (Android 13+)
      if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
        final status = await Permission.notification.status;
        if (status.isDenied) {
          await Permission.notification.request();
        }
      }

      const AndroidInitializationSettings androidInit =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const DarwinInitializationSettings iosInit = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );

      await _notificationsPlugin.initialize(
        const InitializationSettings(
          android: androidInit,
          iOS: iosInit,
        ),
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          if (kDebugMode) {
            print('Notification tapped: ${response.payload}');
          }
        },
      );

      if (defaultTargetPlatform == TargetPlatform.android) {
        await _createNotificationChannel();
      }

      _initialized = true;
      if (kDebugMode) {
        print('Notification plugin initialized successfully');
      }
    } catch (e, stackTrace) {
      log('Error initializing notifications: $e');
      log('Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'channel_id',
      'General Notifications',
      description: 'For basic notifications',
      importance: Importance.max,
      playSound: true,
      showBadge: true,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> showSimpleNotification() async {
    if (!_initialized) {
      await init();
    }

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'General Notifications',
      channelDescription: 'For basic notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      enableVibration: true,
      playSound: true,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notificationsPlugin.show(
      0,
      'Hello 👋',
      'This is a local notification!',
      notificationDetails,
    );
  }

  void scheduleNotification(String title, String body, int time) async {
    print("start");
    var android = AndroidNotificationDetails('channel id', 'channel NAME',
        priority: Priority.high, importance: Importance.max);
    var platform = NotificationDetails(
      android: android,
    );
    await CustomNotification()._notificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(Duration(seconds: time)),
        platform,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);

    print(tz.TZDateTime.now(tz.local).add(Duration(seconds: time)));

    print("22222");
  }
}
