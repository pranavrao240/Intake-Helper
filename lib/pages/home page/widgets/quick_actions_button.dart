// ---------------- QUICK ACTIONS ----------------
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/router.dart';

Widget buildQuickActions(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      children: [
        // Add Meal Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.push(RouteConstants.nutrition.path);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              shadowColor: const Color(0xFFDC2626).withOpacity(0.3),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Add Meal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // AI Plan & Scan Buttons
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  context.push(RouteConstants.aiMealPlanner.path);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF18181B),
                  side: const BorderSide(color: Color(0xFF3B82F6)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '✨',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'AI Plan',
                      style: TextStyle(
                        color: Color(0xFF60A5FA),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  //TODO: Add Scan functionality
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF18181B),
                  side: const BorderSide(color: Color(0xFF3B82F6)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner,
                        color: Color(0xFF60A5FA), size: 18),
                    SizedBox(width: 6),
                    Text(
                      'Scan',
                      style: TextStyle(
                        color: Color(0xFF60A5FA),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
