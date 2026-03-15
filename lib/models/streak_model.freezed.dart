// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StreakModel {
  bool get success;
  String get message;
  StreakData get data;

  /// Create a copy of StreakModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StreakModelCopyWith<StreakModel> get copyWith =>
      _$StreakModelCopyWithImpl<StreakModel>(this as StreakModel, _$identity);

  /// Serializes this StreakModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StreakModel &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  @override
  String toString() {
    return 'StreakModel(success: $success, message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class $StreakModelCopyWith<$Res> {
  factory $StreakModelCopyWith(
          StreakModel value, $Res Function(StreakModel) _then) =
      _$StreakModelCopyWithImpl;
  @useResult
  $Res call({bool success, String message, StreakData data});

  $StreakDataCopyWith<$Res> get data;
}

/// @nodoc
class _$StreakModelCopyWithImpl<$Res> implements $StreakModelCopyWith<$Res> {
  _$StreakModelCopyWithImpl(this._self, this._then);

  final StreakModel _self;
  final $Res Function(StreakModel) _then;

  /// Create a copy of StreakModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as StreakData,
    ));
  }

  /// Create a copy of StreakModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StreakDataCopyWith<$Res> get data {
    return $StreakDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [StreakModel].
extension StreakModelPatterns on StreakModel {
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
    TResult Function(_StreakModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StreakModel() when $default != null:
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
    TResult Function(_StreakModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakModel():
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
    TResult? Function(_StreakModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakModel() when $default != null:
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
    TResult Function(bool success, String message, StreakData data)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StreakModel() when $default != null:
        return $default(_that.success, _that.message, _that.data);
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
    TResult Function(bool success, String message, StreakData data) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakModel():
        return $default(_that.success, _that.message, _that.data);
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
    TResult? Function(bool success, String message, StreakData data)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakModel() when $default != null:
        return $default(_that.success, _that.message, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StreakModel implements StreakModel {
  const _StreakModel(
      {required this.success, required this.message, required this.data});
  factory _StreakModel.fromJson(Map<String, dynamic> json) =>
      _$StreakModelFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final StreakData data;

  /// Create a copy of StreakModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StreakModelCopyWith<_StreakModel> get copyWith =>
      __$StreakModelCopyWithImpl<_StreakModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StreakModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StreakModel &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  @override
  String toString() {
    return 'StreakModel(success: $success, message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$StreakModelCopyWith<$Res>
    implements $StreakModelCopyWith<$Res> {
  factory _$StreakModelCopyWith(
          _StreakModel value, $Res Function(_StreakModel) _then) =
      __$StreakModelCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, String message, StreakData data});

  @override
  $StreakDataCopyWith<$Res> get data;
}

/// @nodoc
class __$StreakModelCopyWithImpl<$Res> implements _$StreakModelCopyWith<$Res> {
  __$StreakModelCopyWithImpl(this._self, this._then);

  final _StreakModel _self;
  final $Res Function(_StreakModel) _then;

  /// Create a copy of StreakModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_StreakModel(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as StreakData,
    ));
  }

  /// Create a copy of StreakModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StreakDataCopyWith<$Res> get data {
    return $StreakDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$StreakData {
  int get currentStreak;
  int get longestStreak;
  DateTime get lastCompletedDate;
  List<StreakHistory> get streakHistory;

  /// Create a copy of StreakData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StreakDataCopyWith<StreakData> get copyWith =>
      _$StreakDataCopyWithImpl<StreakData>(this as StreakData, _$identity);

  /// Serializes this StreakData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StreakData &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.lastCompletedDate, lastCompletedDate) ||
                other.lastCompletedDate == lastCompletedDate) &&
            const DeepCollectionEquality()
                .equals(other.streakHistory, streakHistory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentStreak, longestStreak,
      lastCompletedDate, const DeepCollectionEquality().hash(streakHistory));

  @override
  String toString() {
    return 'StreakData(currentStreak: $currentStreak, longestStreak: $longestStreak, lastCompletedDate: $lastCompletedDate, streakHistory: $streakHistory)';
  }
}

/// @nodoc
abstract mixin class $StreakDataCopyWith<$Res> {
  factory $StreakDataCopyWith(
          StreakData value, $Res Function(StreakData) _then) =
      _$StreakDataCopyWithImpl;
  @useResult
  $Res call(
      {int currentStreak,
      int longestStreak,
      DateTime lastCompletedDate,
      List<StreakHistory> streakHistory});
}

/// @nodoc
class _$StreakDataCopyWithImpl<$Res> implements $StreakDataCopyWith<$Res> {
  _$StreakDataCopyWithImpl(this._self, this._then);

  final StreakData _self;
  final $Res Function(StreakData) _then;

  /// Create a copy of StreakData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? lastCompletedDate = null,
    Object? streakHistory = null,
  }) {
    return _then(_self.copyWith(
      currentStreak: null == currentStreak
          ? _self.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _self.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      lastCompletedDate: null == lastCompletedDate
          ? _self.lastCompletedDate
          : lastCompletedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streakHistory: null == streakHistory
          ? _self.streakHistory
          : streakHistory // ignore: cast_nullable_to_non_nullable
              as List<StreakHistory>,
    ));
  }
}

