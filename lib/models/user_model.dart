import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    required bool success,
    ProfileData? data, // made nullable because JSON might not include it
    String? message, // optional, because response might not have it
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
    double? height, // corrected type
    double? weight, // corrected type
    @JsonKey(name: "dateOfBirth") String? dateOfBirth,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}
