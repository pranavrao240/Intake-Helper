import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/models/login_response_model.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/models/saved_nutrition_model.dart';
import 'package:intake_helper/models/streak_model.dart';
import 'package:intake_helper/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:intake_helper/models/user_model.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/utility/logger.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiState {
  final String? token;
  final List<Nutrition>? nutritions;
  final Nutrition? nutrition;
  final List<SavedNutritionModel>? savedNutrition;
  final TodoModel? todo;
  final String? message;
  final String? errorMessage;
  final Exception? error;

  final LoginResponseModel? register;
  final StreakModel? streak;
  final ProfileData? profileData;
  final bool isLoading;
  final String? redirect;
  final String? addedId;

  ApiState(this.profileData,
      {this.token,
      this.nutritions,
      this.nutrition,
      this.todo,
      this.message,
      this.errorMessage,
      this.error,
      this.register,
      this.savedNutrition,
      this.streak,
      this.isLoading = false,
      this.redirect,
      this.addedId});

  ApiState copyWith(
      {String? token,
      List<Nutrition>? nutritions,
      Nutrition? nutrition,
      List<SavedNutritionModel>? savedNutrition,
      TodoModel? todo,
      String? message,
      String? errorMessage,
      Exception? error,
      LoginResponseModel? register,
      ProfileData? profileData,
      StreakModel? streak,
      bool? isLoading,
      String? redirect,
      String? addedId}) {
    return ApiState(
      profileData ?? this.profileData,
      token: token ?? this.token,
      nutritions: nutritions ?? this.nutritions,
      nutrition: nutrition ?? this.nutrition,
      todo: todo ?? this.todo,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      redirect: redirect ?? this.redirect,
      addedId: addedId ?? this.addedId,
      savedNutrition: savedNutrition ?? this.savedNutrition,
      streak: streak ?? this.streak,
    );
  }
}

final apiServiceProvider =
    AsyncNotifierProvider<ApiService, ApiState>(() => ApiService());

class ApiService extends AsyncNotifier<ApiState> {
  final Logger log = CustomLogger.getLogger('ApiService');
  static final client = _createHttpClient();

  static http.Client _createHttpClient() {
    final httpClient = HttpClient()
      ..badCertificateCallback = (_, __, ___) => true;
    return IOClient(httpClient);
  }

  @override
  ApiState build() => ApiState(null, isLoading: false);

  Uri _url(String endpoint) => Uri.parse("${Config.baseUrl}/$endpoint");
  final dio = Dio();
  final preferences = SharedPreferences.getInstance();

  void resetMessages() {
    final current = state.value;
    if (current == null) return;

    state = AsyncValue.data(
      current.copyWith(
        message: null,
        errorMessage: null,
        error: null,
        redirect: null,
      ),
    );
  }

  Future<bool> registerUser(
      String fullName, String email, String password) async {
    try {
      final res = await client.post(
        _url(Config.registerAPI),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "fullName": fullName,
          "email": email,
          "password": password,
        }),
      );

      print('res.statusCode: ${res.statusCode}');
      print('res.body: ${res.body}');

