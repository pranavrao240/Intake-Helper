import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NutritionHeroSection extends HookConsumerWidget {
  final String dishName;
  final String? imageUrl;
  final bool isSaved;
  final String id;

  const NutritionHeroSection({
    super.key,
    required this.dishName,
    required this.isSaved,
    required this.id,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = useState(isSaved);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
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
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _GlassButton(
                  onTap: () => context.pop(),
                  child: const Icon(LucideIcons.arrowLeft,
                      color: Colors.white, size: 18),
                ),
                _GlassButton(
                  onTap: () async {
                    isLiked.value = !isLiked.value;
                    await ref
                        .read(apiServiceProvider.notifier)
                        .updateSavedNutritions(id);
                  },
                  child: Icon(
                    isLiked.value ? Icons.favorite : Icons.favorite_border,
                    color: Color(0xFFEF4444),
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
