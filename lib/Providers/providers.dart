import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/models/nutrition_model.dart';

final NutritionDetailsProvider =
    FutureProvider.family<Nutrition, String>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider.notifier);
  final nutrition = await apiService.getNutritionById(id);

  if (nutrition == null) {
    throw Exception('No nutrition data found for the given ID');
  } else {
    print('Nutrition data found for the given ID');
  }

  return nutrition;
});

final appProvider = AsyncNotifierProvider<ApiService, ApiState>(
  ApiService.new,
);

final nutritionsProvider =
    FutureProvider.autoDispose<List<Nutrition>>((ref) async {
  final api = ref.read(apiServiceProvider.notifier);
  return api.getNutritions();
});
