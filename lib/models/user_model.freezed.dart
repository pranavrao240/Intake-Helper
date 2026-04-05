// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileData {
// ✅ FIXED id
  String? get id;
  String? get fullName;
  String? get email;
  int? get age; // ✅ FIXED double parsing
  double? get height;
  double? get weight;
  @JsonKey(name: "FCMToken")
  String? get fcmToken;
  String? get dateOfBirth;
  String? get profileImage;
  double? get bodyFat;
  String? get gender;
  DateTime? get createdAt;
  DateTime? get updatedAt; // ✅ OPTIONAL (recommended)
  bool? get emailVerified;
  String? get emailVerificationToken;
  DateTime? get emailVerificationExpires;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      _$ProfileDataCopyWithImpl<ProfileData>(this as ProfileData, _$identity);

  /// Serializes this ProfileData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.bodyFat, bodyFat) || other.bodyFat == bodyFat) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.emailVerificationToken, emailVerificationToken) ||
                other.emailVerificationToken == emailVerificationToken) &&
            (identical(
                    other.emailVerificationExpires, emailVerificationExpires) ||
                other.emailVerificationExpires == emailVerificationExpires));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      email,
      age,
      height,
      weight,
      fcmToken,
      dateOfBirth,
      profileImage,
      bodyFat,
      gender,
      createdAt,
      updatedAt,
      emailVerified,
      emailVerificationToken,
      emailVerificationExpires);

  @override
  String toString() {
    return 'ProfileData(id: $id, fullName: $fullName, email: $email, age: $age, height: $height, weight: $weight, fcmToken: $fcmToken, dateOfBirth: $dateOfBirth, profileImage: $profileImage, bodyFat: $bodyFat, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt, emailVerified: $emailVerified, emailVerificationToken: $emailVerificationToken, emailVerificationExpires: $emailVerificationExpires)';
  }
}

/// @nodoc
abstract mixin class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
          ProfileData value, $Res Function(ProfileData) _then) =
      _$ProfileDataCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? fullName,
      String? email,
      int? age,
      double? height,
      double? weight,
      @JsonKey(name: "FCMToken") String? fcmToken,
      String? dateOfBirth,
      String? profileImage,
      double? bodyFat,
      String? gender,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? emailVerified,
      String? emailVerificationToken,
      DateTime? emailVerificationExpires});
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res> implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._self, this._then);

  final ProfileData _self;
  final $Res Function(ProfileData) _then;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? fcmToken = freezed,
    Object? dateOfBirth = freezed,
    Object? profileImage = freezed,
    Object? bodyFat = freezed,
    Object? gender = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? emailVerified = freezed,
    Object? emailVerificationToken = freezed,
    Object? emailVerificationExpires = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      fcmToken: freezed == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyFat: freezed == bodyFat
          ? _self.bodyFat
          : bodyFat // ignore: cast_nullable_to_non_nullable
              as double?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emailVerified: freezed == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailVerificationToken: freezed == emailVerificationToken
          ? _self.emailVerificationToken
          : emailVerificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerificationExpires: freezed == emailVerificationExpires
          ? _self.emailVerificationExpires
          : emailVerificationExpires // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProfileData].
