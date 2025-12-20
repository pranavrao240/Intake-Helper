import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget customAppbar(BuildContext context,
    {required String title, VoidCallback? onBack}) {
  return AppBar(
    backgroundColor: const Color(0xFF1F1F1F),
    leading: IconButton(
        onPressed: () {
          onBack != null ? onBack.call() : context.pop();
        },
        icon: Icon(Icons.arrow_back, color: Colors.white)),
    title: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Color(0xFF00FFAA),
      ),
    ),
    elevation: 4,
    centerTitle: true,
  );
}
