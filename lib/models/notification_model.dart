import 'package:flutter/material.dart';

enum NotificationType { reminder, achievement, goal, insight, completed, favorite }

class NotificationModel {
  final int id;
  final NotificationType type;
  final IconData icon;
  final String title;
  final String message;
  final String time;
  final bool unread;
  final List<Color> gradientColors;
  final List<Color> bgGradientColors;

  const NotificationModel({
    required this.id,
    required this.type,
    required this.icon,
    required this.title,
    required this.message,
    required this.time,
    required this.unread,
    required this.gradientColors,
    required this.bgGradientColors,
  });

  NotificationModel copyWith({bool? unread}) {
    return NotificationModel(
      id: id,
      type: type,
      icon: icon,
      title: title,
      message: message,
      time: time,
      unread: unread ?? this.unread,
      gradientColors: gradientColors,
      bgGradientColors: bgGradientColors,
    );
  }
}
