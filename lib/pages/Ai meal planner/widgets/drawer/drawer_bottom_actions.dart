import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/analytics_service.dart';
import 'package:intake_helper/components/toast/toast.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/drawer/clear_history_dialog.dart';
import 'package:intake_helper/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:intake_helper/services/onboarding_tutorial_service.dart';

class DrawerBottomActions extends HookConsumerWidget {
  const DrawerBottomActions({super.key});

  void _showClearHistoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ClearHistoryDialog(),
    ).then((confirmed) {
      if (confirmed == true) {
        if (!context.mounted) return;
        showToast('Chat history cleared successfully', context, 1);
      }
    });
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.white.withOpacity(0.05),
        highlightColor: Colors.white.withOpacity(0.02),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor ?? Colors.white.withOpacity(0.7),
                size: 20,
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  color: textColor ?? Colors.white.withOpacity(0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          color: Colors.white.withOpacity(0.08),
          height: 1,
        ),
        const SizedBox(height: 8),
        Container(
          key: OnboardingTutorialService.drawerClearHistoryKey,
          child: _buildActionButton(
            icon: Icons.delete_sweep_outlined,
            label: 'Clear History',
            onTap: () => _showClearHistoryDialog(context),
          ),
        ),
        _buildActionButton(
          icon: Icons.logout_rounded,
          label: 'Logout',
          iconColor: const Color(0xFFEF4444).withOpacity(0.8),
          textColor: const Color(0xFFEF4444),
          onTap: () async {
            AnalyticsService.stopSessionRecording();

            final preferences = await SharedPreferences.getInstance();
            await preferences.remove('token');

            if (context.mounted) {
              showToast("Log out successfully", context, 1);
              await Future.delayed(const Duration(milliseconds: 500));
              context.go(RouteConstants.login.path);
            }
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
