import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/notifications_provider.dart';
import 'package:intake_helper/pages/notifications/widgets/empty_notifications_state.dart';
import 'package:intake_helper/pages/notifications/widgets/notification_card.dart';
import 'package:intake_helper/pages/notifications/widgets/notification_header.dart';

class NotificationsPage extends HookConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationsProvider);
    final scrollController = useScrollController();

    return Scaffold(
      backgroundColor: const Color(0xFF1E1B4B),
      body: state.isLoading
          ? const _LoadingIndicator()
          : Column(
              children: [
                const NotificationHeader(),
                Expanded(
                  child: CustomScrollView(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      const SliverToBoxAdapter(child: SizedBox(height: 16)),

                      // ── Notification list or empty state ───────────────
                      if (state.notifications.isEmpty)
                        const SliverFillRemaining(
                          hasScrollBody: false,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 80),
                            child: EmptyNotificationsState(),
                          ),
                        )
                      else ...[
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: NotificationCard(
                                  notification: state.notifications[index],
                                  index: index,
                                ),
                              ),
                              childCount: state.notifications.length,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class _LoadingIndicator extends HookWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    final opacity = useAnimation(
      Tween<double>(begin: 0.3, end: 0.9).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      ),
    );

    return Center(
      child: Opacity(
        opacity: opacity,
        child: const CircularProgressIndicator(
          color: Color(0xFFE31E24),
          strokeWidth: 2.5,
        ),
      ),
    );
  }
}
