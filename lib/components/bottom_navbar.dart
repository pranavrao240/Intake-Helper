import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intake_helper/router.dart';

class BottomNavbar extends HookConsumerWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPath = GoRouterState.of(context).uri.path;

    bool isActive(String path) {
      if (path == "/") return currentPath == "/";
      return currentPath.startsWith(path);
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF09090B).withValues(alpha: 0.95),
        border: const Border(
          top: BorderSide(color: Color(0xFF27272A), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 30,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Home
                _NavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  path: '/',
                  isActive: isActive(RouteConstants.home.path),
                  onTap: () => context.go(RouteConstants.home.path),
                ),
                // Meals
                _NavItem(
                  icon: Icons.check_box_rounded,
                  label: 'Meals',
                  path: '/todo',
                  isActive: isActive(RouteConstants.todo.path),
                  onTap: () => context.go(RouteConstants.todo.path),
                ),
                // Nutrition
                _NavItem(
                  icon: Icons.restaurant_rounded,
                  label: 'Nutrition',
                  path: '/nutrition-list',
                  isActive: isActive(RouteConstants.nutrition.path),
                  onTap: () => context.go(RouteConstants.nutrition.path),
                ),
                // Profile
                _NavItem(
                  icon: Icons.person_rounded,
                  label: 'Profile',
                  path: '/profile',
                  isActive: isActive(RouteConstants.settings.path),
                  onTap: () => context.go(RouteConstants.settings.path),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends HookWidget {
  final IconData icon;
  final String label;
  final String path;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.path,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      initialValue: isActive ? 1.0 : 0.0,
    );

    final scaleAnimation = useAnimation(
      Tween<double>(begin: 1.0, end: 1.1).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut,
        ),
      ),
    );

    final colorAnimation = useAnimation(
      ColorTween(
        begin: const Color(0xFF71717A), // zinc-400
        end: const Color(0xFFEF4444), // red-500
      ).animate(animationController),
    );

    useEffect(() {
      if (isActive) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      return null;
    }, [isActive]);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Transform.scale(
              scale: scaleAnimation,
              child: Icon(
                icon,
                size: 24,
                color: colorAnimation,
              ),
            ),
            const SizedBox(height: 6),
            // Label
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: 12,
                color: colorAnimation,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
              ),
              child: Text(label),
            ),
            // Active Indicator Dot
            if (isActive) ...[
              const SizedBox(height: 4),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFFEF4444),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEF4444).withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ] else
              const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
