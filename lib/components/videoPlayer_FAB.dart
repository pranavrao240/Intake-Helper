import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoPlayerFAB extends ConsumerWidget {
  const VideoPlayerFAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        debugPrint("FAB Clicked");
      },
      backgroundColor: Colors.transparent,
      elevation: 6,
      child: ClipOval(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            'lib/assets/characters/jimmy_bulking_vdo2.gif',
            // 'lib/assets/characters/lisa_bulking_vdo.gif',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
