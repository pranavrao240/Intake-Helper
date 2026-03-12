import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';

void showToast(String message, BuildContext context, int type) {
  final theme = Theme.of(context);
  var color = Color(0xFF6D28D9);
  var icon = const Icon(Icons.check_circle);

  switch (type) {
    case 1:
      color = Color(0xFF6D28D9);
      icon = const Icon(
        Icons.check_circle,
        color: Colors.white,
      );
    case 2:
      color = Colors.red;
      icon = const Icon(
        Icons.error,
        color: Colors.white,
      );
    case 3:
      color = Colors.orange;
      icon = const Icon(
        Icons.warning,
        color: Colors.white,
      );
    case 4:
      color = Colors.blue;
      icon = const Icon(
        Icons.info,
        color: Colors.white,
      );

    default:
  }

  // Show the toast
  WidgetsBinding.instance.addPostFrameCallback((_) {
    DelightToastBar(
      autoDismiss: true,
      snackbarDuration: const Duration(seconds: 3),
      builder: (context) => ToastCard(
        leading: icon,
        color: color,
        title: Text(
          message,
          style: theme.textTheme.titleMedium!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    ).show(context);
  });
}

// Types of Toast
// 1 - Success
// 2 - Error
// 3 - Warning
// 4 - Info
