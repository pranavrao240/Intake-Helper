// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_suggestion_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealSuggestionHistoryModel {
  String get id;
  String get userId;
  String get prompt;
  dynamic get response;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of MealSuggestionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MealSuggestionHistoryModelCopyWith<MealSuggestionHistoryModel>
      get copyWith =>
          _$MealSuggestionHistoryModelCopyWithImpl<MealSuggestionHistoryModel>(
              this as MealSuggestionHistoryModel, _$identity);

  /// Serializes this MealSuggestionHistoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MealSuggestionHistoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            const DeepCollectionEquality().equals(other.response, response) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, prompt,
      const DeepCollectionEquality().hash(response), createdAt);

  @override
  String toString() {
    return 'MealSuggestionHistoryModel(id: $id, userId: $userId, prompt: $prompt, response: $response, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $MealSuggestionHistoryModelCopyWith<$Res> {
  factory $MealSuggestionHistoryModelCopyWith(MealSuggestionHistoryModel value,
          $Res Function(MealSuggestionHistoryModel) _then) =
      _$MealSuggestionHistoryModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String prompt,
      dynamic response,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$MealSuggestionHistoryModelCopyWithImpl<$Res>
    implements $MealSuggestionHistoryModelCopyWith<$Res> {
  _$MealSuggestionHistoryModelCopyWithImpl(this._self, this._then);

  final MealSuggestionHistoryModel _self;
  final $Res Function(MealSuggestionHistoryModel) _then;

  /// Create a copy of MealSuggestionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? prompt = null,
    Object? response = freezed,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _self.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      response: freezed == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [MealSuggestionHistoryModel].
extension MealSuggestionHistoryModelPatterns on MealSuggestionHistoryModel {
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
    TResult Function(_MealSuggestionHistoryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MealSuggestionHistoryModel() when $default != null:
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
    TResult Function(_MealSuggestionHistoryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MealSuggestionHistoryModel():
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
    TResult? Function(_MealSuggestionHistoryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MealSuggestionHistoryModel() when $default != null:
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
    TResult Function(String id, String userId, String prompt, dynamic response,
            @JsonKey(name: 'created_at') DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MealSuggestionHistoryModel() when $default != null:
        return $default(_that.id, _that.userId, _that.prompt, _that.response,
            _that.createdAt);
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
    TResult Function(String id, String userId, String prompt, dynamic response,
            @JsonKey(name: 'created_at') DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MealSuggestionHistoryModel():
        return $default(_that.id, _that.userId, _that.prompt, _that.response,
            _that.createdAt);
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
    TResult? Function(String id, String userId, String prompt, dynamic response,
            @JsonKey(name: 'created_at') DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MealSuggestionHistoryModel() when $default != null:
        return $default(_that.id, _that.userId, _that.prompt, _that.response,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MealSuggestionHistoryModel implements MealSuggestionHistoryModel {
  const _MealSuggestionHistoryModel(
      {required this.id,
      required this.userId,
      required this.prompt,
      required this.response,
      @JsonKey(name: 'created_at') required this.createdAt});
  factory _MealSuggestionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$MealSuggestionHistoryModelFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String prompt;
  @override
  final dynamic response;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  /// Create a copy of MealSuggestionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MealSuggestionHistoryModelCopyWith<_MealSuggestionHistoryModel>
      get copyWith => __$MealSuggestionHistoryModelCopyWithImpl<
          _MealSuggestionHistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MealSuggestionHistoryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MealSuggestionHistoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            const DeepCollectionEquality().equals(other.response, response) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, prompt,
      const DeepCollectionEquality().hash(response), createdAt);

  @override
  String toString() {
    return 'MealSuggestionHistoryModel(id: $id, userId: $userId, prompt: $prompt, response: $response, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$MealSuggestionHistoryModelCopyWith<$Res>
    implements $MealSuggestionHistoryModelCopyWith<$Res> {
  factory _$MealSuggestionHistoryModelCopyWith(
          _MealSuggestionHistoryModel value,
          $Res Function(_MealSuggestionHistoryModel) _then) =
      __$MealSuggestionHistoryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String prompt,
      dynamic response,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$MealSuggestionHistoryModelCopyWithImpl<$Res>
    implements _$MealSuggestionHistoryModelCopyWith<$Res> {
  __$MealSuggestionHistoryModelCopyWithImpl(this._self, this._then);

  final _MealSuggestionHistoryModel _self;
  final $Res Function(_MealSuggestionHistoryModel) _then;

  /// Create a copy of MealSuggestionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? prompt = null,
    Object? response = freezed,
    Object? createdAt = null,
  }) {
    return _then(_MealSuggestionHistoryModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _self.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      response: freezed == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
