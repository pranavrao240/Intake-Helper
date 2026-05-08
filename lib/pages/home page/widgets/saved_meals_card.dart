import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/l10n/app_localizations.dart';
import 'package:intake_helper/Providers/save_meal_provider.dart';

Widget buildSavedMeals(BuildContext context, WidgetRef ref) {
  final locale = AppLocalizations.of(context)!;
  final theme = Theme.of(context);

  Future<void> getSavedMeals() async {
    await ref.read(saveMealProvider.notifier).getSavedMeals();
  }

  useEffect(() {
    Future.microtask(() {
      getSavedMeals();
    });
    return null;
  }, []);

  final meals = ref.watch(saveMealProvider);

  final savedMeals = meals.value?.savedMeals
          ?.map(
            (meal) => {
              'id': meal.nutritionId.id,
              'savedMealId': meal.id,
              'name': meal.nutritionId.dishName,
              'protein': meal.nutritionId.protein.toString(),
              'image': meal.nutritionId.dishImage,
            },
          )
          .toList() ??
      [];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          locale.savedMealsTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(height: 16),
      savedMeals.isEmpty
          ? SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  locale.savedMealsEmpty,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.surface.withValues(alpha: 0.8),
                  ),
                ),
              ),
            )
          : _ScrollableMealList(savedMeals: savedMeals, locale: locale),
    ],
  );
}

// ── Scrollable list with arrow indicators ─────────────────────────────────────

class _ScrollableMealList extends HookWidget {
  final List<Map<String, String?>> savedMeals;
  final dynamic locale;

  const _ScrollableMealList({
    required this.savedMeals,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final scrollCtrl = useScrollController();
    final showLeft = useState(false);
    final showRight = useState(savedMeals.length > 1);

    useEffect(() {
      void listener() {
        final pos = scrollCtrl.position;
        showLeft.value = pos.pixels > 12;
        showRight.value = pos.pixels < pos.maxScrollExtent - 12;
      }

      scrollCtrl.addListener(listener);
      return () => scrollCtrl.removeListener(listener);
    }, [scrollCtrl]);

    return SizedBox(
      height: 240,
      child: Stack(
        children: [
          // ── Meal list ───────────────────────────────────────────────────
          ListView.builder(
            controller: scrollCtrl,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: savedMeals.length,
            itemBuilder: (context, index) {
              final meal = savedMeals[index];
              return GestureDetector(
                onTap: () {
                  context.pushNamed(
                    RouteConstants.mealDetails.name,
                    pathParameters: {'id': meal['id']!},
                  );
                },
                child: Container(
                  width: 176,
                  margin: EdgeInsets.only(
                      right: index < savedMeals.length - 1 ? 16 : 0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0B1220),
                    border: Border.all(color: const Color(0xFF27272A)),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                        child: Image.network(
                          meal['image'] ??
                              'https://plakarestaurant.ca/wp-content/themes/twentytwentythree-child/img/food-placeholder.png',
                          height: 144,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 144,
                              color: const Color(0xFF27272A),
                              child: const Icon(Icons.restaurant,
                                  color: Colors.white54, size: 48),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    meal['name']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Icon(Icons.favorite,
                                    color: Color(0xFFEF4444), size: 16),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${meal['protein']}${locale.savedMealsProtein}',
                              style: const TextStyle(
                                color: Color(0xFF71717A),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // ── Left arrow ──────────────────────────────────────────────────
          Positioned(
            left: 4,
            top: 0,
            bottom: 0,
            child: Center(
              child: _ScrollArrow(
                visible: showLeft.value,
                direction: _ArrowDirection.left,
                onTap: () => scrollCtrl.animateTo(
                  scrollCtrl.offset - 192,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                ),
              ),
            ),
          ),

          // ── Right arrow ─────────────────────────────────────────────────
          Positioned(
            right: 4,
            top: 0,
            bottom: 0,
            child: Center(
              child: _ScrollArrow(
                visible: showRight.value,
                direction: _ArrowDirection.right,
                onTap: () => scrollCtrl.animateTo(
                  scrollCtrl.offset + 192,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Arrow button ──────────────────────────────────────────────────────────────

enum _ArrowDirection { left, right }

class _ScrollArrow extends StatelessWidget {
  final bool visible;
  final _ArrowDirection direction;
  final VoidCallback onTap;

  const _ScrollArrow({
    required this.visible,
    required this.direction,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 220),
      opacity: visible ? 1.0 : 0.0,
      child: IgnorePointer(
        ignoring: !visible,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF0B1220).withOpacity(0.85),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF27272A),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              direction == _ArrowDirection.left
                  ? Icons.chevron_left_rounded
                  : Icons.chevron_right_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
