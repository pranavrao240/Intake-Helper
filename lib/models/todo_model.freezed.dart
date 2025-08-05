// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoModel {
  @JsonKey(name: 'userId')
  String? get userId;
  @JsonKey(name: 'mealId')
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
  $Res call(
      {@JsonKey(name: 'userId') String? userId,
      @JsonKey(name: 'mealId') String? mealId,
      List<Meal> meals});
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

/// @nodoc
@JsonSerializable()
class _TodoModel implements TodoModel {
  _TodoModel(
      {@JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'mealId') this.mealId,
      final List<Meal> meals = const []})
      : _meals = meals;
  factory _TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  @override
  @JsonKey(name: 'userId')
  final String? userId;
  @override
  @JsonKey(name: 'mealId')
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
  $Res call(
      {@JsonKey(name: 'userId') String? userId,
      @JsonKey(name: 'mealId') String? mealId,
      List<Meal> meals});
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
  String? get id;
  Nutrition get nutrition;

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
                other.nutrition == nutrition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nutrition);

  @override
  String toString() {
    return 'Meal(id: $id, nutrition: $nutrition)';
  }
}

/// @nodoc
abstract mixin class $MealCopyWith<$Res> {
  factory $MealCopyWith(Meal value, $Res Function(Meal) _then) =
      _$MealCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, Nutrition nutrition});

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
    Object? id = freezed,
    Object? nutrition = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nutrition: null == nutrition
          ? _self.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
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

/// @nodoc
@JsonSerializable()
class _Meal implements Meal {
  _Meal({@JsonKey(name: '_id') this.id, required this.nutrition});
  factory _Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final Nutrition nutrition;

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
                other.nutrition == nutrition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nutrition);

  @override
  String toString() {
    return 'Meal(id: $id, nutrition: $nutrition)';
  }
}

/// @nodoc
abstract mixin class _$MealCopyWith<$Res> implements $MealCopyWith<$Res> {
  factory _$MealCopyWith(_Meal value, $Res Function(_Meal) _then) =
      __$MealCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, Nutrition nutrition});

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
    Object? id = freezed,
    Object? nutrition = null,
  }) {
    return _then(_Meal(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nutrition: null == nutrition
          ? _self.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
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
