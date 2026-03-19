import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    required bool success,
    ProfileData? data,
    String? message,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
abstract class ProfileData with _$ProfileData {
  const factory ProfileData({
    @JsonKey(name: "_id") required String id,
    String? fullName,
    String? email,
    int? age,
    double? height,
    double? weight,
    @JsonKey(name: "FCMToken") String? fcmToken,
    @JsonKey(name: "dateOfBirth") String? dateOfBirth,
    String? profileImage,
    double? bodyFat,
    String? gender,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}
