import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/models/save_meal_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedMealState {
  final bool success;
  final String message;
  final String errorMessage;
  final List<SavedMealModel>? savedMeals;
  final PaginationModel? pagination;
  final bool? isSaved;

  SavedMealState({
    required this.success,
    required this.message,
    required this.errorMessage,
    required this.savedMeals,
    required this.pagination,
    required this.isSaved,
  });

  SavedMealState copyWith({
    bool? success,
    String? message,
    String? errorMessage,
    List<SavedMealModel>? savedMeals,
    PaginationModel? pagination,
    bool? isSaved,
  }) {
    return SavedMealState(
      success: success ?? this.success,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      savedMeals: savedMeals ?? this.savedMeals,
      pagination: pagination ?? this.pagination,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}

class SaveMealService extends AsyncNotifier<SavedMealState> {
  final dio = Dio();
  @override
  SavedMealState build() {
    return SavedMealState(
      success: false,
      message: '',
      errorMessage: '',
      savedMeals: [],
      pagination: null,
      isSaved: false,
    );
  }

  Future<void> getSavedMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await dio.get(
      '${Config.baseUrl}${Config.savedMealsAPI}',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    debugPrint('Save meal response: ${response.data}');

    try {
      if (response.statusCode == 200) {
        final data = (response.data['data'] as List)
            .map((e) => SavedMealModel.fromJson(e))
            .toList();

        debugPrint('Saved meals: $data');

        state = AsyncValue.data(
          state.value!.copyWith(
            success: true,
            message: response.data['message'] ?? '',
            savedMeals: data,
            pagination: null,
          ),
        );
      }
    } on DioException catch (e) {
      debugPrint('Save meal error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage:
              response.data['message'] ?? 'Failed to fetch saved meals',
          savedMeals: [],
          pagination: null,
        ),
      );
    } on Exception catch (e) {
      debugPrint('Save meal error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage:
              response.data['message'] ?? 'Failed to fetch saved meals',
          savedMeals: [],
          pagination: null,
        ),
      );
    }
  }

  Future<void> postSavedMeals({
    required String nutritionId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await dio.post(
      '${Config.baseUrl}${Config.savedMealsAPI}',
      data: {
        'nutritionId': nutritionId,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    debugPrint('Save meal response: ${response.data}');

    try {
      if (response.statusCode == 200) {
        final responseData = response.data;
        final message = responseData['message'] ?? '';

        // Handle "Meal already saved" as success case
        if (responseData['success'] == true ||
            message == 'Meal already saved') {
          state = AsyncValue.data(
            state.value!.copyWith(
              success: true,
              message: message,
              pagination: null,
            ),
          );
        } else {
          // Handle other false success cases
          state = AsyncValue.data(
            state.value!.copyWith(
              success: false,
              errorMessage: message,
              savedMeals: [],
              pagination: null,
            ),
          );
        }
      }
    } on DioException catch (e) {
      debugPrint('Save meal error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage:
              response.data['message'] ?? 'Failed to fetch saved meals',
          savedMeals: [],
          pagination: null,
        ),
      );
    } on Exception catch (e) {
      debugPrint('Save meal error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage:
              response.data['message'] ?? 'Failed to fetch saved meals',
          savedMeals: [],
          pagination: null,
        ),
      );
    }
  }

  Future<void> unSaveMeal({
    required String savedMealId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await dio.delete(
      '${Config.baseUrl}${Config.savedMealsAPI}/$savedMealId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    debugPrint('Save meal response: ${response.data}');

    try {
      if (response.statusCode == 200) {
        state = AsyncValue.data(
          state.value!.copyWith(
            success: true,
            message: response.data['message'] ?? '',
          ),
        );
      }
    } on DioException catch (e) {
      debugPrint('Save meal error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage:
              response.data['message'] ?? 'Failed to fetch saved meals',
          savedMeals: [],
        ),
      );
    } on Exception catch (e) {
      debugPrint('Save meal error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage:
              response.data['message'] ?? 'Failed to fetch saved meals',
          savedMeals: [],
        ),
      );
    }
  }

  String? getSavedMealId(String nutritionId) {
    final savedMeals = state.value?.savedMeals;
    if (savedMeals == null) return null;

    try {
      final savedMeal = savedMeals.firstWhere(
        (meal) => meal.nutritionId.id == nutritionId,
      );
      return savedMeal.id;
    } catch (e) {
      return null;
    }
  }

  Future<void> checkSavedMeal({
    required String nutritionId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await dio.get(
      '${Config.baseUrl}${Config.checkSavedMealAPI}/$nutritionId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    debugPrint('Check saved meal response: ${response.data}');

    try {
      if (response.statusCode == 200) {
        print('Check saved meal response: ${response.data['isSaved']}');
        state = AsyncValue.data(
          state.value!.copyWith(
            success: true,
            message: response.data['message'] ?? '',
            isSaved: response.data['isSaved'] ?? false,
          ),
        );
      }
    } on DioException catch (e) {
      debugPrint('Check saved meal error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage:
              response.data['message'] ?? 'Failed to fetch saved meals',
          savedMeals: [],
        ),
      );
    } on Exception catch (e) {
      debugPrint('Check saved meal error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage:
              response.data['message'] ?? 'Failed to fetch saved meals',
          savedMeals: [],
        ),
      );
    }
  }
}
