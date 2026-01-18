import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/models/login_response_model.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:intake_helper/models/user_model.dart';
import 'package:intake_helper/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ================= STATE MODEL =================
class ApiState {
  final String? token;
  final List<Nutrition>? nutritions;
  final Nutrition? nutrition;
  final TodoModel? todo;
  final String? message;
  final LoginResponseModel? register;
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
      this.register,
      this.isLoading = false,
      this.redirect,
      this.addedId});

  ApiState copyWith(
      {String? token,
      List<Nutrition>? nutritions,
      Nutrition? nutrition,
      TodoModel? todo,
      String? message,
      LoginResponseModel? register,
      ProfileData? profileData,
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
      isLoading: isLoading ?? this.isLoading,
      redirect: redirect ?? this.redirect,
      addedId: addedId ?? this.addedId,
    );
  }
}

/// ================= PROVIDER =================
final apiServiceProvider =
    AsyncNotifierProvider<ApiService, ApiState>(() => ApiService());

class ApiService extends AsyncNotifier<ApiState> {
  static final client = _createHttpClient();

  static http.Client _createHttpClient() {
    final httpClient = HttpClient()
      ..badCertificateCallback = (_, __, ___) => true;
    return IOClient(httpClient);
  }

  @override
  ApiState build() => ApiState(null, isLoading: false);

  Uri _url(String endpoint) => Uri.parse("${Config.baseUrl}/$endpoint");

  /// ================= REGISTER =================
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

      if (res.statusCode == 200) {
        final model = loginResponseJson(res.body);
        final preferences = await SharedPreferences.getInstance();
        preferences.setString('token', model.data.token);
        state = AsyncValue.data(state.value!.copyWith(
            token: model.data.token,
            message: model.message,
            register: model.data as LoginResponseModel));
        return true;
      }
    } catch (e) {
      debugPrint("Register error: $e");
    }
    return false;
  }

  /// ================= LOGIN =================
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
        final model = loginResponseJson(res.body);
        final preferences = await SharedPreferences.getInstance();

        preferences.setString('token', model.data.token);
        // After successful login
        await saveAuthData(model.data.token);
        state = AsyncValue.data(state.value!.copyWith(
          token: model.data.token,
          message: model.message,
        ));
        return true;
      }
    } catch (e) {
      debugPrint("Login error: $e");
    }

    return false;
  }

  Future<void> getProfile(String token) async {
    final response = await client.get(
      _url(Config.profileAPI),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    try {
      if (response.statusCode == 200) {
        // final jsonBody = jsonDecode(response.body);
        final data = ProfileResponse.fromJson(jsonDecode(response.body));

        state = AsyncValue.data(state.value!.copyWith(profileData: data.data));
      }
    } catch (e) {
      log('Profile error: $e');
    }
  }

  Future<void> updateProfile({
    int? age,
    double? height,
    double? weight,
    String? dateOfBirth,
  }) async {
    final Map<String, dynamic> payload = {};
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final dio = Dio();

    if (age != null) payload['age'] = age;
    if (height != null) payload['height'] = height;
    if (weight != null) payload['weight'] = weight;
    if (dateOfBirth != null) payload['dateOfBirth'] = dateOfBirth;

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
        final profileModel =
            ProfileResponse.fromJson(jsonDecode(response.data));
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
        state.value!.copyWith(message: "Failed to update profile"),
      );
    }
  }

  /// ================= NUTRITIONS =================
  Future<List<Nutrition>> getNutritions() async {
    if (state.value?.nutritions != null) {
      return state.value!.nutritions!;
    }

    try {
      final res = await client.get(_url(Config.nutritionAPI));

      if (res.statusCode == 200) {
        final responseData = NutritionResponse.fromJson(json.decode(res.body));
        print('response from nutrition --> ${responseData.data}');

        // Check if the response has the expected structure
        if (responseData.data != null) {
          final data = responseData.data!;

          state = AsyncValue.data(state.value!.copyWith(
            nutritions: data,
          ));

          return data;
        } else {
          // Handle unexpected response format
          debugPrint("Unexpected API response format: ${res.body}");
          return [];
        }
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

  /// ================= NUTRITION BY ID =================
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
    double? protein,
    double? carbs,
    double? calories,
  }) async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final dio = Dio();

    try {
      final response =
          await dio.post('${Config.baseUrl}/${Config.nutritionDetailAPI}',
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization': 'Bearer $token',
                },
              ),
              data: jsonEncode({
                "DishName": name,
                "Protein": protein,
                "Carbohydrates": carbs,
                "Calories": calories,
              }));

      await preferences.setString('addedId', response.data['data']['_id']);

      state = AsyncValue.data(state.value!.copyWith(
        message: "Nutrition added successfully",
        isLoading: false,
        redirect: RouteConstants.mealDetails.path,
        addedId: response.data['data']['_id'],
      ));
    } catch (e) {
      debugPrint("Nutrition added failed $e");
    }
  }

  /// ================= TODO =================
  Future<TodoResponse?> getTodo() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString('token');

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

      if (res.statusCode == 200) return true;

      if (res.statusCode == 401) {
        state = AsyncValue.data(state.value!.copyWith(
          token: null,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }

  Future<bool> addTodoItem(
      String nutritionId, String time, String day, String type) async {
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
      return true;
    }

    return false;
  }
}
