//TODO: CURRENTLY HARDCODED - NEED TO FETCH FROM DATABASE
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/router.dart';

Widget buildSavedMeals(BuildContext context) {
  final savedMeals = [
    {
      'id': '1',
      'name': 'Grilled Chicken',
      'protein': '35g',
      'image':
          'https://images.unsplash.com/photo-1679279726937-122c49626802?auto=format&fit=crop&w=800&q=80'
    },
    {
      'id': '2',
      'name': 'Salmon Bowl',
      'protein': '32g',
      'image':
          'https://images.unsplash.com/photo-1768326119213-e0ad875083a3?auto=format&fit=crop&w=800&q=80'
    },
    {
      'id': '3',
      'name': 'Protein Breakfast',
      'protein': '28g',
      'image':
          'https://images.unsplash.com/photo-1589786741892-824d46e61d61?auto=format&fit=crop&w=800&q=80'
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          'Saved Meals',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(height: 16),
      SizedBox(
        height: 240,
        child: ListView.builder(
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
                margin: EdgeInsets.only(right: index < 2 ? 16 : 0),
                decoration: BoxDecoration(
                  color: const Color(0xFF18181B),
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
                        meal['image']!,
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
                              const Icon(
                                Icons.favorite,
                                color: Color(0xFFEF4444),
                                size: 16,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${meal['protein']} Protein',
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
