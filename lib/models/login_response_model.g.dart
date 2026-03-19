// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    _LoginResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(_LoginResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
      id: json['_id'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'emailVerified': instance.emailVerified,
      'token': instance.token,
    };
