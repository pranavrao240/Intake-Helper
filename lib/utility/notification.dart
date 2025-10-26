import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {}

class CustomNotification {
  static final CustomNotification _instance = CustomNotification._internal();
  bool _initialized = false;

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory CustomNotification() => _instance;

  CustomNotification._internal();

  Future<void> init() async {
    if (_initialized) return;

    try {
      // Initialize timezone
      tz.initializeTimeZones();
      final timeZoneName = await FlutterTimezone.getLocalTimezone();

      print('object: $timeZoneName');
      // tz.setLocalLocation(tz.getLocation(timeZoneName));

      // Request notification permission (Android 13+)
      if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
        final status = await Permission.notification.status;
        if (status.isDenied) {
          await Permission.notification.request();
        }
      }

      const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
      const iosInit = DarwinInitializationSettings();

      await _notificationsPlugin.initialize(
        const InitializationSettings(android: androidInit, iOS: iosInit),
        onDidReceiveNotificationResponse: (response) {
          if (kDebugMode) {
            print('Notification tapped: ${response.payload}');
          }
        },
      );

      await _createNotificationChannel();
      _initialized = true;
      log('✅ Notification plugin initialized');
    } catch (e, st) {
      log('❌ Error initializing notifications: $e');
      log('Stack: $st');
    }
  }

  Future<void> _createNotificationChannel() async {
    const channel = AndroidNotificationChannel(
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
    if (!_initialized) await init();

    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'General Notifications',
        channelDescription: 'For basic notifications',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _notificationsPlugin.show(
      0,
      'Hello 👋',
      'This is a local notification!',
      details,
    );
  }

  Future<void> showScheduleNotification(
    int id,
    String title,
    String body,
    int hour,
    int minute,
  ) async {
    if (!_initialized) await init();

    final now = tz.TZDateTime.now(tz.local);
    final scheduleDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduleDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel_id',
          'General Notifications',
          channelDescription: 'For basic notifications',
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
