// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoResponse {
  String get message;
  TodoModel? get data;

  /// Create a copy of TodoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodoResponseCopyWith<TodoResponse> get copyWith =>
      _$TodoResponseCopyWithImpl<TodoResponse>(
          this as TodoResponse, _$identity);

  /// Serializes this TodoResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodoResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @override
  String toString() {
    return 'TodoResponse(message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class $TodoResponseCopyWith<$Res> {
  factory $TodoResponseCopyWith(
          TodoResponse value, $Res Function(TodoResponse) _then) =
      _$TodoResponseCopyWithImpl;
  @useResult
  $Res call({String message, TodoModel? data});

  $TodoModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$TodoResponseCopyWithImpl<$Res> implements $TodoResponseCopyWith<$Res> {
  _$TodoResponseCopyWithImpl(this._self, this._then);

  final TodoResponse _self;
  final $Res Function(TodoResponse) _then;

  /// Create a copy of TodoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as TodoModel?,
    ));
  }

  /// Create a copy of TodoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodoModelCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $TodoModelCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TodoResponse].
extension TodoResponsePatterns on TodoResponse {
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
    TResult Function(_TodoResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TodoResponse() when $default != null:
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
    TResult Function(_TodoResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodoResponse():
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
    TResult? Function(_TodoResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodoResponse() when $default != null:
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
    TResult Function(String message, TodoModel? data)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TodoResponse() when $default != null:
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
    TResult Function(String message, TodoModel? data) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodoResponse():
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
    TResult? Function(String message, TodoModel? data)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodoResponse() when $default != null:
        return $default(_that.message, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TodoResponse implements TodoResponse {
  const _TodoResponse({required this.message, required this.data});
  factory _TodoResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseFromJson(json);

  @override
  final String message;
  @override
  final TodoModel? data;

  /// Create a copy of TodoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodoResponseCopyWith<_TodoResponse> get copyWith =>
      __$TodoResponseCopyWithImpl<_TodoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TodoResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @override
  String toString() {
    return 'TodoResponse(message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$TodoResponseCopyWith<$Res>
    implements $TodoResponseCopyWith<$Res> {
  factory _$TodoResponseCopyWith(
          _TodoResponse value, $Res Function(_TodoResponse) _then) =
      __$TodoResponseCopyWithImpl;
  @override
  @useResult
  $Res call({String message, TodoModel? data});

  @override
  $TodoModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$TodoResponseCopyWithImpl<$Res>
    implements _$TodoResponseCopyWith<$Res> {
  __$TodoResponseCopyWithImpl(this._self, this._then);

  final _TodoResponse _self;
  final $Res Function(_TodoResponse) _then;

  /// Create a copy of TodoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_TodoResponse(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as TodoModel?,
    ));
  }

  /// Create a copy of TodoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodoModelCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $TodoModelCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$TodoModel {
  String? get userId;
  String? get mealId;
  List<Meal> get meals;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodoModelCopyWith<TodoModel> get copyWith =>
      _$TodoModelCopyWithImpl<TodoModel>(this as TodoModel, _$identity);

  /// Serializes this TodoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodoModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mealId, mealId) || other.mealId == mealId) &&
            const DeepCollectionEquality().equals(other.meals, meals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, mealId, const DeepCollectionEquality().hash(meals));

  @override
  String toString() {
    return 'TodoModel(userId: $userId, mealId: $mealId, meals: $meals)';
  }
}

/// @nodoc
abstract mixin class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) _then) =
      _$TodoModelCopyWithImpl;
  @useResult
  $Res call({String? userId, String? mealId, List<Meal> meals});
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res> implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._self, this._then);

  final TodoModel _self;
  final $Res Function(TodoModel) _then;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? mealId = freezed,
    Object? meals = null,
  }) {
    return _then(_self.copyWith(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      mealId: freezed == mealId
          ? _self.mealId
          : mealId // ignore: cast_nullable_to_non_nullable
              as String?,
      meals: null == meals
          ? _self.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
    ));
  }
}

