import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmptyNotificationsState extends HookConsumerWidget {
  const EmptyNotificationsState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 800),
    );
    final scaleAnim = useAnimation(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut),
    );
    final fadeAnim = useAnimation(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut),
      ),
    );

    useEffect(() {
      controller.forward();
      return null;
    }, const []);

    final floatController = useAnimationController(
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    final floatAnim = useAnimation(
      Tween<double>(begin: -8, end: 8).animate(
        CurvedAnimation(parent: floatController, curve: Curves.easeInOut),
      ),
    );

    return Center(
      child: FadeTransition(
        opacity: AlwaysStoppedAnimation(fadeAnim),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.translate(
              offset: Offset(0, floatAnim),
              child: Transform.scale(
                scale: 0.6 + scaleAnim * 0.4,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFF3F4F6), Color(0xFFE5E7EB)],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.notifications_off_rounded,
                    size: 56,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'All Caught Up!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                letterSpacing: -0.4,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You have no new notifications',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
