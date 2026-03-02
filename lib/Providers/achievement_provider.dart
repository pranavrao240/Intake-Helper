// --- Model ---
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Achievement {
  final String id;
  final String title;
  final String emoji;
  final bool unlocked;

  const Achievement({
    required this.id,
    required this.title,
    required this.emoji,
    required this.unlocked,
  });
}

// --- Provider ---
final achievementsProvider = Provider<List<Achievement>>((ref) {
  return const [
    // Achievement(id: '7day', title: '7 Day Streak', emoji: '🔥', unlocked: true),
    // Achievement(
    //     id: 'protein', title: 'Protein King', emoji: '🥩', unlocked: true),
    // Achievement(id: 'goal', title: 'Goal Crusher', emoji: '🎯', unlocked: true),
    // Achievement(
    //     id: 'analyzer', title: 'Analyzer', emoji: '📊', unlocked: false),
    // Achievement(
    //     id: 'hydration', title: 'Hydration Hero', emoji: '💧', unlocked: false),
    // Achievement(
    //     id: 'earlybird', title: 'Early Bird', emoji: '🌅', unlocked: false),
  ];
});