      if (res.statusCode == 200 || res.statusCode == 201) {
        final model = LoginResponseModel.fromJson(jsonDecode(res.body));

        debugPrint('model: $model');

        state = AsyncValue.data(state.value!.copyWith(
            token: model.data.token,
            message: 'Email Sent for verification',
            register: model,
            redirect: RouteConstants.emailVerification.name));
        debugPrint("Registration successful");
        return true;
      } else {
        debugPrint("Registration failed");
        state = AsyncValue.data(state.value!.copyWith(
          errorMessage: 'Registration failed. Please try again.',
        ));
      }
    } catch (e) {
      print('Registration error: $e');
      state = AsyncValue.data(state.value!.copyWith(
        errorMessage: e.toString(),
      ));
    }
    return false;
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      final res = await client.post(
        _url(Config.loginAPI),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (res.statusCode == 200) {
        final model = LoginResponseModel.fromJson(jsonDecode(res.body));

        final preferences = await SharedPreferences.getInstance();

        preferences.setString('token', model.data.token!);
        preferences.setString('userId', model.data.id ?? '');
        final currentState = state.value ?? ApiState(null);

        state = AsyncValue.data(
          currentState.copyWith(
            token: model.data.token,
            message: model.message,
            redirect: RouteConstants.home.name,
          ),
        );

        return true;
      } else {
        state = AsyncValue.data(state.value!.copyWith(
          errorMessage: 'Invalid email or password.',
        ));
      }
    } catch (e) {
      state = AsyncValue.data(state.value!.copyWith(
        errorMessage: 'Login failed. Please try again.',
      ));
    }

    return false;
  }

  Future<void> sendForgotPasswordEmail(String email) async {
    try {
      final res = await client.post(
        _url(Config.forgotPasswordAPI),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
        }),
      );

      final prefs = await SharedPreferences.getInstance();
      final body = jsonDecode(res.body);

      await prefs.setString(
        'emailVerificationToken',
        body['data']['emailVerificationToken'] as String,
      );

      if (res.statusCode == 200) {
        state = AsyncValue.data(
          state.value!.copyWith(
            message: 'Password reset email sent successfully',
          ),
        );
      } else {
        state = AsyncValue.data(
          state.value!.copyWith(
            errorMessage: 'Failed to send forgot password email',
          ),
        );
      }
    } catch (e) {
      log.i('Error sending forgot password email: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          errorMessage: 'Failed to send forgot password email',
        ),
      );
    }
  }

  Future<void> resetPassword(String token, String newPassword) async {
    try {
      final res = await client.post(
        _url(Config.resetPasswordAPI),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "token": token,
          "newPassword": newPassword,
        }),
      );

      if (res.statusCode == 200) {
        state = AsyncValue.data(
          state.value!.copyWith(
            message: 'Password reset successfully',
            redirect: RouteConstants.resetPassword.name,
          ),
        );
      } else {
        state = AsyncValue.data(
          state.value!.copyWith(
            errorMessage: 'Failed to reset password',
          ),
        );
      }
    } catch (e) {
      log.i('Error resetting password: $e');
      state = AsyncValue.data(
        state.value!.copyWith(
          errorMessage: 'Failed to reset password',
        ),
      );
    }
  }

  Future<void> getProfile(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await client.get(
      _url(Config.profileAPI),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    try {
      if (response.statusCode == 200) {
        final data = ProfileResponse.fromJson(jsonDecode(response.body));

        state = AsyncValue.data(state.value!.copyWith(profileData: data.data));
        prefs.setString('userId', data.data?.id ?? '');
      }
    } catch (e) {
      debugPrint('Profile error: $e');
    }
  }

  Future<void> updateProfile({
    int? age,
    double? height,
    double? weight,
    String? dateOfBirth,
    String? gender,
    double? bodyFat,
    String? fcmToken,
  }) async {
    final Map<String, dynamic> payload = {};
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    if (age != null) payload['age'] = age;
    if (height != null) payload['height'] = height;
    if (weight != null) payload['weight'] = weight;
    if (dateOfBirth != null) payload['dateOfBirth'] = dateOfBirth;
    if (gender != null) payload['gender'] = gender;
    if (bodyFat != null) payload['bodyFat'] = bodyFat;
    if (fcmToken != null) payload['FCMToken'] = fcmToken;

    if (payload.isEmpty) {
      debugPrint('No profile fields to update');
      return;
    }

    try {
      final response = await dio.put(
        '${Config.baseUrl}/${Config.profileAPI}',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: payload,
      );

      if (response.statusCode == 200) {
        final profileModel = ProfileResponse.fromJson(response.data);
        state = AsyncValue.data(
          state.value!.copyWith(
              profileData: profileModel.data, message: profileModel.message),
        );
      } else {}
    } catch (e) {
      state = AsyncValue.data(
        state.value!.copyWith(message: "Failed to update profile"),
      );
    }
  }

  Future<void> updateProfileImage({
    String? profileImage,
  }) async {
    final Map<String, dynamic> payload = {};
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    if (profileImage != null) payload['profileImage'] = profileImage;

    if (payload.isEmpty) {
      debugPrint('No profile fields to update');
      return;
    }

    try {
      final response = await dio.put(
        '${Config.baseUrl}/${Config.profileAPI}',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'profileImage': profileImage,
        },
      );

      if (response.statusCode == 200) {
        final profileModel = ProfileResponse.fromJson(response.data);
        state = AsyncValue.data(
          state.value!.copyWith(
              profileData: profileModel.data, message: profileModel.message),
        );
      } else {
        state = AsyncValue.data(
          state.value!.copyWith(message: "Failed to update profile"),
        );
      }
    } catch (e) {
      debugPrint("Update profile error: $e");
      state = AsyncValue.data(
        state.value!.copyWith(
            message: "Failed to update profile",
            redirect: RouteConstants.todo.name),
      );
    }
  }

  Future<void> updateMealStatus(String mealId, String status) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.put(
      _url('${Config.changeStatusAPI}/$status/$mealId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    try {
      if (response.statusCode == 200) {
        final jsonMap = jsonDecode(response.body);

        state = AsyncValue.data(
          state.value!.copyWith(message: jsonMap['message']),
        );

        await getTodo();
      } else {
        print('Failed to update status');
        state = AsyncValue.data(
          state.value!.copyWith(message: "Failed to update status"),
        );
      }
    } on DioException catch (e) {
      state = AsyncValue.data(
        state.value!.copyWith(message: "Failed to update status"),
      );
    } catch (e) {
      state = AsyncValue.data(
        state.value!.copyWith(message: "Failed to update status"),
      );
    }
  }

  Future<void> getSavedNutritions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final res = await client.get(_url(Config.getSavedNutritionAPI), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print('res: ${res.body}');

      final decoded = json.decode(res.body) as Map<String, dynamic>;
      final list = decoded['data'] as List;
      final nutritionModels = list
          .map((e) => SavedNutritionModel.fromJson(e as Map<String, dynamic>))
          .toList();

      state = AsyncValue.data(
        state.value!.copyWith(savedNutrition: nutritionModels),
      );
    } catch (e) {
      state = AsyncValue.data(
        state.value!.copyWith(message: "Failed to get saved nutritions"),
      );
    }
  }

  Future<void> updateSavedNutritions(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final res =
          await client.put(_url('${Config.changeSavedStateAPI}/$id'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (res.statusCode == 200) {
        state = AsyncValue.data(
            state.value!.copyWith(message: "Meal Saved successfully!"));
      }
    } catch (e) {
      state = AsyncValue.data(
          state.value!.copyWith(message: "Failed to save meal"));
    }
  }

  Future<List<Nutrition>> getNutritions() async {
    if (state.value?.nutritions != null) {
      return state.value!.nutritions!;
    }

    try {
      final res = await client.get(_url(Config.nutritionAPI));

      if (res.statusCode == 200) {
        final responseData = NutritionResponse.fromJson(json.decode(res.body));

        final data = responseData.data;

        state = AsyncValue.data(state.value!.copyWith(
          nutritions: data,
        ));

        return data;
      } else {
        debugPrint("API request failed with status: ${res.statusCode}");
        return [];
      }
    } catch (e, stackTrace) {
      debugPrint("Nutrition error: $e");
      debugPrint("Stack trace: $stackTrace");
      return [];
    }
  }

  Future<Nutrition?> getNutritionById(String id) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString('token');

      if (token == null || token.isEmpty) {
        debugPrint("No token found");
      }

      final res = await client.get(
        _url(Config.detailAPI + id),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200) {
        final map = Nutrition.fromJson(json.decode(res.body));

        final nutritionMap = map;

        state = AsyncValue.data(state.value!.copyWith(
          nutrition: nutritionMap,
        ));

        return nutritionMap;
      } else {
        debugPrint("Failed to fetch nutrition: ${res.statusCode}");
      }
    } catch (e) {
      debugPrint("Nutrition by id error: $e");
    }

    return null;
  }

  Future<void> addNutrition({
    required String name,
    required String mealImage,
    double? protein,
    double? carbs,
    double? calories,
    String? quantity,
  }) async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    print("Meal image: $mealImage");

    try {
      final response =
          await dio.post('${Config.baseUrl}/${Config.nutritionDetailAPI}',
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization': 'Bearer $token',
                },
              ),
              data: {
            "DishName": name,
            "DishImage": mealImage,
            "Protein": protein,
            "Carbohydrates": carbs,
            "Calories": calories,
            "QuantityRequired": quantity,
          });

      await preferences.setString('addedId', response.data['data']['_id']);

      final nutrition = Nutrition.fromJson(response.data['data']);

      state = AsyncValue.data(state.value!.copyWith(
        message: "Nutrition added successfully",
        isLoading: false,
        nutrition: nutrition,
        redirect: RouteConstants.mealDetails.path,
        addedId: response.data['data']['_id'],
      ));
    } catch (e) {
      debugPrint("Nutrition added failed $e");
    }
  }

  Future<TodoResponse?> getTodo() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString('token');
      state = AsyncValue.loading();

      final res = await client.get(
        _url(Config.todoAPI),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (res.statusCode == 200) {
        final jsonMap = jsonDecode(res.body);
        final model = TodoResponse.fromJson(jsonMap);
        state = AsyncValue.data(state.value!.copyWith(
          todo: model.data,
        ));

        if (model.data != null && model.data!.meals.isNotEmpty) {
          final today = DateTime.now();
          final hasCompletedToday = model.data!.meals.any((meal) {
            return meal.status == 'completed' &&
                _isMealForToday(meal.nutrition, today);
          });

          if (!hasCompletedToday) {
            await resetStreak();
          }
        }

        return model;
      }

      if (res.statusCode == 401) {
        state = AsyncValue.data(state.value!.copyWith(
          token: null,
        ));
      }
    } catch (e) {
      debugPrint('error in todo ${e.toString()}');
    }

    return null;
  }

  bool _isMealForToday(Nutrition nutrition, DateTime today) {
    final todayName = _getDayName(today);
    return nutrition.day?.contains(todayName) ?? false;
  }

  String _getDayName(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  Future<bool> resetTodo() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final res = await client.get(
      _url(Config.resetTodoAPI),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (res.statusCode == 200) {
      state = AsyncValue.data(state.value!.copyWith(
        todo: null,
      ));
      return true;
    }

    if (res.statusCode == 401) {
      state = AsyncValue.data(state.value!.copyWith(
        token: null,
      ));
    }

    return false;
  }

  Future<bool?> deleteTodoItem(String mealId) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString('token');
      final res = await client.delete(
        _url(Config.todoAPI),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({"mealId": mealId}),
      );

      debugPrint('delete todo item response: ${res.body}');

      if (res.statusCode == 200) return true;

      if (res.statusCode == 401) {
        state = AsyncValue.data(state.value!.copyWith(
          token: null,
        ));
      }
    } catch (e) {
      debugPrint('error in delete todo item ${e.toString()}');
    }

    return null;
  }

  Future<bool> addTodoItem(
    String nutritionId,
    List<String> time,
    List<String> day,
    List<String> type,
  ) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString('token');

      final res = await client.post(
        _url(Config.todoAPI),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "meals": [
            {
              "nutritionId": nutritionId,
              "time": time,
              "day": day,
              "type": type,
            }
          ]
        }),
      );

      if (res.statusCode == 200) {
        /// handle streak safely
        try {
          await updateStreak(todosAdded: 1);
        } catch (e) {
          print("Streak error: $e");
        }

        return true;
      } else {
        print("API error: ${res.body}");
      }
    } catch (e) {
      print('error in add todo item: $e');
    }

    return false;
  }

  Future<void> getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await client.get(
      _url(Config.streakAPI),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    try {
      if (response.statusCode == 200) {
        final data = StreakModel.fromJson(jsonDecode(response.body));

        state = AsyncValue.data(state.value!
            .copyWith(streak: data, message: 'Streak loaded successfully'));
      } else {}
    } catch (e) {
      debugPrint('Streak error: $e');
      state = AsyncValue.data(state.value!
          .copyWith(streak: null, message: 'Failed to load streak'));
    }
  }

  Future<void> updateStreak({int? todosAdded, int? todosCompleted}) async {
    final streakPayload = {};

    if (todosAdded != null) {
      streakPayload.addAll({"todosAdded": todosAdded});
    }
    if (todosCompleted != null) {
      streakPayload.addAll({"todosCompleted": todosCompleted});
    }

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await client.post(
      _url(Config.updateStreakAPI),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(streakPayload),
    );

    debugPrint('Streak update response: ${response.statusCode}');

    try {
      if (response.statusCode == 200) {
        final data = StreakModel.fromJson(jsonDecode(response.body));

        final currentState = state.value;

        if (currentState != null) {
          state = AsyncValue.data(
            currentState.copyWith(
              streak: data,
              message: 'Streak updated successfully',
            ),
          );
        }
      } else {}
    } catch (e) {
      final currentState = state.value;

      if (currentState != null) {
        state = AsyncValue.data(
          currentState.copyWith(
            streak: null,
            message: 'Failed to update streak',
          ),
        );
      }
    }
  }

  Future<void> resetStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final res = await client.delete(_url(Config.resetStreakAPI), headers: {
      'Authorization': 'Bearer $token',
    });

    try {
      if (res.statusCode == 200) {
        final data = StreakModel.fromJson(jsonDecode(res.body));
        state = AsyncValue.data(state.value!
            .copyWith(streak: data, message: 'Streak reset successfully'));
      } else {
        state = AsyncValue.data(state.value!
            .copyWith(streak: null, message: 'Failed to reset streak'));
      }
    } catch (e) {
      debugPrint('Streak reset error: $e');
      state = AsyncValue.data(state.value!
          .copyWith(streak: null, message: 'Failed to reset streak'));
    }
  }
}
