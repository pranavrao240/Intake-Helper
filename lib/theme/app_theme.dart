import 'package:flutter/material.dart';

class AppTheme {
  // ======= PRIMARY COLORS (matching React UI) =======
  static const Color primaryRed = Color(0xFFEF4444); // red-500 — main accent
  static const Color darkRed =
      Color(0xFFB91C1C); // red-700 — hero gradient start
  static const Color mediumRed =
      Color(0xFFDC2626); // red-600 — hero gradient mid
  static const Color lightRed =
      Color(0xFFFFEDED); // soft red tint for light mode

  static const Color primaryBlue =
      Color(0xFF60A5FA); // blue-400 — secondary actions
  static const Color darkBlue = Color(0xFF2563EB); // blue-600 — secondary hover

  // ======= NEUTRALS =======
  static const Color bgBlack = Color(0xFF000000); // scaffold background
  static const Color surfaceDark = Color(0xFF18181B); // zinc-900 — glass cards
  static const Color borderDark = Color(0xFF27272A); // zinc-800 — card borders
  static const Color textMuted = Color(0xFF71717A); // zinc-500
  static const Color textSubtle = Color(0xFFA1A1AA); // zinc-400

  // ======= SEMANTIC =======
  static const Color success = Color(0xFF22C55E); // green-500 — completed meals
  static const Color successBg = Color(0xFF14532D); // green-900 bg tint

  // ─────────────────────────────────────────────────────────────────
  // DARK THEME  (primary experience — matches React's black UI)
  // ─────────────────────────────────────────────────────────────────
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF6D28D9),
    scaffoldBackgroundColor: bgBlack,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF6D28D9),
      secondary: primaryBlue,
      surface: surfaceDark,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: bgBlack,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryRed,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryRed,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: primaryRed.withOpacity(0.08),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: primaryRed.withOpacity(0.4)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        borderSide: BorderSide(color: primaryRed, width: 2),
      ),
      labelStyle: const TextStyle(color: textSubtle),
      prefixIconColor: primaryRed,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
    ),
    dividerColor: borderDark,
    cardColor: surfaceDark,
  );

  // ─────────────────────────────────────────────────────────────────
  // LIGHT THEME
  // ─────────────────────────────────────────────────────────────────
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF6D28D9),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6D28D9),
      secondary: primaryBlue,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryRed,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryRed,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryRed,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightRed.withOpacity(0.4),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: primaryRed),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        borderSide: BorderSide(color: darkRed, width: 2),
      ),
      labelStyle: const TextStyle(color: darkRed),
      prefixIconColor: primaryRed,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 14),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    dividerColor: const Color(0xFFE4E4E7),
    cardColor: const Color(0xFFFAFAFA),
  );
}
