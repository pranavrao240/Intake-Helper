import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/main.dart';
import 'package:intake_helper/models/login_response_model.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/models/todo.dart';
import 'package:intake_helper/models/todo_model.dart';
import 'package:intake_helper/utils/shared_service.dart';

final apiservice = Provider((ref) => ApiService());

class ApiService {
  var data;
  static var client = http.Client();

  Future<List<Nutrition>?> getNutritions() async {
    final headers = {'Content-Type': 'application/json'};
    final url = Uri.http(Config.baseUrl, Config.nutritionAPI);

    try {
      final response = await client.get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonMap = jsonDecode(response.body);

        final nutritionResponse = NutritionResponse.fromJson(jsonMap);
        print(
            "Nutrition API Response from APIService: ${nutritionResponse.data}");

        return nutritionResponse.data;
      } else {
        print("Error (${response.statusCode}): ${response.body}");
        return null;
      }
    } catch (e, stack) {
      print("Exception in getNutritions: $e");
      print(stack);
      return null;
    }
  }

  // Register User
  static Future<bool> registerUser(
      String fullName, String email, String password) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.baseUrl, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "fullName": fullName,
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print("Registration failed: ${response.body}");
      return false;
    }
  }

  // Login User
  static Future<bool> loginUser(
      BuildContext context, String email, String password) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.baseUrl, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      var data = jsonDecode(response.body);

      String fullName = data["data"]["fullName"];
      String userEmail = data["data"]["email"];

      print("Logged in user: $fullName ($userEmail)");
      print("Token: ${data["data"]["token"]}");

      return true;
    } else {
      print("Login failed: ${response.body}");
      return false;
    }
  }

  Future<Nutrition?> getNutritionById(String id) async {
    Map<String, String> reqHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.baseUrl, "${Config.detailAPI}$id");

    try {
      print("Fetching Nutrition by ID from: $url");
      final response = await client.get(url, headers: reqHeaders);

      if (response.statusCode == 200) {
        print("Raw API body: ${response.body}");
        final jsonMap = jsonDecode(response.body);
        final rawData = jsonMap['data'] ?? jsonMap;

        if (rawData == null || rawData is! Map<String, dynamic>) {
          throw Exception('Invalid or missing nutrition data');
        }

        final nutrition = Nutrition.fromJson(rawData);
        print("Fetched Nutrition: ${nutrition.dishName}");
        return nutrition;
      } else {
        print(
            "Failed to fetch Nutrition by ID (${response.statusCode}): ${response.body}");
        return null;
      }
    } catch (e, stack) {
      print("Exception: $e");
      print(stack);
      return null;
    }
  }

  Future<TodoModel?> getTodo() async {
    final loginDetails = await SharedService.LoginDetails();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.data.token ?? ''}',
    };
    final url = Uri.http(Config.baseUrl, Config.TodoAPI);

    try {
      final response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print("Todo : ${json['data']}");
        return TodoModel.fromJson(json['data']);
      } else if (response.statusCode == 401) {
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil("/login", (route) => false);
      } else {
        print("Error ${response.statusCode}: ${response.body}");
      }
    } catch (e) {
      print("Exception in getTodo(): $e");
    }
    return null;
  }

  Future<void> resetTodo() async {
    var loginDetails = await SharedService.LoginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.data.token ?? ''}'
    };

    var url = Uri.http(Config.baseUrl, Config.resetTodoAPI);
    var response = await ApiService.client.get(
      url,
      headers: requestHeaders,
    );
    print("Response: ${response.body}");

    if (response.statusCode == 200) {
    } else if (response.statusCode == 401) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/login", (route) => false);
    } else {}
  }

  Future<bool?> deleteTodoItem(String mealId) async {
    var loginDetails = await SharedService.LoginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails?.data.token ?? ''}'
    };

    var url = Uri.http(Config.baseUrl, Config.TodoAPI);
    var response = await ApiService.client.delete(
      url,
      headers: requestHeaders,
      body: jsonEncode({"mealId": mealId}),
    );

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/login", (route) => false);
    } else {
      return null;
    }
    return null;
  }

  Future<bool?> addTodoItem(
    String nutritionId,
    String time,
    String day,
    String type,
  ) async {
    var loginDetails = await SharedService.LoginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails?.data.token ?? ''}',
    };

    var url = Uri.http(Config.baseUrl, Config.TodoAPI);

    final body = {
      "meals": [
        {
          "nutritionId": nutritionId,
          "time": time,
          "day": day,
          "type": type,
        }
      ]
    };

    print("📦 Request body: $body");

    try {
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("✅ Item added to TodoList successfully");
        return true;
      } else if (response.statusCode == 401) {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          "/login",
          (route) => false,
        );
      } else {
        print("❌ Failed to add Todo: ${response.body}");
      }
    } catch (e) {
      print("❌ Exception while adding Todo: $e");
    }

    return null;
  }
}
