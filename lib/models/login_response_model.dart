import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJSON(json.decode(str));

class LoginResponseModel {
  late final String message;
  late final Data data;

  LoginResponseModel.fromJSON(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.toJson(), // ✅ Correct reference to `data`
    };
  }
}

class Data {
  late final String fullname;
  late final String email;
  late final String userId;
  late final String token;

  Data({
    required this.fullname,
    required this.email,
    required this.userId,
    required this.token,
  });

  Data.fromJson(Map<String, dynamic> json) {
    fullname = json['fullName'];
    email = json['email'];
    userId = json['_id']; // ✅ Ensure consistency in field names
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullname,
      'email': email,
      '_id': userId, // ✅ Use '_id' instead of '_Id'
      'token': token,
    };
  }
}
