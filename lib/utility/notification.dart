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
    print("INIT CALLED");

    if (_initialized) return;

    try {
      // 🔥 MUST CALL THIS FIRST
      tz.initializeTimeZones();

      // 🔥 Set local timezone
      tz.setLocalLocation(tz.getLocation("Asia/Kolkata"));

      // Request notification permission (Android 13+)
      if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
        final status = await Permission.notification.status;
        final alarmstatud = await Permission.scheduleExactAlarm.status;
        if (status.isDenied) {
          await Permission.notification.request();
        }
        if (alarmstatud.isDenied) {
          await Permission.scheduleExactAlarm.request();
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
      showBadge: true,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

// Function to show a simple notification
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

// Function to schedule a notification for a specific time
  Future<void> showScheduleNotification(
    int id,
    String title,
    String body,
    int hour,
    int minute, {
    String? payload,
  }) async {
    print("🔵 showScheduleNotification() CALLED");

    if (!_initialized) {
      print("🔵 init not ready → calling init()");
      await init();
    }

    final now = tz.TZDateTime.now(tz.local);
    print("⏰ Current Time = ${now.hour}:${now.minute}");

    // Create scheduled date
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // If the scheduled time has already passed today, schedule for tomorrow
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }

    print("📌 Scheduled Time = ${scheduleDate.toString()}");

    // Create notification details
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'General Notifications',
      channelDescription: 'For scheduled notifications',
      importance: Importance.max,
      priority: Priority.high,
      enableVibration: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
      ),
    );

    try {
      await _notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduleDate,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: payload ?? 'scheduled_notification_$id',
      );

      print('✅ Notification scheduled for ${scheduleDate.toString()}');
    } catch (e, st) {
      log('❌ Error scheduling notification: $e');
      log('Stack: $st');
      rethrow;
    }
  }
}

// Function to get the next instance of a specific weekday
tz.TZDateTime _nextInstanceOfWeekday(int weekday, int hour, int minute) {
  final now = tz.TZDateTime.now(tz.local);

  tz.TZDateTime scheduledDate = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    hour,
    minute,
  );

  while (scheduledDate.weekday != weekday || scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }

  return scheduledDate;
}

// Function to schedule notifications for multiple days
Future<void> scheduleForMultipleDays({
  required String title,
  required String body,
  required TimeOfDay time,
  required List<String> days, // ["Mon", "Wed"]
}) async {
  final now = tz.TZDateTime.now(tz.local);

  Map<String, int> dayMap = {
    "Mon": DateTime.monday,
    "Tue": DateTime.tuesday,
    "Wed": DateTime.wednesday,
    "Thu": DateTime.thursday,
    "Fri": DateTime.friday,
    "Sat": DateTime.saturday,
    "Sun": DateTime.sunday,
  };

  for (String day in days) {
    int weekday = dayMap[day]!;
    int id = now.millisecondsSinceEpoch ~/ 1000 + weekday;

    // Next occurrence of selected weekday
    tz.TZDateTime scheduledDate = _nextInstanceOfWeekday(
      weekday,
      time.hour,
      time.minute,
    );

    print("📌 Scheduling for $day → $scheduledDate");

    await CustomNotification().showScheduleNotification(
      id,
      title,
      body,
      time.hour,
      time.minute,
      payload: "day_$day",
    );
  }
}
