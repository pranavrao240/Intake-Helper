import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/models/nutrition_model.dart';

final NutritionDetailsProvider =
    FutureProvider.family<Nutrition, String>((ref, id) async {
  final apiService = ref.watch(apiservice);
  final nutrition = await apiService.getNutritionById(id);

  if (nutrition == null) {
    throw Exception('No nutrition data found for the given ID');
  }

  return nutrition;
});