/// Adds pattern-matching-related methods to [TodoModel].
extension TodoModelPatterns on TodoModel {
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
    TResult Function(_TodoModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TodoModel() when $default != null:
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
    TResult Function(_TodoModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodoModel():
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
    TResult? Function(_TodoModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodoModel() when $default != null:
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
    TResult Function(String? userId, String? mealId, List<Meal> meals)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TodoModel() when $default != null:
        return $default(_that.userId, _that.mealId, _that.meals);
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
    TResult Function(String? userId, String? mealId, List<Meal> meals) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodoModel():
        return $default(_that.userId, _that.mealId, _that.meals);
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
    TResult? Function(String? userId, String? mealId, List<Meal> meals)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodoModel() when $default != null:
        return $default(_that.userId, _that.mealId, _that.meals);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TodoModel implements TodoModel {
  const _TodoModel(
      {this.userId, this.mealId, final List<Meal> meals = const []})
      : _meals = meals;
  factory _TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  @override
  final String? userId;
  @override
  final String? mealId;
  final List<Meal> _meals;
  @override
  @JsonKey()
  List<Meal> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodoModelCopyWith<_TodoModel> get copyWith =>
      __$TodoModelCopyWithImpl<_TodoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TodoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mealId, mealId) || other.mealId == mealId) &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, mealId, const DeepCollectionEquality().hash(_meals));

  @override
  String toString() {
    return 'TodoModel(userId: $userId, mealId: $mealId, meals: $meals)';
  }
}

/// @nodoc
abstract mixin class _$TodoModelCopyWith<$Res>
    implements $TodoModelCopyWith<$Res> {
  factory _$TodoModelCopyWith(
          _TodoModel value, $Res Function(_TodoModel) _then) =
      __$TodoModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? userId, String? mealId, List<Meal> meals});
}

/// @nodoc
class __$TodoModelCopyWithImpl<$Res> implements _$TodoModelCopyWith<$Res> {
  __$TodoModelCopyWithImpl(this._self, this._then);

  final _TodoModel _self;
  final $Res Function(_TodoModel) _then;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = freezed,
    Object? mealId = freezed,
    Object? meals = null,
  }) {
    return _then(_TodoModel(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      mealId: freezed == mealId
          ? _self.mealId
          : mealId // ignore: cast_nullable_to_non_nullable
              as String?,
      meals: null == meals
          ? _self._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
    ));
  }
}

/// @nodoc
mixin _$Meal {
  @JsonKey(name: '_id')
  String get id;
  Nutrition get nutrition;
  String get status;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MealCopyWith<Meal> get copyWith =>
      _$MealCopyWithImpl<Meal>(this as Meal, _$identity);

  /// Serializes this Meal to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Meal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nutrition, status);

  @override
  String toString() {
    return 'Meal(id: $id, nutrition: $nutrition, status: $status)';
  }
}

/// @nodoc
abstract mixin class $MealCopyWith<$Res> {
  factory $MealCopyWith(Meal value, $Res Function(Meal) _then) =
      _$MealCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id, Nutrition nutrition, String status});

  $NutritionCopyWith<$Res> get nutrition;
}

/// @nodoc
class _$MealCopyWithImpl<$Res> implements $MealCopyWith<$Res> {
  _$MealCopyWithImpl(this._self, this._then);

  final Meal _self;
  final $Res Function(Meal) _then;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nutrition = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nutrition: null == nutrition
          ? _self.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionCopyWith<$Res> get nutrition {
    return $NutritionCopyWith<$Res>(_self.nutrition, (value) {
      return _then(_self.copyWith(nutrition: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Meal].
extension MealPatterns on Meal {
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
    TResult Function(_Meal value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Meal() when $default != null:
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
    TResult Function(_Meal value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Meal():
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
    TResult? Function(_Meal value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Meal() when $default != null:
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
    TResult Function(@JsonKey(name: '_id') String id, Nutrition nutrition,
            String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Meal() when $default != null:
        return $default(_that.id, _that.nutrition, _that.status);
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
            @JsonKey(name: '_id') String id, Nutrition nutrition, String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Meal():
        return $default(_that.id, _that.nutrition, _that.status);
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
    TResult? Function(@JsonKey(name: '_id') String id, Nutrition nutrition,
            String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Meal() when $default != null:
        return $default(_that.id, _that.nutrition, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Meal implements Meal {
  const _Meal(
      {@JsonKey(name: '_id') required this.id,
      required this.nutrition,
      required this.status});
  factory _Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final Nutrition nutrition;
  @override
  final String status;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MealCopyWith<_Meal> get copyWith =>
      __$MealCopyWithImpl<_Meal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MealToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Meal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nutrition, status);

  @override
  String toString() {
    return 'Meal(id: $id, nutrition: $nutrition, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$MealCopyWith<$Res> implements $MealCopyWith<$Res> {
  factory _$MealCopyWith(_Meal value, $Res Function(_Meal) _then) =
      __$MealCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id, Nutrition nutrition, String status});

  @override
  $NutritionCopyWith<$Res> get nutrition;
}

/// @nodoc
class __$MealCopyWithImpl<$Res> implements _$MealCopyWith<$Res> {
  __$MealCopyWithImpl(this._self, this._then);

  final _Meal _self;
  final $Res Function(_Meal) _then;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nutrition = null,
    Object? status = null,
  }) {
    return _then(_Meal(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nutrition: null == nutrition
          ? _self.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionCopyWith<$Res> get nutrition {
    return $NutritionCopyWith<$Res>(_self.nutrition, (value) {
      return _then(_self.copyWith(nutrition: value));
    });
  }
}

// dart format on
