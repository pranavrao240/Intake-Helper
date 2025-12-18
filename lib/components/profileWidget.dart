import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileWidget extends HookConsumerWidget {
  final String imagePath;
  final String badgeText;

  const ProfileWidget(
      {required this.imagePath, required this.badgeText, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CircleAvatar(radius: 60, backgroundImage: AssetImage(imagePath)),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(12)),
            child: Text(badgeText,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
