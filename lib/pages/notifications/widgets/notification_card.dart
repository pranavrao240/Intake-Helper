import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../models/notifications/meal_notification_model.dart';
import '../../../Providers/notifications_provider.dart';

class NotificationCard extends HookConsumerWidget {
  final MealNotificationModel notification;
  final int index;
  final VoidCallback onDismiss;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.index,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(notificationsProvider.notifier);

    // Entrance animation
    final animController = useAnimationController(
      duration: Duration(milliseconds: 350 + index * 60),
    );
    final slideAnim = useAnimation(
      Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
        CurvedAnimation(parent: animController, curve: Curves.easeOutCubic),
      ),
    );
    final fadeAnim = useAnimation(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animController, curve: Curves.easeOut),
      ),
    );

    useEffect(() {
      Future.delayed(Duration(milliseconds: index * 60), () {
        if (animController.isCompleted == false) {
          animController.forward();
        }
      });
      return null;
    }, const []);

    // Hover / press state
    final isHovered = useState(false);

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fadeAnim),
      child: SlideTransition(
        position: AlwaysStoppedAnimation(slideAnim),
        child: Dismissible(
          key: Key('notification_${notification.id}'),
          direction: DismissDirection.endToStart,
          background: _DismissBackground(),
          onDismissed: (_) => onDismiss(),
          child: GestureDetector(
            onTapDown: (_) => isHovered.value = true,
            onTapUp: (_) {
              isHovered.value = false;
              notifier.markRead(int.parse(notification.id));
            },
            onTapCancel: () => isHovered.value = false,
            child: AnimatedScale(
              scale: isHovered.value ? 0.98 : 1.0,
              duration: const Duration(milliseconds: 120),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: notification.isRead
                        ? Colors.white.withValues(alpha: 0.5)
                        : const Color(0xFF2563EB).withValues(alpha: 0.25),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: notification.isRead
                          ? const Color(0xFF2563EB).withValues(alpha: 0.1)
                          : Colors.black.withValues(alpha: 0.04),
                      blurRadius: isHovered.value ? 20 : 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _NotificationIcon(notification: notification),
                            const SizedBox(width: 14),
                            Expanded(
                              child: _NotificationContent(
                                  notification: notification),
                            ),
                            if (!notification.isRead) _UnreadDot(),
                          ],
                        ),
                      ),
                      // Red bottom bar for unread
                      if (!notification.isRead)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 3,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF4338CA), // indigo-700
                                  Color(0xFF6D28D9), // violet-700
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  final MealNotificationModel notification;
  const _NotificationIcon({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEF4444), Color(0xFFF97316)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEF4444).withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFEF4444), Color(0xFFF97316)],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFEF4444).withValues(alpha: 0.4),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(Icons.notifications_rounded,
              color: Colors.white, size: 18),
        ),
      ),
    );
  }
}

class _NotificationContent extends StatelessWidget {
  final MealNotificationModel notification;
  const _NotificationContent({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notification.title,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontWeight: notification.isRead ? FontWeight.w500 : FontWeight.w600,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          notification.message,
          style: const TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 13,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          notification.scheduledFor?.toString() ?? '',
          style: const TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _UnreadDot extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    final scale = useAnimation(
      Tween<double>(begin: 0.85, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Transform.scale(
        scale: scale,
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: Color(0xFF3730A3),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF3730A3),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DismissBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFEE2E2), Color(0xFF6D28D9)],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.delete_rounded, color: Colors.white, size: 24),
          const SizedBox(height: 4),
          Text(
            'Delete',
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
