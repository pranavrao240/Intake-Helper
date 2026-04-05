// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationState {
  bool get isLoading;
  String? get message;
  String? get redirect;
  Exception? get error;
  String? get errorMessage;
  String? get action;
  List<MealNotificationModel>? get notifications;
  MealNotificationModel? get notification;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      _$NotificationStateCopyWithImpl<NotificationState>(
          this as NotificationState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.redirect, redirect) ||
                other.redirect == redirect) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality()
                .equals(other.notifications, notifications) &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      message,
      redirect,
      error,
      errorMessage,
      action,
      const DeepCollectionEquality().hash(notifications),
      notification);

  @override
  String toString() {
    return 'NotificationState(isLoading: $isLoading, message: $message, redirect: $redirect, error: $error, errorMessage: $errorMessage, action: $action, notifications: $notifications, notification: $notification)';
  }
}

/// @nodoc
abstract mixin class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) _then) =
      _$NotificationStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String? message,
      String? redirect,
      Exception? error,
      String? errorMessage,
      String? action,
      List<MealNotificationModel>? notifications,
      MealNotificationModel? notification});

  $MealNotificationModelCopyWith<$Res>? get notification;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._self, this._then);

  final NotificationState _self;
  final $Res Function(NotificationState) _then;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? message = freezed,
    Object? redirect = freezed,
    Object? error = freezed,
    Object? errorMessage = freezed,
    Object? action = freezed,
    Object? notifications = freezed,
    Object? notification = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      redirect: freezed == redirect
          ? _self.redirect
          : redirect // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      notifications: freezed == notifications
          ? _self.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<MealNotificationModel>?,
      notification: freezed == notification
          ? _self.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as MealNotificationModel?,
    ));
  }

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealNotificationModelCopyWith<$Res>? get notification {
    if (_self.notification == null) {
      return null;
    }

    return $MealNotificationModelCopyWith<$Res>(_self.notification!, (value) {
      return _then(_self.copyWith(notification: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NotificationState].
extension NotificationStatePatterns on NotificationState {
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
    TResult Function(_NotificationState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationState() when $default != null:
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
    TResult Function(_NotificationState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationState():
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
    TResult? Function(_NotificationState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationState() when $default != null:
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
            bool isLoading,
            String? message,
            String? redirect,
            Exception? error,
            String? errorMessage,
            String? action,
            List<MealNotificationModel>? notifications,
            MealNotificationModel? notification)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationState() when $default != null:
        return $default(
            _that.isLoading,
            _that.message,
            _that.redirect,
            _that.error,
            _that.errorMessage,
            _that.action,
            _that.notifications,
            _that.notification);
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
            bool isLoading,
            String? message,
            String? redirect,
            Exception? error,
            String? errorMessage,
            String? action,
            List<MealNotificationModel>? notifications,
            MealNotificationModel? notification)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationState():
        return $default(
            _that.isLoading,
            _that.message,
            _that.redirect,
            _that.error,
            _that.errorMessage,
            _that.action,
            _that.notifications,
            _that.notification);
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
            bool isLoading,
            String? message,
            String? redirect,
            Exception? error,
            String? errorMessage,
            String? action,
            List<MealNotificationModel>? notifications,
            MealNotificationModel? notification)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationState() when $default != null:
        return $default(
            _that.isLoading,
            _that.message,
            _that.redirect,
            _that.error,
            _that.errorMessage,
            _that.action,
            _that.notifications,
            _that.notification);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NotificationState implements NotificationState {
  const _NotificationState(
      {this.isLoading = false,
      this.message,
      this.redirect,
      this.error,
      this.errorMessage,
      this.action,
      final List<MealNotificationModel>? notifications,
      this.notification})
      : _notifications = notifications;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? message;
  @override
  final String? redirect;
  @override
  final Exception? error;
  @override
  final String? errorMessage;
  @override
  final String? action;
  final List<MealNotificationModel>? _notifications;
  @override
  List<MealNotificationModel>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MealNotificationModel? notification;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationStateCopyWith<_NotificationState> get copyWith =>
      __$NotificationStateCopyWithImpl<_NotificationState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.redirect, redirect) ||
                other.redirect == redirect) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      message,
      redirect,
      error,
      errorMessage,
      action,
      const DeepCollectionEquality().hash(_notifications),
      notification);

  @override
  String toString() {
    return 'NotificationState(isLoading: $isLoading, message: $message, redirect: $redirect, error: $error, errorMessage: $errorMessage, action: $action, notifications: $notifications, notification: $notification)';
  }
}

/// @nodoc
abstract mixin class _$NotificationStateCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$NotificationStateCopyWith(
          _NotificationState value, $Res Function(_NotificationState) _then) =
      __$NotificationStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? message,
      String? redirect,
      Exception? error,
      String? errorMessage,
      String? action,
      List<MealNotificationModel>? notifications,
      MealNotificationModel? notification});

  @override
  $MealNotificationModelCopyWith<$Res>? get notification;
}

/// @nodoc
class __$NotificationStateCopyWithImpl<$Res>
    implements _$NotificationStateCopyWith<$Res> {
  __$NotificationStateCopyWithImpl(this._self, this._then);

  final _NotificationState _self;
  final $Res Function(_NotificationState) _then;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? message = freezed,
    Object? redirect = freezed,
    Object? error = freezed,
    Object? errorMessage = freezed,
    Object? action = freezed,
    Object? notifications = freezed,
    Object? notification = freezed,
  }) {
    return _then(_NotificationState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      redirect: freezed == redirect
          ? _self.redirect
          : redirect // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      notifications: freezed == notifications
          ? _self._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<MealNotificationModel>?,
      notification: freezed == notification
          ? _self.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as MealNotificationModel?,
    ));
  }

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealNotificationModelCopyWith<$Res>? get notification {
    if (_self.notification == null) {
      return null;
    }

    return $MealNotificationModelCopyWith<$Res>(_self.notification!, (value) {
      return _then(_self.copyWith(notification: value));
    });
  }
}

// dart format on
