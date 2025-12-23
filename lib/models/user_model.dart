import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    required bool success,
    required String message,
    required ProfileData data,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
abstract class ProfileData with _$ProfileData {
  const factory ProfileData({
    required String id,
    required String fullName,
    required String email,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int v,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}
