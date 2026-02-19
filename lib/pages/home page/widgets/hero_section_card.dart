// ---------------- HERO SECTION ----------------
import 'package:flutter/material.dart';
import 'package:intake_helper/models/user_model.dart';
import 'package:intake_helper/pages/home%20page/HomePage.dart';

Widget buildHeroSection(BuildContext context, Map<String, double> macros,
    Map<String, double> targets, double proteinPercent, ProfileData? profile) {
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else if (hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  final greeting = getGreeting();

  print('Profile --> $profile');

  return Container(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFFDC2626), Color(0xFFB91C1C), Colors.black],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFDC2626).withValues(alpha: 0.4),
          blurRadius: 30,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    padding: const EdgeInsets.fromLTRB(24, 60, 24, 112),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$greeting, ${profile?.fullName ?? 'User'}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 32),
        // Circular Progress
        Center(
          child: SizedBox(
            width: 224,
            height: 224,
            child: Stack(
              children: [
                // Background Circle
                CustomPaint(
                  size: const Size(224, 224),
                  painter: CircularProgressPainter(
                    progress: 1.0,
                    color: Colors.white.withOpacity(0.15),
                    strokeWidth: 14,
                  ),
                ),
                // Progress Circle
                CustomPaint(
                  size: const Size(224, 224),
                  painter: CircularProgressPainter(
                    progress: proteinPercent / 100,
                    color: Colors.white,
                    strokeWidth: 14,
                  ),
                ),
                // Center Text
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PROTEIN',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 11,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${macros['protein']!.toInt()}g',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '/ ${targets['protein']!.toInt()}g',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
