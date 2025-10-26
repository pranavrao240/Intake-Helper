// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Todo {
  @JsonKey(name: '_id')
  String? get id;
  Nutrition get nutrition;

  /// Create a copy of Todo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodoCopyWith<Todo> get copyWith =>
      _$TodoCopyWithImpl<Todo>(this as Todo, _$identity);

  /// Serializes this Todo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Todo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nutrition);

  @override
  String toString() {
    return 'Todo(id: $id, nutrition: $nutrition)';
  }
}

/// @nodoc
abstract mixin class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) _then) =
      _$TodoCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, Nutrition nutrition});

  $NutritionCopyWith<$Res> get nutrition;
}

/// @nodoc
class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._self, this._then);

  final Todo _self;
  final $Res Function(Todo) _then;

  /// Create a copy of Todo
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

  /// Create a copy of Todo
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
class _Todo implements Todo {
  _Todo({@JsonKey(name: '_id') this.id, required this.nutrition});
  factory _Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final Nutrition nutrition;

  /// Create a copy of Todo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodoCopyWith<_Todo> get copyWith =>
      __$TodoCopyWithImpl<_Todo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TodoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Todo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nutrition);

  @override
  String toString() {
    return 'Todo(id: $id, nutrition: $nutrition)';
  }
}

/// @nodoc
abstract mixin class _$TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$TodoCopyWith(_Todo value, $Res Function(_Todo) _then) =
      __$TodoCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, Nutrition nutrition});

  @override
  $NutritionCopyWith<$Res> get nutrition;
}

/// @nodoc
class __$TodoCopyWithImpl<$Res> implements _$TodoCopyWith<$Res> {
  __$TodoCopyWithImpl(this._self, this._then);

  final _Todo _self;
  final $Res Function(_Todo) _then;

  /// Create a copy of Todo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? nutrition = null,
  }) {
    return _then(_Todo(
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

  /// Create a copy of Todo
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
