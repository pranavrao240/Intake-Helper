import 'package:android_intent_plus/android_intent.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestAlarmPermission() async {
  final status = await Permission.scheduleExactAlarm.status;

  if (status.isGranted) {
    return;
  }

  const intent = AndroidIntent(
    action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
  );
  await intent.launch();
}
