import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarWidget extends HookConsumerWidget implements PreferredSizeWidget {
  final VoidCallback onRefresh;
  final VoidCallback onSettings;

  const AppBarWidget(
      {required this.onRefresh, required this.onSettings, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      title: const Text("Gym Intake Tracker",
          style: TextStyle(color: Colors.white)),
      actions: [
        IconButton(
            icon: const Icon(Icons.refresh, color: Colors.orange),
            onPressed: onRefresh),
        IconButton(
            icon: const Icon(Icons.settings, color: Colors.red),
            onPressed: onSettings),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
