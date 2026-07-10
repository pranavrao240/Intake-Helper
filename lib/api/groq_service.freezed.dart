// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'groq_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroqState {
  GroqModel? get groqModel;
  bool get isLoading;
  String? get errorMessage;
  String? get message;

  /// Create a copy of GroqState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroqStateCopyWith<GroqState> get copyWith =>
      _$GroqStateCopyWithImpl<GroqState>(this as GroqState, _$identity);

  /// Serializes this GroqState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroqState &&
            (identical(other.groqModel, groqModel) ||
                other.groqModel == groqModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, groqModel, isLoading, errorMessage, message);

  @override
  String toString() {
    return 'GroqState(groqModel: $groqModel, isLoading: $isLoading, errorMessage: $errorMessage, message: $message)';
  }
}

/// @nodoc
abstract mixin class $GroqStateCopyWith<$Res> {
  factory $GroqStateCopyWith(GroqState value, $Res Function(GroqState) _then) =
      _$GroqStateCopyWithImpl;
  @useResult
  $Res call(
      {GroqModel? groqModel,
      bool isLoading,
      String? errorMessage,
      String? message});

  $GroqModelCopyWith<$Res>? get groqModel;
}

/// @nodoc
class _$GroqStateCopyWithImpl<$Res> implements $GroqStateCopyWith<$Res> {
  _$GroqStateCopyWithImpl(this._self, this._then);

  final GroqState _self;
  final $Res Function(GroqState) _then;

  /// Create a copy of GroqState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groqModel = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      groqModel: freezed == groqModel
          ? _self.groqModel
          : groqModel // ignore: cast_nullable_to_non_nullable
              as GroqModel?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of GroqState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqModelCopyWith<$Res>? get groqModel {
    if (_self.groqModel == null) {
      return null;
    }

    return $GroqModelCopyWith<$Res>(_self.groqModel!, (value) {
      return _then(_self.copyWith(groqModel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GroqState].
extension GroqStatePatterns on GroqState {
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
    TResult Function(_GroqState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqState() when $default != null:
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
    TResult Function(_GroqState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqState():
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
    TResult? Function(_GroqState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqState() when $default != null:
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
    TResult Function(GroqModel? groqModel, bool isLoading, String? errorMessage,
            String? message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqState() when $default != null:
        return $default(_that.groqModel, _that.isLoading, _that.errorMessage,
            _that.message);
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
    TResult Function(GroqModel? groqModel, bool isLoading, String? errorMessage,
            String? message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqState():
        return $default(_that.groqModel, _that.isLoading, _that.errorMessage,
            _that.message);
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
    TResult? Function(GroqModel? groqModel, bool isLoading,
            String? errorMessage, String? message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqState() when $default != null:
        return $default(_that.groqModel, _that.isLoading, _that.errorMessage,
            _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroqState implements GroqState {
  const _GroqState(
      {this.groqModel,
      this.isLoading = false,
      this.errorMessage,
      this.message});
  factory _GroqState.fromJson(Map<String, dynamic> json) =>
      _$GroqStateFromJson(json);

  @override
  final GroqModel? groqModel;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final String? message;

  /// Create a copy of GroqState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroqStateCopyWith<_GroqState> get copyWith =>
      __$GroqStateCopyWithImpl<_GroqState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroqStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroqState &&
            (identical(other.groqModel, groqModel) ||
                other.groqModel == groqModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, groqModel, isLoading, errorMessage, message);

  @override
  String toString() {
    return 'GroqState(groqModel: $groqModel, isLoading: $isLoading, errorMessage: $errorMessage, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$GroqStateCopyWith<$Res>
    implements $GroqStateCopyWith<$Res> {
  factory _$GroqStateCopyWith(
          _GroqState value, $Res Function(_GroqState) _then) =
      __$GroqStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {GroqModel? groqModel,
      bool isLoading,
      String? errorMessage,
      String? message});

  @override
  $GroqModelCopyWith<$Res>? get groqModel;
}

/// @nodoc
class __$GroqStateCopyWithImpl<$Res> implements _$GroqStateCopyWith<$Res> {
  __$GroqStateCopyWithImpl(this._self, this._then);

  final _GroqState _self;
  final $Res Function(_GroqState) _then;

  /// Create a copy of GroqState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? groqModel = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? message = freezed,
  }) {
    return _then(_GroqState(
      groqModel: freezed == groqModel
          ? _self.groqModel
          : groqModel // ignore: cast_nullable_to_non_nullable
              as GroqModel?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of GroqState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqModelCopyWith<$Res>? get groqModel {
    if (_self.groqModel == null) {
      return null;
    }

    return $GroqModelCopyWith<$Res>(_self.groqModel!, (value) {
      return _then(_self.copyWith(groqModel: value));
    });
  }
}

// dart format on
