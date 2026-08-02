import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/api/meal_suggestion_history_service.dart';

final mealSuggestionHistoryProvider = AsyncNotifierProvider<
    MealSuggestionHistoryService, MealSuggestionHistoryState>(
  MealSuggestionHistoryService.new,
);
