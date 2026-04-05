// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => _ProfileData(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      age: (json['age'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      fcmToken: json['FCMToken'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      profileImage: json['profileImage'] as String?,
      bodyFat: (json['bodyFat'] as num?)?.toDouble(),
      gender: json['gender'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      emailVerified: json['emailVerified'] as bool?,
      emailVerificationToken: json['emailVerificationToken'] as String?,
      emailVerificationExpires: json['emailVerificationExpires'] == null
          ? null
          : DateTime.parse(json['emailVerificationExpires'] as String),
    );

Map<String, dynamic> _$ProfileDataToJson(_ProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'FCMToken': instance.fcmToken,
      'dateOfBirth': instance.dateOfBirth,
      'profileImage': instance.profileImage,
      'bodyFat': instance.bodyFat,
      'gender': instance.gender,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'emailVerified': instance.emailVerified,
      'emailVerificationToken': instance.emailVerificationToken,
      'emailVerificationExpires':
          instance.emailVerificationExpires?.toIso8601String(),
    };
