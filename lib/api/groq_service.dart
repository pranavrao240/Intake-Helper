import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/models/groq/api_model.dart';

part 'groq_service.freezed.dart';
part 'groq_service.g.dart';

@freezed
abstract class GroqState with _$GroqState {
  const factory GroqState({
    GroqModel? groqModel,
    @Default(false) bool isLoading,
    String? errorMessage,
    String? message,
  }) = _GroqState;

  factory GroqState.fromJson(Map<String, dynamic> json) =>
      _$GroqStateFromJson(json);
}

class GroqService extends AsyncNotifier<GroqState> {
  final dio = Dio();
  final token = dotenv.get('GROQ_API_KEY').trim();

  Options get _options => Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

  @override
  GroqState build() {
    return const GroqState(isLoading: false, groqModel: null);
  }

  Future<void> postGroqResponse({
    required String prompt,
  }) async {
    try {
      state = const AsyncValue.loading();
      final response = await dio.post(
        Config.getGroqResponse,
        options: _options,
        data: {
          "model": "openai/gpt-oss-20b",
          "input": [
            {
              "role": "system",
              "content":
                  "You are a professional diet and meal planner. Suggest meal plans strictly according to the user's available ingredients and dietary goals.\n\nRules:\n\nAlways provide a clear Meal Name.\n\nAlways provide a separate Quantity line listing required ingredients and amounts.\n\nAlways specify the Meal Type.\n\nMeal Type must be exactly one of: Breakfast, Lunch, Dinner.\n\nAlways include simple step-by-step cooking instructions.\n\nAlways calculate and display the total Protein, total Calories, and total Carbohydrates.\n\nNutritional values must be realistic and consistent.\n\nUse only the ingredients provided by the user. Do not add extra ingredients except basic seasonings such as salt, pepper, or water if absolutely necessary.\n\nProvide exactly one meal suggestion.\n\nDo not add unnecessary explanations, notes, tips, or commentary.\n\nDo NOT use curly braces {}, square brackets [], quotation marks, Markdown, or JSON-style formatting in the response.\n\nIf you need additional information from the user or the user asks a general question instead of requesting a meal plan, respond in plain text only.\n\nOutput format mandatory, follow exactly:\n\nMeal Name:\n\nMeal Type:\n\nQuantity:\n\nSteps:\n1.\n2.\n3.\n\nNutrition:\nProtein: 00.00 g\nCalories: 000 kcal\nCarbs: 00.00 g"
            },
            {
              "role": "user",
              "content": prompt,
            }
          ]
        },
      );

      if (response.statusCode == 200) {
        final groqModel = GroqModel.fromJson(response.data);

        state = AsyncValue.data(
          (state.value ?? const GroqState()).copyWith(
            isLoading: false,
            groqModel: groqModel,
            message: groqModel.assistantMessage,
          ),
        );
      } else {
        state = AsyncValue.data(
          (state.value ?? const GroqState()).copyWith(
            isLoading: false,
            message: "fetch failed",
          ),
        );
      }
    } on DioException catch (e) {
      state = AsyncValue.data(
        (state.value ?? const GroqState()).copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    } on Exception catch (e) {
      state = AsyncValue.data(
        (state.value ?? const GroqState()).copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
