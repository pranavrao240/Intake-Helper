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
  print(meals.value?.savedMeals?.length);

  final savedMeals = meals.value?.savedMeals
          ?.map(
            (meal) => {
              'id': meal.nutritionId.id, // Use nutritionId for navigation
              'savedMealId': meal.id, // Keep saved meal ID for reference
              'name': meal.nutritionId.dishName,
              'protein': meal.nutritionId.protein.toString(),
              'image': meal.nutritionId.dishImage,
            },
          )
          .toList() ??
      [];

  print('saved meals: ${meals.value?.savedMeals?.length}');

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
          ? Container(
              height: 200,
              child: Center(
                child: Text(
                  locale.savedMealsEmpty,
                  style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.surface.withValues(alpha: 0.8)),
                ),
              ),
            )
          : SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: savedMeals.length,
                itemBuilder: (context, index) {
                  final meal = savedMeals[index];
                  return GestureDetector(
                    onTap: () {
                      print('meal: ${meal['id']}');
                      context.pushNamed(
                        RouteConstants.mealDetails.name,
                        pathParameters: {'id': meal['id']!},
                      );
                    },
                    child: Container(
                      width: 176,
                      margin: EdgeInsets.only(right: index < 2 ? 16 : 0),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    const Icon(
                                      Icons.favorite,
                                      color: Color(0xFFEF4444),
                                      size: 16,
                                    ),
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
            ),
    ],
  );
}
