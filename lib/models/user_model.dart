import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class ProfileData with _$ProfileData {
  const factory ProfileData({
    // ✅ FIXED id
    String? id,
    String? fullName,
    String? email,
    int? age,

    // ✅ FIXED double parsing
    double? height,
    double? weight,
    @JsonKey(name: "FCMToken") String? fcmToken,
    String? dateOfBirth,
    String? profileImage,
    double? bodyFat,
    String? gender,
    DateTime? createdAt,
    DateTime? updatedAt,

    // ✅ OPTIONAL (recommended)
    bool? emailVerified,
    String? emailVerificationToken,
    DateTime? emailVerificationExpires,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}
