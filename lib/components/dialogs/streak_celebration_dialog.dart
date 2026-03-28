import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final streakCountProvider = StateProvider<int>((ref) => 7);

void showStreakCelebrationDialog(BuildContext context,
    {required int streakCount, required String avatar}) {
  showDialog(
    context: context,
    barrierColor: Colors.black87,
    builder: (_) => ProviderScope(
      child: StreakCelebrationDialog(streakCount: streakCount, avatar: avatar),
    ),
  );
}

class StreakCelebrationDialog extends HookConsumerWidget {
  final int streakCount;
  final String avatar;

  const StreakCelebrationDialog(
      {super.key, required this.streakCount, required this.avatar});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fadeController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );
    final slideController = useAnimationController(
      duration: const Duration(milliseconds: 700),
    );
    final scaleController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    final fadeAnim = useAnimation(
      CurvedAnimation(parent: fadeController, curve: Curves.easeIn),
    );
    final slideAnim = useAnimation(
      Tween<Offset>(begin: const Offset(0.3, 0), end: Offset.zero).animate(
        CurvedAnimation(parent: slideController, curve: Curves.easeOutCubic),
      ),
    );
    final scaleAnim = useAnimation(
      Tween<double>(begin: 0.85, end: 1.0).animate(
        CurvedAnimation(parent: scaleController, curve: Curves.elasticOut),
      ),
    );

    useEffect(() {
      fadeController.forward();
      slideController.forward();
      Future.delayed(
          const Duration(milliseconds: 200), scaleController.forward);
      return null;
    }, const []);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: FadeTransition(
        opacity: AlwaysStoppedAnimation(fadeAnim),
        child: ScaleTransition(
          scale: AlwaysStoppedAnimation(scaleAnim),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF6B35).withOpacity(0.35),
                  blurRadius: 40,
                  spreadRadius: 4,
                ),
              ],
              border: Border.all(
                color: const Color(0xFFFF6B35).withOpacity(0.4),
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const _FireEmoji(),
                      const Text(
                        'STREAK',
                        style: TextStyle(
                          color: Color(0xFFFF6B35),
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 4,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.06),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            color: Colors.white54,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          width: 160,
                          height: 200,
                          child: Image.asset(
                            'lib/assets/videos/$avatar.gif',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFF0F3460),
                                child: const Center(
                                  child: Icon(
                                    Icons.broken_image_outlined,
                                    color: Color(0xFFFF6B35),
                                    size: 40,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SlideTransition(
                          position: AlwaysStoppedAnimation(slideAnim),
                          child: _StreakTextPanel(streakCount: streakCount),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6B35),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'I\'ll Maintain My Streak! 🚀',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StreakTextPanel extends StatelessWidget {
  final int streakCount;

  const _StreakTextPanel({required this.streakCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Congratulations!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF6B35).withOpacity(0.45),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🔥', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 6),
              Text(
                '$streakCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.5,
            ),
            children: [
              TextSpan(
                text: '$streakCount ${streakCount == 1 ? 'Day' : 'Days'} ',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const TextSpan(text: 'Streak\nCompleted'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'You\'re on fire! Keep the momentum going.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.45),
            fontSize: 12,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _FireEmoji extends HookWidget {
  const _FireEmoji();

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    final scale = useAnimation(
      Tween<double>(begin: 0.9, end: 1.15).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      ),
    );

    return Transform.scale(
      scale: scale,
      child: const Text('🔥', style: TextStyle(fontSize: 26)),
    );
  }
}
