// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'singlenutrition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SingleNutritionResponse {
  String get message;
  Nutrition get data;

  /// Create a copy of SingleNutritionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SingleNutritionResponseCopyWith<SingleNutritionResponse> get copyWith =>
      _$SingleNutritionResponseCopyWithImpl<SingleNutritionResponse>(
          this as SingleNutritionResponse, _$identity);

  /// Serializes this SingleNutritionResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SingleNutritionResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @override
  String toString() {
    return 'SingleNutritionResponse(message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class $SingleNutritionResponseCopyWith<$Res> {
  factory $SingleNutritionResponseCopyWith(SingleNutritionResponse value,
          $Res Function(SingleNutritionResponse) _then) =
      _$SingleNutritionResponseCopyWithImpl;
  @useResult
  $Res call({String message, Nutrition data});

  $NutritionCopyWith<$Res> get data;
}

/// @nodoc
class _$SingleNutritionResponseCopyWithImpl<$Res>
    implements $SingleNutritionResponseCopyWith<$Res> {
  _$SingleNutritionResponseCopyWithImpl(this._self, this._then);

  final SingleNutritionResponse _self;
  final $Res Function(SingleNutritionResponse) _then;

  /// Create a copy of SingleNutritionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Nutrition,
    ));
  }

  /// Create a copy of SingleNutritionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionCopyWith<$Res> get data {
    return $NutritionCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SingleNutritionResponse].
extension SingleNutritionResponsePatterns on SingleNutritionResponse {
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
    TResult Function(_SingleNutritionResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SingleNutritionResponse() when $default != null:
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
    TResult Function(_SingleNutritionResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleNutritionResponse():
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
    TResult? Function(_SingleNutritionResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleNutritionResponse() when $default != null:
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
    TResult Function(String message, Nutrition data)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SingleNutritionResponse() when $default != null:
        return $default(_that.message, _that.data);
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
    TResult Function(String message, Nutrition data) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleNutritionResponse():
        return $default(_that.message, _that.data);
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
    TResult? Function(String message, Nutrition data)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleNutritionResponse() when $default != null:
        return $default(_that.message, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SingleNutritionResponse implements SingleNutritionResponse {
  const _SingleNutritionResponse({required this.message, required this.data});
  factory _SingleNutritionResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleNutritionResponseFromJson(json);

  @override
  final String message;
  @override
  final Nutrition data;

  /// Create a copy of SingleNutritionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SingleNutritionResponseCopyWith<_SingleNutritionResponse> get copyWith =>
      __$SingleNutritionResponseCopyWithImpl<_SingleNutritionResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SingleNutritionResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SingleNutritionResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @override
  String toString() {
    return 'SingleNutritionResponse(message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$SingleNutritionResponseCopyWith<$Res>
    implements $SingleNutritionResponseCopyWith<$Res> {
  factory _$SingleNutritionResponseCopyWith(_SingleNutritionResponse value,
          $Res Function(_SingleNutritionResponse) _then) =
      __$SingleNutritionResponseCopyWithImpl;
  @override
  @useResult
  $Res call({String message, Nutrition data});

  @override
  $NutritionCopyWith<$Res> get data;
}

/// @nodoc
class __$SingleNutritionResponseCopyWithImpl<$Res>
    implements _$SingleNutritionResponseCopyWith<$Res> {
  __$SingleNutritionResponseCopyWithImpl(this._self, this._then);

  final _SingleNutritionResponse _self;
  final $Res Function(_SingleNutritionResponse) _then;

  /// Create a copy of SingleNutritionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_SingleNutritionResponse(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Nutrition,
    ));
  }

  /// Create a copy of SingleNutritionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionCopyWith<$Res> get data {
    return $NutritionCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
