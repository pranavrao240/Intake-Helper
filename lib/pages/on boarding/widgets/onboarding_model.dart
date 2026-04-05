import 'package:flutter/material.dart';

class OnboardingStep {
  final int id;
  final String title;
  final String description;
  final IconData icon;
  final List<String> features;
  final String imageUrl;

  const OnboardingStep({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.features,
    required this.imageUrl,
  });
}

final List<OnboardingStep> onboardingSteps = [
  OnboardingStep(
    id: 1,
    title: 'Welcome to Intake Helper',
    description:
        'Your personal nutrition companion for achieving your health goals',
    icon: Icons.auto_awesome_rounded,
    features: [
      'Track your daily protein and macros',
      'Get AI-powered nutrition insights',
      'Build healthy eating habits',
    ],
    imageUrl:
        'https://images.unsplash.com/photo-1490645935967-10de6ba17061?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
  ),
  OnboardingStep(
    id: 2,
    title: 'Set Your Targets',
    description: 'Define your daily nutrition goals and watch your progress',
    icon: Icons.track_changes_rounded,
    features: [
      'Customize protein, carbs, and fat goals',
      'Visual progress rings show your status',
      'Weekly tracking charts',
    ],
    imageUrl:
        'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
  ),
  OnboardingStep(
    id: 3,
    title: 'Track Your Meals',
    description: 'Log breakfast, lunch, dinner, and snacks with ease',
    icon: Icons.apple_rounded,
    features: [
      'Quick meal logging with saved favorites',
      'Barcode scanner for packaged foods',
      'See completed, upcoming, and missed meals',
    ],
    imageUrl:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
  ),
  OnboardingStep(
    id: 4,
    title: 'Get AI Insights',
    description:
        'Receive personalized recommendations to optimize your nutrition',
    icon: Icons.trending_up_rounded,
    features: [
      'AI analyzes your eating patterns',
      'Personalized meal suggestions',
      'Tips to reach your goals faster',
    ],
    imageUrl:
        'https://images.unsplash.com/photo-1551963831-b3b1ca40c98e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
  ),
  OnboardingStep(
    id: 5,
    title: 'Build Your Streak',
    description: 'Stay consistent and earn achievements for your dedication',
    icon: Icons.emoji_events_rounded,
    features: [
      'Track your consistency streak',
      'Unlock badges and achievements',
      'Celebrate your milestones',
    ],
    imageUrl:
        'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
  ),
];

// ── App colour palette (matches home/macro/meal screens) ──────────────────────

// Backgrounds — same layered darks as Today's Macros card
const Color kBgDeep   = Color(0xFF0F0E1A); // deepest bg
const Color kBgBase   = Color(0xFF1A1830); // card / scaffold base  ← indigo-950 ish
const Color kBgMid    = Color(0xFF252346); // raised surface
const Color kBgCard   = Color(0xFF1E1C38); // card fill (Today's Macros bg)

// Borders / dividers
const Color kBorder   = Color(0xFF2E2C50);

// Text
const Color kTextPrimary = Color(0xFFFFFFFF);
const Color kTextSub     = Color(0xFFB0ADDB);   // muted lavender
const Color kTextMuted   = Color(0xFF6E6A9A);   // dim label

// Accent — indigo→violet gradient (progress bars, buttons, active dots)
const Color kAccentBlue    = Color(0xFF6366F1);  // indigo-500
const Color kAccentViolet  = Color(0xFF8B5CF6);  // violet-500
const Color kAccentIndigo  = Color(0xFF4338CA);  // indigo-700

const LinearGradient kAccentGradient = LinearGradient(
  colors: [kAccentBlue, kAccentViolet],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

// Protein bar accent (pink→blue like the app's protein macro bar)
const LinearGradient kProteinGradient = LinearGradient(
  colors: [Color(0xFFEC4899), Color(0xFF6366F1)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