/// Adds pattern-matching-related methods to [StreakData].
extension StreakDataPatterns on StreakData {
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
    TResult Function(_StreakData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StreakData() when $default != null:
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
    TResult Function(_StreakData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakData():
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
    TResult? Function(_StreakData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakData() when $default != null:
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
    TResult Function(int currentStreak, int longestStreak,
            DateTime lastCompletedDate, List<StreakHistory> streakHistory)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StreakData() when $default != null:
        return $default(_that.currentStreak, _that.longestStreak,
            _that.lastCompletedDate, _that.streakHistory);
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
    TResult Function(int currentStreak, int longestStreak,
            DateTime lastCompletedDate, List<StreakHistory> streakHistory)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakData():
        return $default(_that.currentStreak, _that.longestStreak,
            _that.lastCompletedDate, _that.streakHistory);
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
    TResult? Function(int currentStreak, int longestStreak,
            DateTime lastCompletedDate, List<StreakHistory> streakHistory)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakData() when $default != null:
        return $default(_that.currentStreak, _that.longestStreak,
            _that.lastCompletedDate, _that.streakHistory);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StreakData implements StreakData {
  const _StreakData(
      {required this.currentStreak,
      required this.longestStreak,
      required this.lastCompletedDate,
      required final List<StreakHistory> streakHistory})
      : _streakHistory = streakHistory;
  factory _StreakData.fromJson(Map<String, dynamic> json) =>
      _$StreakDataFromJson(json);

  @override
  final int currentStreak;
  @override
  final int longestStreak;
  @override
  final DateTime lastCompletedDate;
  final List<StreakHistory> _streakHistory;
  @override
  List<StreakHistory> get streakHistory {
    if (_streakHistory is EqualUnmodifiableListView) return _streakHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_streakHistory);
  }

  /// Create a copy of StreakData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StreakDataCopyWith<_StreakData> get copyWith =>
      __$StreakDataCopyWithImpl<_StreakData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StreakDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StreakData &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.lastCompletedDate, lastCompletedDate) ||
                other.lastCompletedDate == lastCompletedDate) &&
            const DeepCollectionEquality()
                .equals(other._streakHistory, _streakHistory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentStreak, longestStreak,
      lastCompletedDate, const DeepCollectionEquality().hash(_streakHistory));

  @override
  String toString() {
    return 'StreakData(currentStreak: $currentStreak, longestStreak: $longestStreak, lastCompletedDate: $lastCompletedDate, streakHistory: $streakHistory)';
  }
}

/// @nodoc
abstract mixin class _$StreakDataCopyWith<$Res>
    implements $StreakDataCopyWith<$Res> {
  factory _$StreakDataCopyWith(
          _StreakData value, $Res Function(_StreakData) _then) =
      __$StreakDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int currentStreak,
      int longestStreak,
      DateTime lastCompletedDate,
      List<StreakHistory> streakHistory});
}

/// @nodoc
class __$StreakDataCopyWithImpl<$Res> implements _$StreakDataCopyWith<$Res> {
  __$StreakDataCopyWithImpl(this._self, this._then);

  final _StreakData _self;
  final $Res Function(_StreakData) _then;

  /// Create a copy of StreakData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? lastCompletedDate = null,
    Object? streakHistory = null,
  }) {
    return _then(_StreakData(
      currentStreak: null == currentStreak
          ? _self.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _self.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      lastCompletedDate: null == lastCompletedDate
          ? _self.lastCompletedDate
          : lastCompletedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streakHistory: null == streakHistory
          ? _self._streakHistory
          : streakHistory // ignore: cast_nullable_to_non_nullable
              as List<StreakHistory>,
    ));
  }
}

/// @nodoc
mixin _$StreakHistory {
  DateTime get date;
  int get todosCompleted;
  int get todosAdded;
  bool get streakMaintained;
  @JsonKey(name: "_id")
  String get id;

  /// Create a copy of StreakHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StreakHistoryCopyWith<StreakHistory> get copyWith =>
      _$StreakHistoryCopyWithImpl<StreakHistory>(
          this as StreakHistory, _$identity);

  /// Serializes this StreakHistory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StreakHistory &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.todosCompleted, todosCompleted) ||
                other.todosCompleted == todosCompleted) &&
            (identical(other.todosAdded, todosAdded) ||
                other.todosAdded == todosAdded) &&
            (identical(other.streakMaintained, streakMaintained) ||
                other.streakMaintained == streakMaintained) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, todosCompleted, todosAdded, streakMaintained, id);

  @override
  String toString() {
    return 'StreakHistory(date: $date, todosCompleted: $todosCompleted, todosAdded: $todosAdded, streakMaintained: $streakMaintained, id: $id)';
  }
}

