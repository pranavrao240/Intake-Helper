import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/l10n/app_localizations.dart';
import 'package:intake_helper/pages/home page/widgets/macros_card.dart';

Widget buildQuickActions(BuildContext context, Map<String, double>? targets,
    ValueChanged<Map<String, double>> onTargetSaved) {
  final locale = AppLocalizations.of(context)!;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (targets == null) {
                showSetTargetSheet(context, onTargetSaved);
              } else {
                context.push(RouteConstants.nutrition.path);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: targets == null
                  ? const Color(0xFF2563EB)
                  : const Color(0xFF6D28D9),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              shadowColor: const Color(0xFFDC2626).withValues(alpha: 0.3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(targets == null ? Icons.track_changes : Icons.add,
                    color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  targets == null ? 'Set target' : locale.quickActionsAddMeal,
                  style: const TextStyle(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '✨',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      locale.quickActionsAiPlan,
                      style: const TextStyle(
                        color: Color(0xFF60A5FA),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(width: 16),
            // Expanded(
            //   child: OutlinedButton(
            //     onPressed: () async {
            //       final prefs = await SharedPreferences.getInstance();
            //       final avatar = prefs.getString('avatar');
            //       //TODO: Add Scan functionality
            //       showDialog(
            //         context: context,
            //         builder: (context) => StreakCelebrationDialog(
            //           streakCount: 4,
            //           avatar: avatar!,
            //         ),
            //       );
            //     },
            //     style: OutlinedButton.styleFrom(
            //       backgroundColor: const Color(0xFF18181B),
            //       side: const BorderSide(color: Color(0xFF3B82F6)),
            //       padding: const EdgeInsets.symmetric(vertical: 12),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(16),
            //       ),
            //     ),
            //     child: const Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(Icons.qr_code_scanner,
            //             color: Color(0xFF60A5FA), size: 18),
            //         SizedBox(width: 6),
            //         Text(
            //           'Scan',
            //           style: TextStyle(
            //             color: Color(0xFF60A5FA),
            //             fontSize: 14,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    ),
  );
}
