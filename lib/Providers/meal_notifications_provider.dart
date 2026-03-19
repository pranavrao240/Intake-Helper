import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/api/notification_service.dart';

final mealNotificationProvider =
    AsyncNotifierProvider<NotificationService, NotificationState>(
  NotificationService.new,
);