/// @nodoc
abstract mixin class $StreakHistoryCopyWith<$Res> {
  factory $StreakHistoryCopyWith(
          StreakHistory value, $Res Function(StreakHistory) _then) =
      _$StreakHistoryCopyWithImpl;
  @useResult
  $Res call(
      {DateTime date,
      int todosCompleted,
      int todosAdded,
      bool streakMaintained,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class _$StreakHistoryCopyWithImpl<$Res>
    implements $StreakHistoryCopyWith<$Res> {
  _$StreakHistoryCopyWithImpl(this._self, this._then);

  final StreakHistory _self;
  final $Res Function(StreakHistory) _then;

  /// Create a copy of StreakHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? todosCompleted = null,
    Object? todosAdded = null,
    Object? streakMaintained = null,
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      todosCompleted: null == todosCompleted
          ? _self.todosCompleted
          : todosCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      todosAdded: null == todosAdded
          ? _self.todosAdded
          : todosAdded // ignore: cast_nullable_to_non_nullable
              as int,
      streakMaintained: null == streakMaintained
          ? _self.streakMaintained
          : streakMaintained // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [StreakHistory].
extension StreakHistoryPatterns on StreakHistory {
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
    TResult Function(_StreakHistory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StreakHistory() when $default != null:
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
    TResult Function(_StreakHistory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakHistory():
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
    TResult? Function(_StreakHistory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakHistory() when $default != null:
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
    TResult Function(DateTime date, int todosCompleted, int todosAdded,
            bool streakMaintained, @JsonKey(name: "_id") String id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StreakHistory() when $default != null:
        return $default(_that.date, _that.todosCompleted, _that.todosAdded,
            _that.streakMaintained, _that.id);
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
    TResult Function(DateTime date, int todosCompleted, int todosAdded,
            bool streakMaintained, @JsonKey(name: "_id") String id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakHistory():
        return $default(_that.date, _that.todosCompleted, _that.todosAdded,
            _that.streakMaintained, _that.id);
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
    TResult? Function(DateTime date, int todosCompleted, int todosAdded,
            bool streakMaintained, @JsonKey(name: "_id") String id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreakHistory() when $default != null:
        return $default(_that.date, _that.todosCompleted, _that.todosAdded,
            _that.streakMaintained, _that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StreakHistory implements StreakHistory {
  const _StreakHistory(
      {required this.date,
      required this.todosCompleted,
      required this.todosAdded,
      required this.streakMaintained,
      @JsonKey(name: "_id") required this.id});
  factory _StreakHistory.fromJson(Map<String, dynamic> json) =>
      _$StreakHistoryFromJson(json);

  @override
  final DateTime date;
  @override
  final int todosCompleted;
  @override
  final int todosAdded;
  @override
  final bool streakMaintained;
  @override
  @JsonKey(name: "_id")
  final String id;

  /// Create a copy of StreakHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StreakHistoryCopyWith<_StreakHistory> get copyWith =>
      __$StreakHistoryCopyWithImpl<_StreakHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StreakHistoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StreakHistory &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.todosCompleted, todosCompleted) ||
                other.todosCompleted == todosCompleted) &&
            (identical(other.todosAdded, todosAdded) ||
                other.todosAdded == todosAdded) &&
            (identical(other.streakMaintained, streakMaintained) ||
                other.streakMaintained == streakMaintained) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, todosCompleted, todosAdded, streakMaintained, id);

  @override
  String toString() {
    return 'StreakHistory(date: $date, todosCompleted: $todosCompleted, todosAdded: $todosAdded, streakMaintained: $streakMaintained, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$StreakHistoryCopyWith<$Res>
    implements $StreakHistoryCopyWith<$Res> {
  factory _$StreakHistoryCopyWith(
          _StreakHistory value, $Res Function(_StreakHistory) _then) =
      __$StreakHistoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime date,
      int todosCompleted,
      int todosAdded,
      bool streakMaintained,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class __$StreakHistoryCopyWithImpl<$Res>
    implements _$StreakHistoryCopyWith<$Res> {
  __$StreakHistoryCopyWithImpl(this._self, this._then);

  final _StreakHistory _self;
  final $Res Function(_StreakHistory) _then;

  /// Create a copy of StreakHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? todosCompleted = null,
    Object? todosAdded = null,
    Object? streakMaintained = null,
    Object? id = null,
  }) {
    return _then(_StreakHistory(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      todosCompleted: null == todosCompleted
          ? _self.todosCompleted
          : todosCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      todosAdded: null == todosAdded
          ? _self.todosAdded
          : todosAdded // ignore: cast_nullable_to_non_nullable
              as int,
      streakMaintained: null == streakMaintained
          ? _self.streakMaintained
          : streakMaintained // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
