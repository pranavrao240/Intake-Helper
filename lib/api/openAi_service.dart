import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/models/openAi/api_model.dart';
part 'openAi_service.freezed.dart';
part 'openAi_service.g.dart';

@freezed
abstract class OpenAiState with _$OpenAiState {
  const factory OpenAiState({
    ApiModel? openAiModel,
    @Default(false) bool isLoading,
    String? errorMessage,
    String? message,
  }) = _OpenAiState;

  factory OpenAiState.fromJson(Map<String, dynamic> json) =>
      _$OpenAiStateFromJson(json);
}

class OpenAiService extends AsyncNotifier<OpenAiState> {
  final dio = Dio();
  // final token = const String.fromEnvironment('OPENAI_API_KEY');
  final token = dotenv.get('OPENAI_API_KEY');

  Options get _options => Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
  @override
  OpenAiState build() {
    return OpenAiState(isLoading: false, openAiModel: null);
  }

  Future<void> postOpenAiResponse({
    required String prompt,
  }) async {
    try {
      state = AsyncValue.loading();
      final response = await dio.post(
        Config.getOpenAiResponse,
        options: _options,
        data: jsonEncode({
          "model": "gpt-5.2",
          "input": [
            {
              "role": "system",
              "content":
                  // "You are a professional diet and meal planner. Suggest meal plans strictly according to the user’s available ingredients and dietary goals.\n\nRules:\n- Always provide a clear meal name.\n- Always specify the meal type.\n- Meal type must be exactly one of: Breakfast, Lunch, Dinner.\n- Always include simple step-by-step cooking instructions.\n- Always calculate and display the total Protein, total Calories, and total Carbohydrates.\n- Nutritional values must be realistic and consistent.\n- Do not add unnecessary explanations or commentary.\n- Do NOT use curly braces {}, square brackets [], quotation marks \"\", or JSON-style formatting.\n\nOutput format (mandatory, follow exactly):\n\nMeal Name:\nMeal Type:\nSteps:\n1.\n2.\n3.\nNutrition:\nProtein: 00.00\nCalories: 00.00\nCarbs: 00.00"
                  '''
You are a professional diet and meal planner. Suggest meal plans strictly according to the user’s available ingredients and dietary goals.

Rules:

Always provide a clear Meal Name.

Always provide exactly one Meal Image. Only one single image must be given. Do not provide multiple images under any condition.

Always provide a separate Quantity line listing required ingredients and amounts.

Always specify the Meal Type.

Meal Type must be exactly one of: Breakfast, Lunch, Dinner.

Always include simple step-by-step cooking instructions.

Always calculate and display the total Protein, total Calories, and total Carbohydrates.

Nutritional values must be realistic and consistent.

Do not add unnecessary explanations or commentary.

Do NOT use curly braces, square brackets, quotation marks, or JSON-style formatting in the response.

Follow the output format exactly.

If you need additional information from the user or the user asks a question, respond in plain text only.

Output format mandatory, follow exactly:

Meal Name:
Meal Image only one image should be given:
Meal Type:
Quantity:
Steps:
1.
2.
3.
Nutrition:
Protein: 00.00
Calories: 00.00
Carbs: 00.00
                  '''
            },
            {
              "role": "user",
              "content": prompt,
            }
          ],
        }),
      );

      if (response.statusCode == 200) {
        final openAiModel = ApiModel.fromJson(response.data);
        state = AsyncValue.data(
          state.value!.copyWith(
            isLoading: false,
            openAiModel: openAiModel,
            message: "fetch success",
          ),
        );
      } else {
        state = AsyncValue.data(
          state.value!.copyWith(
            isLoading: false,
            message: "fetch failed",
          ),
        );
      }
    } on DioException catch (e) {
      state = AsyncValue.data(
        state.value!.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    } on Exception catch (e) {
      state = AsyncValue.data(
        state.value!.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
