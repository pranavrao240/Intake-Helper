import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/models/meal_suggestion_history_model.dart';
import 'package:intake_helper/models/save_meal_model.dart'; // For PaginationModel
import 'package:shared_preferences/shared_preferences.dart';

class MealSuggestionHistoryState {
  final bool success;
  final String message;
  final String errorMessage;
  final List<MealSuggestionHistoryModel> historyList;
  final PaginationModel? pagination;

  MealSuggestionHistoryState({
    required this.success,
    required this.message,
    required this.errorMessage,
    required this.historyList,
    required this.pagination,
  });

  MealSuggestionHistoryState copyWith({
    bool? success,
    String? message,
    String? errorMessage,
    List<MealSuggestionHistoryModel>? historyList,
    PaginationModel? pagination,
  }) {
    return MealSuggestionHistoryState(
      success: success ?? this.success,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      historyList: historyList ?? this.historyList,
      pagination: pagination ?? this.pagination,
    );
  }
}

class MealSuggestionHistoryService
    extends AsyncNotifier<MealSuggestionHistoryState> {
  final dio = Dio();

  @override
  MealSuggestionHistoryState build() {
    return MealSuggestionHistoryState(
      success: false,
      message: '',
      errorMessage: '',
      historyList: [],
      pagination: null,
    );
  }

  Future<void> saveHistory({
    required String prompt,
    required dynamic response,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final apiResponse = await dio.post(
        '${Config.baseUrl}${Config.aiMealSuggestionHistory}',
        data: {
          'prompt': prompt,
          'response': response,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      debugPrint('Save history response: ${apiResponse.data}');

      if (apiResponse.statusCode == 201 &&
          apiResponse.data['success'] == true) {
        final savedItem =
            MealSuggestionHistoryModel.fromJson(apiResponse.data['data']);

        final currentHistory =
            List<MealSuggestionHistoryModel>.from(state.value?.historyList ?? []);
        currentHistory.insert(0, savedItem);

        state = AsyncValue.data(
          state.value!.copyWith(
            success: true,
            message:
                apiResponse.data['message'] ?? 'History saved successfully',
            historyList: currentHistory,
          ),
        );
      } else {
        state = AsyncValue.data(
          state.value!.copyWith(
            success: false,
            errorMessage:
                apiResponse.data['message'] ?? 'Failed to save history',
          ),
        );
      }
    } on DioException catch (e) {
      debugPrint('Save history error: $e');
      final errMessage =
          e.response?.data?['message'] ?? 'Failed to save history';
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage: errMessage,
        ),
      );
    } on Exception catch (e) {
      debugPrint('Save history error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> getHistory({
    int page = 1,
    int limit = 20,
    String? searchText,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final Map<String, dynamic> queryParams = {
        'page': page,
        'limit': limit,
      };
      if (searchText != null && searchText.trim().isNotEmpty) {
        queryParams['searchText'] = searchText.trim();
      }

      final apiResponse = await dio.get(
        '${Config.baseUrl}${Config.aiMealSuggestionHistory}',
        queryParameters: queryParams,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      debugPrint('Get history response: ${apiResponse.data}');

      if (apiResponse.statusCode == 200 &&
          apiResponse.data['success'] == true) {
        final items = (apiResponse.data['data'] as List)
            .map((e) => MealSuggestionHistoryModel.fromJson(e))
            .toList();

        PaginationModel? pagination;
        if (apiResponse.data['pagination'] != null) {
          pagination = PaginationModel.fromJson(apiResponse.data['pagination']);
        }

        final List<MealSuggestionHistoryModel> updatedList;
        if (page == 1) {
          updatedList = items;
        } else {
          updatedList =
              List<MealSuggestionHistoryModel>.from(state.value?.historyList ?? [])
                ..addAll(items);
        }

        state = AsyncValue.data(
          state.value!.copyWith(
            success: true,
            message: apiResponse.data['message'] ??
                'History retrieved successfully',
            historyList: updatedList,
            pagination: pagination,
          ),
        );
      } else {
        state = AsyncValue.data(
          state.value!.copyWith(
            success: false,
            errorMessage:
                apiResponse.data['message'] ?? 'Failed to retrieve history',
          ),
        );
      }
    } on DioException catch (e) {
      debugPrint('Get history error: $e');
      final errMessage =
          e.response?.data?['message'] ?? 'Failed to retrieve history';
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage: errMessage,
        ),
      );
    } on Exception catch (e) {
      debugPrint('Get history error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> deleteHistoryItem({
    required String id,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final apiResponse = await dio.delete(
        '${Config.baseUrl}${Config.aiMealSuggestionHistory}/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      debugPrint('Delete history item response: ${apiResponse.data}');

      if (apiResponse.statusCode == 200 &&
          apiResponse.data['success'] == true) {
        final updatedList =
            List<MealSuggestionHistoryModel>.from(state.value?.historyList ?? [])
              ..removeWhere((item) => item.id == id);

        state = AsyncValue.data(
          state.value!.copyWith(
            success: true,
            message: apiResponse.data['message'] ??
                'History item deleted successfully',
            historyList: updatedList,
          ),
        );
      } else {
        state = AsyncValue.data(
          state.value!.copyWith(
            success: false,
            errorMessage: apiResponse.data['message'] ??
                'Failed to delete history item',
          ),
        );
      }
    } on DioException catch (e) {
      debugPrint('Delete history item error: $e');
      final errMessage =
          e.response?.data?['message'] ?? 'Failed to delete history item';
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage: errMessage,
        ),
      );
    } on Exception catch (e) {
      debugPrint('Delete history item error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final apiResponse = await dio.delete(
        '${Config.baseUrl}${Config.aiMealSuggestionHistory}',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      debugPrint('Clear history response: ${apiResponse.data}');

      if (apiResponse.statusCode == 200 &&
          apiResponse.data['success'] == true) {
        state = AsyncValue.data(
          state.value!.copyWith(
            success: true,
            message:
                apiResponse.data['message'] ?? 'History cleared successfully',
            historyList: [],
            pagination: null,
          ),
        );
      } else {
        state = AsyncValue.data(
          state.value!.copyWith(
            success: false,
            errorMessage:
                apiResponse.data['message'] ?? 'Failed to clear history',
          ),
        );
      }
    } on DioException catch (e) {
      debugPrint('Clear history error: $e');
      final errMessage =
          e.response?.data?['message'] ?? 'Failed to clear history';
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage: errMessage,
        ),
      );
    } on Exception catch (e) {
      debugPrint('Clear history error: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          success: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
