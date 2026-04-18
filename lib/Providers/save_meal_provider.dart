import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/api/save_meal_service.dart';

final saveMealProvider = AsyncNotifierProvider<SaveMealService, SavedMealState>(
  SaveMealService.new,
);