extension ProfileDataPatterns on ProfileData {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProfileData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileData() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProfileData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileData():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProfileData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileData() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? id,
            String? fullName,
            String? email,
            int? age,
            double? height,
            double? weight,
            @JsonKey(name: "FCMToken") String? fcmToken,
            String? dateOfBirth,
            String? profileImage,
            double? bodyFat,
            String? gender,
            DateTime? createdAt,
            DateTime? updatedAt,
            bool? emailVerified,
            String? emailVerificationToken,
            DateTime? emailVerificationExpires)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileData() when $default != null:
        return $default(
            _that.id,
            _that.fullName,
            _that.email,
            _that.age,
            _that.height,
            _that.weight,
            _that.fcmToken,
            _that.dateOfBirth,
            _that.profileImage,
            _that.bodyFat,
            _that.gender,
            _that.createdAt,
            _that.updatedAt,
            _that.emailVerified,
            _that.emailVerificationToken,
            _that.emailVerificationExpires);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? id,
            String? fullName,
            String? email,
            int? age,
            double? height,
            double? weight,
            @JsonKey(name: "FCMToken") String? fcmToken,
            String? dateOfBirth,
            String? profileImage,
            double? bodyFat,
            String? gender,
            DateTime? createdAt,
            DateTime? updatedAt,
            bool? emailVerified,
            String? emailVerificationToken,
            DateTime? emailVerificationExpires)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileData():
        return $default(
            _that.id,
            _that.fullName,
            _that.email,
            _that.age,
            _that.height,
            _that.weight,
            _that.fcmToken,
            _that.dateOfBirth,
            _that.profileImage,
            _that.bodyFat,
            _that.gender,
            _that.createdAt,
            _that.updatedAt,
            _that.emailVerified,
            _that.emailVerificationToken,
            _that.emailVerificationExpires);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? id,
            String? fullName,
            String? email,
            int? age,
            double? height,
            double? weight,
            @JsonKey(name: "FCMToken") String? fcmToken,
            String? dateOfBirth,
            String? profileImage,
            double? bodyFat,
            String? gender,
            DateTime? createdAt,
            DateTime? updatedAt,
            bool? emailVerified,
            String? emailVerificationToken,
            DateTime? emailVerificationExpires)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileData() when $default != null:
        return $default(
            _that.id,
            _that.fullName,
            _that.email,
            _that.age,
            _that.height,
            _that.weight,
            _that.fcmToken,
            _that.dateOfBirth,
            _that.profileImage,
            _that.bodyFat,
            _that.gender,
            _that.createdAt,
            _that.updatedAt,
            _that.emailVerified,
            _that.emailVerificationToken,
            _that.emailVerificationExpires);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileData implements ProfileData {
  const _ProfileData(
      {this.id,
      this.fullName,
      this.email,
      this.age,
      this.height,
      this.weight,
      @JsonKey(name: "FCMToken") this.fcmToken,
      this.dateOfBirth,
      this.profileImage,
      this.bodyFat,
      this.gender,
      this.createdAt,
      this.updatedAt,
      this.emailVerified,
      this.emailVerificationToken,
      this.emailVerificationExpires});
  factory _ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

// ✅ FIXED id
  @override
  final String? id;
  @override
  final String? fullName;
  @override
  final String? email;
  @override
  final int? age;
// ✅ FIXED double parsing
  @override
  final double? height;
  @override
  final double? weight;
  @override
  @JsonKey(name: "FCMToken")
  final String? fcmToken;
  @override
  final String? dateOfBirth;
  @override
  final String? profileImage;
  @override
  final double? bodyFat;
  @override
  final String? gender;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
// ✅ OPTIONAL (recommended)
  @override
  final bool? emailVerified;
  @override
  final String? emailVerificationToken;
  @override
  final DateTime? emailVerificationExpires;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileDataCopyWith<_ProfileData> get copyWith =>
      __$ProfileDataCopyWithImpl<_ProfileData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.bodyFat, bodyFat) || other.bodyFat == bodyFat) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.emailVerificationToken, emailVerificationToken) ||
                other.emailVerificationToken == emailVerificationToken) &&
            (identical(
                    other.emailVerificationExpires, emailVerificationExpires) ||
                other.emailVerificationExpires == emailVerificationExpires));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      email,
      age,
      height,
      weight,
      fcmToken,
      dateOfBirth,
      profileImage,
      bodyFat,
      gender,
      createdAt,
      updatedAt,
      emailVerified,
      emailVerificationToken,
      emailVerificationExpires);

  @override
  String toString() {
    return 'ProfileData(id: $id, fullName: $fullName, email: $email, age: $age, height: $height, weight: $weight, fcmToken: $fcmToken, dateOfBirth: $dateOfBirth, profileImage: $profileImage, bodyFat: $bodyFat, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt, emailVerified: $emailVerified, emailVerificationToken: $emailVerificationToken, emailVerificationExpires: $emailVerificationExpires)';
  }
}

/// @nodoc
abstract mixin class _$ProfileDataCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$ProfileDataCopyWith(
          _ProfileData value, $Res Function(_ProfileData) _then) =
      __$ProfileDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? fullName,
      String? email,
      int? age,
      double? height,
      double? weight,
      @JsonKey(name: "FCMToken") String? fcmToken,
      String? dateOfBirth,
      String? profileImage,
      double? bodyFat,
      String? gender,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? emailVerified,
      String? emailVerificationToken,
      DateTime? emailVerificationExpires});
}

/// @nodoc
class __$ProfileDataCopyWithImpl<$Res> implements _$ProfileDataCopyWith<$Res> {
  __$ProfileDataCopyWithImpl(this._self, this._then);

  final _ProfileData _self;
  final $Res Function(_ProfileData) _then;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? fcmToken = freezed,
    Object? dateOfBirth = freezed,
    Object? profileImage = freezed,
    Object? bodyFat = freezed,
    Object? gender = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? emailVerified = freezed,
    Object? emailVerificationToken = freezed,
    Object? emailVerificationExpires = freezed,
  }) {
    return _then(_ProfileData(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      fcmToken: freezed == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyFat: freezed == bodyFat
          ? _self.bodyFat
          : bodyFat // ignore: cast_nullable_to_non_nullable
              as double?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emailVerified: freezed == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailVerificationToken: freezed == emailVerificationToken
          ? _self.emailVerificationToken
          : emailVerificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerificationExpires: freezed == emailVerificationExpires
          ? _self.emailVerificationExpires
          : emailVerificationExpires // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
