import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'reminder_channel',
    'Reminders',
    description: 'Channel for app reminders',
    importance: Importance.max,
  );

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings =
        InitializationSettings(android: androidSettings);

    await _plugin.initialize(settings);

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
  }

  static Future<void> notifyAtTime({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    final now = DateTime.now();
    DateTime targetTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // If the time has already passed today, schedule for tomorrow
    if (targetTime.isBefore(now)) {
      targetTime = targetTime.add(const Duration(days: 1));
    }

    final delay = targetTime.difference(now);
    print('🕰 Scheduling for $targetTime (in ${delay.inMinutes} mins)');

    await Future.delayed(delay);

    await _plugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  static Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id);
    print('❌ Notification $id cancelled');
  }

  static Future<void> showAfterDelay({
    required int id,
    required String title,
    required String body,
    required Duration delay,
  }) async {
    print('⏳ Delaying notification by ${delay.inSeconds} seconds...');
    await Future.delayed(delay);

    await _plugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
    print('✅ Notification shown');
  }
}
