import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NutritionItemCard extends StatelessWidget {
  final Nutrition item;

  const NutritionItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.id != null) {
          context.pushNamed(
            RouteConstants.mealDetails.name,
            pathParameters: {'id': item.id!},
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF18181B),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.07)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Food image (fixed height) ──
            _FoodImage(dishName: item.dishName),

            // ── Card body ──
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.dishName ?? 'Unknown',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: _MacroChip(
                          icon: LucideIcons.flame,
                          iconColor: const Color(0xFFEF4444),
                          label: '${item.calories?.toInt() ?? 0} kcal',
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: _MacroChip(
                          icon: LucideIcons.heart,
                          iconColor: const Color(0xFFEF4444),
                          label: '${item.protein?.toInt() ?? 0}g Protein',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: _MacroChip(
                          icon: LucideIcons.salad,
                          iconColor: const Color(0xFF22C55E),
                          label: '${item.carbohydrates?.toInt() ?? 0}g Carbs',
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: _MacroChip(
                          icon: LucideIcons.droplets,
                          iconColor: const Color(0xFF60A5FA),
                          label: 'Fats',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Food placeholder image ───────────────────────────────────────────────────
class _FoodImage extends StatelessWidget {
  final String? dishName;
  const _FoodImage({this.dishName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E1B4B), Color(0xFF1A1A2E)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Icon(
              LucideIcons.utensils,
              color: Colors.white.withOpacity(0.15),
              size: 34,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.35),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Single macro chip ────────────────────────────────────────────────────────
class _MacroChip extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  const _MacroChip({
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 13, color: iconColor),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
