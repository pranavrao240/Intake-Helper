// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealNotificationModel {
  @JsonKey(name: 'id')
  String get id;
  @JsonKey(name: 'userId')
  String get userId;
  @JsonKey(name: 'title')
  String get title;
  @JsonKey(name: 'message')
  String get message;
  @JsonKey(name: 'type')
  NotificationType get type;
  @JsonKey(name: 'priority')
  NotificationPriority get priority;
  @JsonKey(name: 'isRead')
  bool get isRead;
  @JsonKey(name: 'actionUrl')
  String? get actionUrl;
  @JsonKey(name: 'actionText')
  String? get actionText;
  @JsonKey(name: 'metadata')
  Map<String, dynamic> get metadata;
  @JsonKey(name: 'expiresAt')
  DateTime? get expiresAt;
  @JsonKey(name: 'scheduledFor')
  DateTime? get scheduledFor;
  @JsonKey(name: 'sentAt')
  DateTime? get sentAt;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;

  /// Create a copy of MealNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MealNotificationModelCopyWith<MealNotificationModel> get copyWith =>
      _$MealNotificationModelCopyWithImpl<MealNotificationModel>(
          this as MealNotificationModel, _$identity);

  /// Serializes this MealNotificationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MealNotificationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      message,
      type,
      priority,
      isRead,
      actionUrl,
      actionText,
      const DeepCollectionEquality().hash(metadata),
      expiresAt,
      scheduledFor,
      sentAt,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'MealNotificationModel(id: $id, userId: $userId, title: $title, message: $message, type: $type, priority: $priority, isRead: $isRead, actionUrl: $actionUrl, actionText: $actionText, metadata: $metadata, expiresAt: $expiresAt, scheduledFor: $scheduledFor, sentAt: $sentAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $MealNotificationModelCopyWith<$Res> {
  factory $MealNotificationModelCopyWith(MealNotificationModel value,
          $Res Function(MealNotificationModel) _then) =
      _$MealNotificationModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'type') NotificationType type,
      @JsonKey(name: 'priority') NotificationPriority priority,
      @JsonKey(name: 'isRead') bool isRead,
      @JsonKey(name: 'actionUrl') String? actionUrl,
      @JsonKey(name: 'actionText') String? actionText,
      @JsonKey(name: 'metadata') Map<String, dynamic> metadata,
      @JsonKey(name: 'expiresAt') DateTime? expiresAt,
      @JsonKey(name: 'scheduledFor') DateTime? scheduledFor,
      @JsonKey(name: 'sentAt') DateTime? sentAt,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
}

/// @nodoc
class _$MealNotificationModelCopyWithImpl<$Res>
    implements $MealNotificationModelCopyWith<$Res> {
  _$MealNotificationModelCopyWithImpl(this._self, this._then);

  final MealNotificationModel _self;
  final $Res Function(MealNotificationModel) _then;

  /// Create a copy of MealNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? priority = null,
    Object? isRead = null,
    Object? actionUrl = freezed,
    Object? actionText = freezed,
    Object? metadata = null,
    Object? expiresAt = freezed,
    Object? scheduledFor = freezed,
    Object? sentAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      actionUrl: freezed == actionUrl
          ? _self.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionText: freezed == actionText
          ? _self.actionText
          : actionText // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduledFor: freezed == scheduledFor
          ? _self.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MealNotificationModel].
