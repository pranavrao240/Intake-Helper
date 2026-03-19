import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/Providers/settings_providers.dart';
import 'package:intake_helper/common_functions/units_conversion.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NutritionItemCard extends HookConsumerWidget {
  final Nutrition item;

  const NutritionItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitsConversion = ref.read(weightUnitProvider);

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
            _FoodImage(
              dishName: item.dishName,
              dishImage: item.dishImage,
            ),

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
                            label: unitsConversion == WeightUnit.kg
                                ? '${item.calories?.toDouble() ?? 0} kcal'
                                : '${kilogramsToPounds(item.calories?.toDouble() ?? 0).toStringAsFixed(2)} lb'),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: _MacroChip(
                          icon: LucideIcons.drumstick,
                          iconColor: const Color(0xFFEF4444),
                          label: unitsConversion == WeightUnit.kg
                              ? '${item.protein?.toDouble() ?? 0}g Protein'
                              : '${kilogramsToPounds(item.protein?.toDouble() ?? 0).toStringAsFixed(2)} lb Protein',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: _MacroChip(
                          icon: LucideIcons.wheat,
                          iconColor: const Color(0xFF22C55E),
                          label: unitsConversion == WeightUnit.kg
                              ? '${item.carbohydrates?.toDouble() ?? 0}g Carbs'
                              : '${kilogramsToPounds(item.carbohydrates?.toDouble() ?? 0).toStringAsFixed(2)} lb Carbs',
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: _MacroChip(
                          icon: LucideIcons.droplets,
                          iconColor: const Color(0xFF60A5FA),
                          label: unitsConversion == WeightUnit.kg
                              ? '${item.fats?.toDouble() ?? 0}g Fats'
                              : '${kilogramsToPounds(item.fats?.toDouble() ?? 0).toStringAsFixed(2)} lb Fats',
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

class _FoodImage extends StatelessWidget {
  final String? dishName;
  final String? dishImage;

  const _FoodImage({this.dishName, this.dishImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: dishImage != null
          ? Image.network(
              dishImage!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 130,

              // 👇 Loader while image loads
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },

              // 👇 If image fails to load
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.broken_image, color: Colors.grey),
                );
              },
            )
          : Stack(
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
                    color: Colors.white.withValues(alpha: 0.15),
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
                          Colors.black.withValues(alpha: 0.35),
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
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
