import 'dart:convert';
import 'dart:developer';
import 'dart:io';
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

  ApiState(this.profileData,
      {this.token,
      this.nutritions,
      this.nutrition,
      this.todo,
      this.message,
      this.register});

  ApiState copyWith(
      {String? token,
      List<Nutrition>? nutritions,
      Nutrition? nutrition,
      TodoModel? todo,
      String? message,
      LoginResponseModel? register,
      ProfileData? profileData}) {
    return ApiState(
      profileData ?? this.profileData,
      token: token ?? this.token,
      nutritions: nutritions ?? this.nutritions,
      nutrition: nutrition ?? this.nutrition,
      todo: todo ?? this.todo,
      message: message ?? this.message,
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
  ApiState build() => ApiState(null);

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

      print('response from login --> ${res.body}');

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
    print('enters in getprofile');

    final response = await client.get(
      _url(Config.profileAPI),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('response from profile --> ${response.body}');
    try {
      if (response.statusCode == 200) {
        print('response from profile enters success');
        final jsonBody = jsonDecode(response.body);
        final data = ProfileResponse.fromJson(jsonBody).data;
        print('data from profile --> $data');

        state = AsyncValue.data(state.value!.copyWith(profileData: data));
      }
    } catch (e) {
      log('Profile error: $e');
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

          print('Successfully parsed ${data.length} nutrition items');
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
      print("token from getNutritionById --> $token");

      print("id from getNutritionById --> $id");

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
      print("response from nutrition by id --> ${res.body}");

      if (res.statusCode == 200) {
        final map = Nutrition.fromJson(json.decode(res.body));
        print("nutritionMap from getNutritionById --> ${map}");

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

      print('response from todo --> ${res.body}');

      if (res.statusCode == 200) {
        final jsonMap = jsonDecode(res.body);
        print("jsonMap from getTodo --> $jsonMap");
        final model = TodoResponse.fromJson(jsonMap);
        print("model from getTodo --> ${model.data}");
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
