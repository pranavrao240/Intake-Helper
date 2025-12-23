import 'package:android_intent_plus/android_intent.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestAlarmPermission() async {
  // Check current permission
  final status = await Permission.scheduleExactAlarm.status;

  if (status.isGranted) {
    return;
  }

  // Opens the system settings page — REQUIRED for Pixel phones
  const intent = AndroidIntent(
    action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
  );
  await intent.launch();
}
