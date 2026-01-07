// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openAi_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpenAiState {
  ApiModel? get openAiModel;
  bool get isLoading;
  String? get errorMessage;
  String? get message;

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OpenAiStateCopyWith<OpenAiState> get copyWith =>
      _$OpenAiStateCopyWithImpl<OpenAiState>(this as OpenAiState, _$identity);

  /// Serializes this OpenAiState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OpenAiState &&
            (identical(other.openAiModel, openAiModel) ||
                other.openAiModel == openAiModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, openAiModel, isLoading, errorMessage, message);

  @override
  String toString() {
    return 'OpenAiState(openAiModel: $openAiModel, isLoading: $isLoading, errorMessage: $errorMessage, message: $message)';
  }
}

/// @nodoc
abstract mixin class $OpenAiStateCopyWith<$Res> {
  factory $OpenAiStateCopyWith(
          OpenAiState value, $Res Function(OpenAiState) _then) =
      _$OpenAiStateCopyWithImpl;
  @useResult
  $Res call(
      {ApiModel? openAiModel,
      bool isLoading,
      String? errorMessage,
      String? message});

  $ApiModelCopyWith<$Res>? get openAiModel;
}

/// @nodoc
class _$OpenAiStateCopyWithImpl<$Res> implements $OpenAiStateCopyWith<$Res> {
  _$OpenAiStateCopyWithImpl(this._self, this._then);

  final OpenAiState _self;
  final $Res Function(OpenAiState) _then;

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openAiModel = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      openAiModel: freezed == openAiModel
          ? _self.openAiModel
          : openAiModel // ignore: cast_nullable_to_non_nullable
              as ApiModel?,
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

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiModelCopyWith<$Res>? get openAiModel {
    if (_self.openAiModel == null) {
      return null;
    }

    return $ApiModelCopyWith<$Res>(_self.openAiModel!, (value) {
      return _then(_self.copyWith(openAiModel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OpenAiState].
extension OpenAiStatePatterns on OpenAiState {
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
    TResult Function(_OpenAiState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OpenAiState() when $default != null:
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
    TResult Function(_OpenAiState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OpenAiState():
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
    TResult? Function(_OpenAiState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OpenAiState() when $default != null:
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
    TResult Function(ApiModel? openAiModel, bool isLoading,
            String? errorMessage, String? message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OpenAiState() when $default != null:
        return $default(_that.openAiModel, _that.isLoading, _that.errorMessage,
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
    TResult Function(ApiModel? openAiModel, bool isLoading,
            String? errorMessage, String? message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OpenAiState():
        return $default(_that.openAiModel, _that.isLoading, _that.errorMessage,
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
    TResult? Function(ApiModel? openAiModel, bool isLoading,
            String? errorMessage, String? message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OpenAiState() when $default != null:
        return $default(_that.openAiModel, _that.isLoading, _that.errorMessage,
            _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OpenAiState implements OpenAiState {
  const _OpenAiState(
      {this.openAiModel,
      this.isLoading = false,
      this.errorMessage,
      this.message});
  factory _OpenAiState.fromJson(Map<String, dynamic> json) =>
      _$OpenAiStateFromJson(json);

  @override
  final ApiModel? openAiModel;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final String? message;

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OpenAiStateCopyWith<_OpenAiState> get copyWith =>
      __$OpenAiStateCopyWithImpl<_OpenAiState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OpenAiStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OpenAiState &&
            (identical(other.openAiModel, openAiModel) ||
                other.openAiModel == openAiModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, openAiModel, isLoading, errorMessage, message);

  @override
  String toString() {
    return 'OpenAiState(openAiModel: $openAiModel, isLoading: $isLoading, errorMessage: $errorMessage, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$OpenAiStateCopyWith<$Res>
    implements $OpenAiStateCopyWith<$Res> {
  factory _$OpenAiStateCopyWith(
          _OpenAiState value, $Res Function(_OpenAiState) _then) =
      __$OpenAiStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ApiModel? openAiModel,
      bool isLoading,
      String? errorMessage,
      String? message});

  @override
  $ApiModelCopyWith<$Res>? get openAiModel;
}

/// @nodoc
class __$OpenAiStateCopyWithImpl<$Res> implements _$OpenAiStateCopyWith<$Res> {
  __$OpenAiStateCopyWithImpl(this._self, this._then);

  final _OpenAiState _self;
  final $Res Function(_OpenAiState) _then;

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? openAiModel = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? message = freezed,
  }) {
    return _then(_OpenAiState(
      openAiModel: freezed == openAiModel
          ? _self.openAiModel
          : openAiModel // ignore: cast_nullable_to_non_nullable
              as ApiModel?,
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

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiModelCopyWith<$Res>? get openAiModel {
    if (_self.openAiModel == null) {
      return null;
    }

    return $ApiModelCopyWith<$Res>(_self.openAiModel!, (value) {
      return _then(_self.copyWith(openAiModel: value));
    });
  }
}

// dart format on
