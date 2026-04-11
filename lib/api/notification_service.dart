import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/models/notifications/meal_notification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/utility/logger.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;

part 'notification_service.freezed.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(false) bool isLoading,
    String? message,
    String? redirect,
    Exception? error,
    String? errorMessage,
    String? action,
    List<MealNotificationModel>? notifications,
    MealNotificationModel? notification,
  }) = _NotificationState;
  factory NotificationState.initial() => const NotificationState(
        redirect: '',
      );
}

class NotificationService extends AsyncNotifier<NotificationState> {
  final Logger log = CustomLogger.getLogger(RouteConstants.notification.name);
  static final client = _createHttpClient();

  static http.Client _createHttpClient() {
    final httpClient = HttpClient()
      ..badCertificateCallback = (_, __, ___) => true;

    return IOClient(httpClient);
  }

  final prefs = SharedPreferences.getInstance();
  Uri _url(String endpoint) => Uri.parse("${Config.baseUrl}/$endpoint");

  @override
  NotificationState build() {
    return NotificationState.initial();
  }

  Future<void> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.get(
      _url(Config.notificationAPI),
      headers: {'Authorization': 'Bearer $token'},
    );
    log.i('Notification response: ${response.body}');

    try {
      final list = json.decode(response.body)['data'] as List;
      final notificationModels = list
          .map((e) => MealNotificationModel.fromJson(e as Map<String, dynamic>))
          .toList();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        state = AsyncValue.data(
          state.value!.copyWith(
              message: 'Notifications fetched successfully',
              notifications: notificationModels),
        );

        log.i('Notifications fetched successfully');
      }
    } on Exception catch (e) {
      state = AsyncValue.data(state.value!
          .copyWith(error: e, errorMessage: 'Failed to fetch notifications'));
      log.e('Error fetching notifications: $e');
    }
  }

  Future<void> createNotification({
    String? title,
    String? message,
    String? type,
    String? priority,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final payload = {};
    if (title != null) {
      payload['title'] = title;
    }
    if (message != null) {
      payload['message'] = message;
    }
    if (type != null) {
      payload['type'] = type;
    }
    if (priority != null) {
      payload['priority'] = priority;
    }

    try {
      final response = await client.post(
        _url(Config.notificationAPI),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      log.i('Notification response: ${response.body}');

      log.i('Response status code: ${response.statusCode}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final body = jsonDecode(response.body);
        final notification =
            MealNotificationModel.fromJson(body['data']); // ← not body directly
        state = AsyncValue.data(
          state.value!.copyWith(
            message: 'Notification created successfully',
            notification: notification,
          ),
        );
        log.i('Notification created successfully');
      } else {
        state = AsyncValue.data(state.value!.copyWith(
            error: Exception('Failed to create notification'),
            errorMessage: 'Failed to create notification'));
        log.e('Error creating notification: Failed to create notification');
      }
    } on Exception catch (e) {
      state = AsyncValue.data(state.value!
          .copyWith(error: e, errorMessage: 'Failed to create notification'));
      log.e('Error creating notification: $e');
    }
  }

  Future<void> deleteNotification({
    List<String>? notificationId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final payload = {};
    if (notificationId != null) {
      payload['notificationIds'] = notificationId;
    }

    try {
      final response = await client.delete(
        _url(Config.notificationAPI),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      log.i('Notification response: ${response.body}');

      log.i('Response status code: ${response.statusCode}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        state = AsyncValue.data(
          state.value!.copyWith(
            message: 'Notification deleted successfully',
          ),
        );
        log.i('Notification deleted successfully');
      } else {
        state = AsyncValue.data(state.value!.copyWith(
            error: Exception('Failed to delete notification'),
            errorMessage: 'Failed to delete notification'));
        log.e('Error deleting notification: Failed to delete notification');
      }
    } on Exception catch (e) {
      state = AsyncValue.data(state.value!
          .copyWith(error: e, errorMessage: 'Failed to delete notification'));
      log.e('Error deleting notification: $e');
    }
  }

  Future<void> updateLastActive() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    await http.post(
      _url(Config.updateActivityAPI),
      headers: {'Authorization': 'Bearer $token'},
    );
  }

// Call this when task is completed
  Future<void> updateTaskCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    await http.post(
      _url(Config.taskCompletedAPI),
      headers: {'Authorization': 'Bearer $token'},
    );
  }
}
