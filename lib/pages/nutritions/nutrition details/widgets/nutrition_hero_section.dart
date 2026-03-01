import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NutritionHeroSection extends StatelessWidget {
  final String dishName;
  final String tag;
  final String? imageUrl;

  const NutritionHeroSection({
    super.key,
    required this.dishName,
    required this.tag,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ── Hero image ──
          imageUrl != null && imageUrl!.isNotEmpty
              ? Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFF1A1A2E),
                    child: const Icon(Icons.restaurant,
                        color: Colors.white24, size: 60),
                  ),
                )
              : Container(
                  color: const Color(0xFF1A1A2E),
                  child: const Icon(Icons.restaurant,
                      color: Colors.white24, size: 60),
                ),

          // ── Bottom gradient ──
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black26,
                  Color(0xFF0A0A0A),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // ── Top bar (back + heart) ──
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button
                _GlassButton(
                  onTap: () => context.pop(),
                  child: const Icon(LucideIcons.arrowLeft,
                      color: Colors.white, size: 18),
                ),
                // Heart button
                _GlassButton(
                  onTap: () {},
                  child: const Icon(LucideIcons.heart,
                      color: Color(0xFFEF4444), size: 18),
                ),
              ],
            ),
          ),

          // ── Title at bottom ──
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tag pill
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Text(
                    tag.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.8,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  dishName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const _GlassButton({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.12)),
        ),
        child: Center(child: child),
      ),
    );
  }
}
