import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/models/login_response_model.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ================= STATE MODEL =================
class ApiState {
  final String? token;
  final List<Nutrition>? nutritions;
  final TodoModel? todo;
  final String? message;
  final LoginResponseModel? register;

  ApiState(
      {this.token, this.nutritions, this.todo, this.message, this.register});

  ApiState copyWith(
      {String? token,
      List<Nutrition>? nutritions,
      TodoModel? todo,
      String? message,
      LoginResponseModel? register}) {
    return ApiState(
      token: token ?? this.token,
      nutritions: nutritions ?? this.nutritions,
      todo: todo ?? this.todo,
      message: message ?? this.message,
    );
  }
}

/// ================= PROVIDER =================
final apiServiceProvider =
    NotifierProvider<ApiService, ApiState>(() => ApiService());

class ApiService extends Notifier<ApiState> {
  static final client = _createHttpClient();

  static http.Client _createHttpClient() {
    final httpClient = HttpClient()
      ..badCertificateCallback = (_, __, ___) => true;
    return IOClient(httpClient);
  }

  @override
  ApiState build() => ApiState();

  Uri _url(String endpoint) => Uri.parse("${Config.baseUrl}$endpoint");

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
        state = state.copyWith(
            token: model.data.token, message: model.message, register: model);
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
        state = state.copyWith(
          token: model.data.token,
          message: model.message,
        );
        return true;
      }
    } catch (e) {
      debugPrint("Login error: $e");
    }

    return false;
  }

  /// ================= NUTRITIONS =================
  Future<List<Nutrition>> getNutritions() async {
    if (state.nutritions != null) return state.nutritions!;

    try {
      final res = await client.get(_url(Config.nutritionAPI));

      if (res.statusCode == 200) {
        final jsonBody = jsonDecode(res.body);
        final data = NutritionResponse.fromJson(jsonBody).data;
        state = state.copyWith(nutritions: data);
        return data;
      }
    } catch (e) {
      debugPrint("Nutrition error: $e");
    }

    return [];
  }

  /// ================= NUTRITION BY ID =================
  Future<Nutrition?> getNutritionById(String id) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString('token');

      final res = await client.get(
        _url("${Config.detailAPI}$id"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200) {
        final map = jsonDecode(res.body);
        return Nutrition.fromJson(map['data'] ?? map);
      }
    } catch (e) {
      debugPrint("Nutrition by id error: $e");
    }

    return null;
  }

  /// ================= TODO =================
  Future<TodoModel?> getTodo() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString('token');

      final res = await client.get(
        _url(Config.TodoAPI),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (res.statusCode == 200) {
        final jsonMap = jsonDecode(res.body);
        final model = TodoModel.fromJson(jsonMap['data']);
        state = state.copyWith(todo: model);
        return model;
      }

      if (res.statusCode == 401) {
        state = state.copyWith(token: null);
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
      state = state.copyWith(todo: null);
      return true;
    }

    if (res.statusCode == 401) {
      state = state.copyWith(token: null);
    }

    return false;
  }

  Future<bool?> deleteTodoItem(String mealId) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString('token');
      final res = await client.delete(
        _url(Config.TodoAPI),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({"mealId": mealId}),
      );

      if (res.statusCode == 200) return true;

      if (res.statusCode == 401) {
        state = state.copyWith(token: null);
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
      _url(Config.TodoAPI),
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
