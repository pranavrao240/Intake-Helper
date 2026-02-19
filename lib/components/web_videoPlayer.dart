import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class WebmVideoExample extends HookConsumerWidget {
  const WebmVideoExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Create controller once
    final controller = useMemoized(
      () => VideoPlayerController.asset(
          'lib/assets/characters/jimmy_bulking_vdo2.mp4'),
    );

    // Listen to controller changes (important!)
    useListenable(controller);

    // Handle lifecycle
    useEffect(() {
      controller.initialize().then((_) {
        controller
          ..setLooping(true)
          ..setVolume(0)
          ..play();
      });

      return controller.dispose;
    }, [controller]);

    return Scaffold(
      body: Center(
        child: controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