extension MealNotificationModelPatterns on MealNotificationModel {
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
    TResult Function(_MealNotificationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MealNotificationModel() when $default != null:
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
    TResult Function(_MealNotificationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MealNotificationModel():
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
    TResult? Function(_MealNotificationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MealNotificationModel() when $default != null:
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'userId') String userId,
            @JsonKey(name: 'title') String title,
            @JsonKey(name: 'message') String message,
            @JsonKey(name: 'type') NotificationType type,
            @JsonKey(name: 'priority') NotificationPriority priority,
            @JsonKey(name: 'isRead') bool isRead,
            @JsonKey(name: 'actionUrl') String? actionUrl,
            @JsonKey(name: 'actionText') String? actionText,
            @JsonKey(name: 'metadata') Map<String, dynamic> metadata,
            @JsonKey(name: 'expiresAt') DateTime? expiresAt,
            @JsonKey(name: 'scheduledFor') DateTime? scheduledFor,
            @JsonKey(name: 'sentAt') DateTime? sentAt,
            @JsonKey(name: 'createdAt') DateTime? createdAt,
            @JsonKey(name: 'updatedAt') DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MealNotificationModel() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.title,
            _that.message,
            _that.type,
            _that.priority,
            _that.isRead,
            _that.actionUrl,
            _that.actionText,
            _that.metadata,
            _that.expiresAt,
            _that.scheduledFor,
            _that.sentAt,
            _that.createdAt,
            _that.updatedAt);
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'userId') String userId,
            @JsonKey(name: 'title') String title,
            @JsonKey(name: 'message') String message,
            @JsonKey(name: 'type') NotificationType type,
            @JsonKey(name: 'priority') NotificationPriority priority,
            @JsonKey(name: 'isRead') bool isRead,
            @JsonKey(name: 'actionUrl') String? actionUrl,
            @JsonKey(name: 'actionText') String? actionText,
            @JsonKey(name: 'metadata') Map<String, dynamic> metadata,
            @JsonKey(name: 'expiresAt') DateTime? expiresAt,
            @JsonKey(name: 'scheduledFor') DateTime? scheduledFor,
            @JsonKey(name: 'sentAt') DateTime? sentAt,
            @JsonKey(name: 'createdAt') DateTime? createdAt,
            @JsonKey(name: 'updatedAt') DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MealNotificationModel():
        return $default(
            _that.id,
            _that.userId,
            _that.title,
            _that.message,
            _that.type,
            _that.priority,
            _that.isRead,
            _that.actionUrl,
            _that.actionText,
            _that.metadata,
            _that.expiresAt,
            _that.scheduledFor,
            _that.sentAt,
            _that.createdAt,
            _that.updatedAt);
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'userId') String userId,
            @JsonKey(name: 'title') String title,
            @JsonKey(name: 'message') String message,
            @JsonKey(name: 'type') NotificationType type,
            @JsonKey(name: 'priority') NotificationPriority priority,
            @JsonKey(name: 'isRead') bool isRead,
            @JsonKey(name: 'actionUrl') String? actionUrl,
            @JsonKey(name: 'actionText') String? actionText,
            @JsonKey(name: 'metadata') Map<String, dynamic> metadata,
            @JsonKey(name: 'expiresAt') DateTime? expiresAt,
            @JsonKey(name: 'scheduledFor') DateTime? scheduledFor,
            @JsonKey(name: 'sentAt') DateTime? sentAt,
            @JsonKey(name: 'createdAt') DateTime? createdAt,
            @JsonKey(name: 'updatedAt') DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MealNotificationModel() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.title,
            _that.message,
            _that.type,
            _that.priority,
            _that.isRead,
            _that.actionUrl,
            _that.actionText,
            _that.metadata,
            _that.expiresAt,
            _that.scheduledFor,
            _that.sentAt,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MealNotificationModel implements MealNotificationModel {
  const _MealNotificationModel(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'userId') required this.userId,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'type') this.type = NotificationType.system,
      @JsonKey(name: 'priority') this.priority = NotificationPriority.medium,
      @JsonKey(name: 'isRead') this.isRead = false,
      @JsonKey(name: 'actionUrl') this.actionUrl,
      @JsonKey(name: 'actionText') this.actionText,
      @JsonKey(name: 'metadata') final Map<String, dynamic> metadata = const {},
      @JsonKey(name: 'expiresAt') this.expiresAt,
      @JsonKey(name: 'scheduledFor') this.scheduledFor,
      @JsonKey(name: 'sentAt') this.sentAt,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt})
      : _metadata = metadata;
  factory _MealNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$MealNotificationModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'type')
  final NotificationType type;
  @override
  @JsonKey(name: 'priority')
  final NotificationPriority priority;
  @override
  @JsonKey(name: 'isRead')
  final bool isRead;
  @override
  @JsonKey(name: 'actionUrl')
  final String? actionUrl;
  @override
  @JsonKey(name: 'actionText')
  final String? actionText;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey(name: 'metadata')
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  @JsonKey(name: 'expiresAt')
  final DateTime? expiresAt;
  @override
  @JsonKey(name: 'scheduledFor')
  final DateTime? scheduledFor;
  @override
  @JsonKey(name: 'sentAt')
  final DateTime? sentAt;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  /// Create a copy of MealNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MealNotificationModelCopyWith<_MealNotificationModel> get copyWith =>
      __$MealNotificationModelCopyWithImpl<_MealNotificationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MealNotificationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MealNotificationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      message,
      type,
      priority,
      isRead,
      actionUrl,
      actionText,
      const DeepCollectionEquality().hash(_metadata),
      expiresAt,
      scheduledFor,
      sentAt,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'MealNotificationModel(id: $id, userId: $userId, title: $title, message: $message, type: $type, priority: $priority, isRead: $isRead, actionUrl: $actionUrl, actionText: $actionText, metadata: $metadata, expiresAt: $expiresAt, scheduledFor: $scheduledFor, sentAt: $sentAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$MealNotificationModelCopyWith<$Res>
    implements $MealNotificationModelCopyWith<$Res> {
  factory _$MealNotificationModelCopyWith(_MealNotificationModel value,
          $Res Function(_MealNotificationModel) _then) =
      __$MealNotificationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'type') NotificationType type,
      @JsonKey(name: 'priority') NotificationPriority priority,
      @JsonKey(name: 'isRead') bool isRead,
      @JsonKey(name: 'actionUrl') String? actionUrl,
      @JsonKey(name: 'actionText') String? actionText,
      @JsonKey(name: 'metadata') Map<String, dynamic> metadata,
      @JsonKey(name: 'expiresAt') DateTime? expiresAt,
      @JsonKey(name: 'scheduledFor') DateTime? scheduledFor,
      @JsonKey(name: 'sentAt') DateTime? sentAt,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
}

/// @nodoc
class __$MealNotificationModelCopyWithImpl<$Res>
    implements _$MealNotificationModelCopyWith<$Res> {
  __$MealNotificationModelCopyWithImpl(this._self, this._then);

  final _MealNotificationModel _self;
  final $Res Function(_MealNotificationModel) _then;

  /// Create a copy of MealNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? priority = null,
    Object? isRead = null,
    Object? actionUrl = freezed,
    Object? actionText = freezed,
    Object? metadata = null,
    Object? expiresAt = freezed,
    Object? scheduledFor = freezed,
    Object? sentAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_MealNotificationModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      actionUrl: freezed == actionUrl
          ? _self.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionText: freezed == actionText
          ? _self.actionText
          : actionText // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduledFor: freezed == scheduledFor
          ? _self.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
