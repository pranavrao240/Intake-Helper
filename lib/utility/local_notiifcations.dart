import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intake_helper/router.dart';

final FlutterLocalNotificationsPlugin localNotifications =
    FlutterLocalNotificationsPlugin();

Future<void> initLocalNotifications() async {
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

  const settings = InitializationSettings(
    android: androidSettings,
  );

  await localNotifications.initialize(
    settings: settings,
    onDidReceiveNotificationResponse: (response) async {
      final route = response.payload;

      if (route != null && route.isNotEmpty) {
        await appRouter.pushNamed(route); // ✅ FOREGROUND TAP NAVIGATION
      }
    },
  );
}

Future<void> showForegroundNotification({
  required String title,
  required String body,
  required String payload,
}) async {
  const androidDetails = AndroidNotificationDetails(
    'high_importance_channel',
    'High Importance Notifications',
    icon: '@mipmap/ic_launcher',
    importance: Importance.max,
    priority: Priority.high,
  );

  const details = NotificationDetails(android: androidDetails);

  await localNotifications.show(
    id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    title: title,
    body: body,
    notificationDetails: details,

    payload: payload, // ✅
  );
}
