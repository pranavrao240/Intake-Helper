import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

// ── Goal Insight card ────────────────────────────────────────────────────────
class GoalInsightCard extends StatelessWidget {
  final String insight;
  const GoalInsightCard({super.key, required this.insight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFEF4444).withOpacity(0.07),
        borderRadius: BorderRadius.circular(24),
        border:
            Border.all(color: const Color(0xFFEF4444).withOpacity(0.2)),
      ),
      child: Text(
        '"$insight"',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white.withOpacity(0.75),
          fontSize: 13,
          fontStyle: FontStyle.italic,
          height: 1.6,
        ),
      ),
    );
  }
}

// ── Floating bottom bar ──────────────────────────────────────────────────────
class NutritionBottomBar extends StatelessWidget {
  final int portion;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final VoidCallback onAddMeal;

  const NutritionBottomBar({
    super.key,
    required this.portion,
    required this.onDecrement,
    required this.onIncrement,
    required this.onAddMeal,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 28,
      left: 40,
      right: 40,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            // Portion +/- controls
            Row(
              children: [
                _PortionButton(
                  icon: LucideIcons.minus,
                  onTap: onDecrement,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '$portion',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                _PortionButton(
                  icon: LucideIcons.plus,
                  onTap: onIncrement,
                ),
              ],
            ),

            // Divider
            Container(
              width: 1,
              height: 24,
              color: Colors.black.withOpacity(0.1),
              margin: const EdgeInsets.symmetric(horizontal: 12),
            ),

            // Add Meal label
            const Expanded(
              child: Text(
                'ADD MEAL',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ),

            // Flame button
            GestureDetector(
              onTap: onAddMeal,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    LucideIcons.flame,
                    color: Color(0xFFEF4444),
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PortionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _PortionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 28,
        height: 28,
        child: Center(
          child: Icon(icon, color: Colors.black, size: 16),
        ),
      ),
    );
  }
}
