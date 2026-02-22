// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionResponse {
  String get message;
  List<Nutrition> get data;

  /// Create a copy of NutritionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionResponseCopyWith<NutritionResponse> get copyWith =>
      _$NutritionResponseCopyWithImpl<NutritionResponse>(
          this as NutritionResponse, _$identity);

  /// Serializes this NutritionResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionResponse &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'NutritionResponse(message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class $NutritionResponseCopyWith<$Res> {
  factory $NutritionResponseCopyWith(
          NutritionResponse value, $Res Function(NutritionResponse) _then) =
      _$NutritionResponseCopyWithImpl;
  @useResult
  $Res call({String message, List<Nutrition> data});
}

/// @nodoc
class _$NutritionResponseCopyWithImpl<$Res>
    implements $NutritionResponseCopyWith<$Res> {
  _$NutritionResponseCopyWithImpl(this._self, this._then);

  final NutritionResponse _self;
  final $Res Function(NutritionResponse) _then;

  /// Create a copy of NutritionResponse
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
              as List<Nutrition>,
    ));
  }
}

/// Adds pattern-matching-related methods to [NutritionResponse].
extension NutritionResponsePatterns on NutritionResponse {
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
    TResult Function(_NutritionResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NutritionResponse() when $default != null:
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
    TResult Function(_NutritionResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NutritionResponse():
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
    TResult? Function(_NutritionResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NutritionResponse() when $default != null:
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
    TResult Function(String message, List<Nutrition> data)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NutritionResponse() when $default != null:
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
    TResult Function(String message, List<Nutrition> data) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NutritionResponse():
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
    TResult? Function(String message, List<Nutrition> data)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NutritionResponse() when $default != null:
        return $default(_that.message, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NutritionResponse implements NutritionResponse {
  const _NutritionResponse(
      {required this.message, required final List<Nutrition> data})
      : _data = data;
  factory _NutritionResponse.fromJson(Map<String, dynamic> json) =>
      _$NutritionResponseFromJson(json);

  @override
  final String message;
  final List<Nutrition> _data;
  @override
  List<Nutrition> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of NutritionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionResponseCopyWith<_NutritionResponse> get copyWith =>
      __$NutritionResponseCopyWithImpl<_NutritionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutritionResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionResponse &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'NutritionResponse(message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$NutritionResponseCopyWith<$Res>
    implements $NutritionResponseCopyWith<$Res> {
  factory _$NutritionResponseCopyWith(
          _NutritionResponse value, $Res Function(_NutritionResponse) _then) =
      __$NutritionResponseCopyWithImpl;
  @override
  @useResult
  $Res call({String message, List<Nutrition> data});
}

/// @nodoc
class __$NutritionResponseCopyWithImpl<$Res>
    implements _$NutritionResponseCopyWith<$Res> {
  __$NutritionResponseCopyWithImpl(this._self, this._then);

  final _NutritionResponse _self;
  final $Res Function(_NutritionResponse) _then;

  /// Create a copy of NutritionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_NutritionResponse(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Nutrition>,
    ));
  }
}

/// @nodoc
mixin _$Nutrition {
  @JsonKey(fromJson: _anyToString)
  String? get id;
  @JsonKey(fromJson: _anyToString)
  String? get nutritionId;
  @JsonKey(name: '_id', fromJson: _anyToString)
  String? get localId;
  DateTime? get createdAt;
  @JsonKey(name: 'DishName')
  String? get dishName;
  @JsonKey(name: 'QuantityRequired')
  String? get quantityRequired;
  @JsonKey(name: 'Calories', fromJson: _numToDouble)
  double? get calories;
  @JsonKey(name: 'Protein', fromJson: _numToDouble)
  double? get protein;
  @JsonKey(name: 'Carbohydrates', fromJson: _numToDouble)
  double? get carbohydrates;
  @JsonKey(name: 'Fat', fromJson: _numToDouble)
  double? get fats;
  @JsonKey(name: 'Fiber', fromJson: _numToDouble)
  double? get fibre;
  @JsonKey(name: 'Sugar', fromJson: _numToDouble)
  double? get sugar;
  @JsonKey(name: 'Sodium', fromJson: _numToDouble)
  double? get sodium;
  @JsonKey(name: 'Iron', fromJson: _numToDouble)
  double? get iron;
  @JsonKey(name: 'Calcium', fromJson: _numToDouble)
  double? get calcium;
  @JsonKey(fromJson: _stringOrListToStringList)
  List<String>? get type;
  @JsonKey(fromJson: _stringOrListToStringList)
  List<String>? get time;
  @JsonKey(fromJson: _stringOrListToStringList)
  List<String>? get day;
  @JsonKey(fromJson: _anyToString)
  String? get selected;

  /// Create a copy of Nutrition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionCopyWith<Nutrition> get copyWith =>
      _$NutritionCopyWithImpl<Nutrition>(this as Nutrition, _$identity);

  /// Serializes this Nutrition to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Nutrition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutritionId, nutritionId) ||
                other.nutritionId == nutritionId) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.dishName, dishName) ||
                other.dishName == dishName) &&
            (identical(other.quantityRequired, quantityRequired) ||
                other.quantityRequired == quantityRequired) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates) &&
            (identical(other.fats, fats) || other.fats == fats) &&
            (identical(other.fibre, fibre) || other.fibre == fibre) &&
            (identical(other.sugar, sugar) || other.sugar == sugar) &&
            (identical(other.sodium, sodium) || other.sodium == sodium) &&
            (identical(other.iron, iron) || other.iron == iron) &&
            (identical(other.calcium, calcium) || other.calcium == calcium) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.day, day) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        nutritionId,
        localId,
        createdAt,
        dishName,
        quantityRequired,
        calories,
        protein,
        carbohydrates,
        fats,
        fibre,
        sugar,
        sodium,
        iron,
        calcium,
        const DeepCollectionEquality().hash(type),
        const DeepCollectionEquality().hash(time),
        const DeepCollectionEquality().hash(day),
        selected
      ]);

  @override
  String toString() {
    return 'Nutrition(id: $id, nutritionId: $nutritionId, localId: $localId, createdAt: $createdAt, dishName: $dishName, quantityRequired: $quantityRequired, calories: $calories, protein: $protein, carbohydrates: $carbohydrates, fats: $fats, fibre: $fibre, sugar: $sugar, sodium: $sodium, iron: $iron, calcium: $calcium, type: $type, time: $time, day: $day, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class $NutritionCopyWith<$Res> {
  factory $NutritionCopyWith(Nutrition value, $Res Function(Nutrition) _then) =
      _$NutritionCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _anyToString) String? id,
      @JsonKey(fromJson: _anyToString) String? nutritionId,
      @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
      DateTime? createdAt,
      @JsonKey(name: 'DishName') String? dishName,
      @JsonKey(name: 'QuantityRequired') String? quantityRequired,
      @JsonKey(name: 'Calories', fromJson: _numToDouble) double? calories,
      @JsonKey(name: 'Protein', fromJson: _numToDouble) double? protein,
      @JsonKey(name: 'Carbohydrates', fromJson: _numToDouble)
      double? carbohydrates,
      @JsonKey(name: 'Fat', fromJson: _numToDouble) double? fats,
      @JsonKey(name: 'Fiber', fromJson: _numToDouble) double? fibre,
      @JsonKey(name: 'Sugar', fromJson: _numToDouble) double? sugar,
      @JsonKey(name: 'Sodium', fromJson: _numToDouble) double? sodium,
      @JsonKey(name: 'Iron', fromJson: _numToDouble) double? iron,
      @JsonKey(name: 'Calcium', fromJson: _numToDouble) double? calcium,
      @JsonKey(fromJson: _stringOrListToStringList) List<String>? type,
      @JsonKey(fromJson: _stringOrListToStringList) List<String>? time,
      @JsonKey(fromJson: _stringOrListToStringList) List<String>? day,
      @JsonKey(fromJson: _anyToString) String? selected});
}

/// @nodoc
class _$NutritionCopyWithImpl<$Res> implements $NutritionCopyWith<$Res> {
  _$NutritionCopyWithImpl(this._self, this._then);

  final Nutrition _self;
  final $Res Function(Nutrition) _then;

  /// Create a copy of Nutrition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nutritionId = freezed,
    Object? localId = freezed,
    Object? createdAt = freezed,
    Object? dishName = freezed,
    Object? quantityRequired = freezed,
    Object? calories = freezed,
    Object? protein = freezed,
    Object? carbohydrates = freezed,
    Object? fats = freezed,
    Object? fibre = freezed,
    Object? sugar = freezed,
    Object? sodium = freezed,
    Object? iron = freezed,
    Object? calcium = freezed,
    Object? type = freezed,
    Object? time = freezed,
    Object? day = freezed,
    Object? selected = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nutritionId: freezed == nutritionId
          ? _self.nutritionId
          : nutritionId // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dishName: freezed == dishName
          ? _self.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityRequired: freezed == quantityRequired
          ? _self.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as String?,
      calories: freezed == calories
          ? _self.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double?,
      protein: freezed == protein
          ? _self.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double?,
      carbohydrates: freezed == carbohydrates
          ? _self.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as double?,
      fats: freezed == fats
          ? _self.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double?,
      fibre: freezed == fibre
          ? _self.fibre
          : fibre // ignore: cast_nullable_to_non_nullable
              as double?,
      sugar: freezed == sugar
          ? _self.sugar
          : sugar // ignore: cast_nullable_to_non_nullable
              as double?,
      sodium: freezed == sodium
          ? _self.sodium
          : sodium // ignore: cast_nullable_to_non_nullable
              as double?,
      iron: freezed == iron
          ? _self.iron
          : iron // ignore: cast_nullable_to_non_nullable
              as double?,
      calcium: freezed == calcium
          ? _self.calcium
          : calcium // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      day: freezed == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      selected: freezed == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Nutrition].
extension NutritionPatterns on Nutrition {
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
    TResult Function(_Nutrition value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Nutrition() when $default != null:
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
    TResult Function(_Nutrition value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nutrition():
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
    TResult? Function(_Nutrition value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nutrition() when $default != null:
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
            @JsonKey(fromJson: _anyToString) String? id,
            @JsonKey(fromJson: _anyToString) String? nutritionId,
            @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
            DateTime? createdAt,
            @JsonKey(name: 'DishName') String? dishName,
            @JsonKey(name: 'QuantityRequired') String? quantityRequired,
            @JsonKey(name: 'Calories', fromJson: _numToDouble) double? calories,
            @JsonKey(name: 'Protein', fromJson: _numToDouble) double? protein,
            @JsonKey(name: 'Carbohydrates', fromJson: _numToDouble)
            double? carbohydrates,
            @JsonKey(name: 'Fat', fromJson: _numToDouble) double? fats,
            @JsonKey(name: 'Fiber', fromJson: _numToDouble) double? fibre,
            @JsonKey(name: 'Sugar', fromJson: _numToDouble) double? sugar,
            @JsonKey(name: 'Sodium', fromJson: _numToDouble) double? sodium,
            @JsonKey(name: 'Iron', fromJson: _numToDouble) double? iron,
            @JsonKey(name: 'Calcium', fromJson: _numToDouble) double? calcium,
            @JsonKey(fromJson: _stringOrListToStringList) List<String>? type,
            @JsonKey(fromJson: _stringOrListToStringList) List<String>? time,
            @JsonKey(fromJson: _stringOrListToStringList) List<String>? day,
            @JsonKey(fromJson: _anyToString) String? selected)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Nutrition() when $default != null:
        return $default(
            _that.id,
            _that.nutritionId,
            _that.localId,
            _that.createdAt,
            _that.dishName,
            _that.quantityRequired,
            _that.calories,
            _that.protein,
            _that.carbohydrates,
            _that.fats,
            _that.fibre,
            _that.sugar,
            _that.sodium,
            _that.iron,
            _that.calcium,
            _that.type,
            _that.time,
            _that.day,
            _that.selected);
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
            @JsonKey(fromJson: _anyToString) String? id,
            @JsonKey(fromJson: _anyToString) String? nutritionId,
            @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
            DateTime? createdAt,
            @JsonKey(name: 'DishName') String? dishName,
            @JsonKey(name: 'QuantityRequired') String? quantityRequired,
            @JsonKey(name: 'Calories', fromJson: _numToDouble) double? calories,
            @JsonKey(name: 'Protein', fromJson: _numToDouble) double? protein,
            @JsonKey(name: 'Carbohydrates', fromJson: _numToDouble)
            double? carbohydrates,
            @JsonKey(name: 'Fat', fromJson: _numToDouble) double? fats,
            @JsonKey(name: 'Fiber', fromJson: _numToDouble) double? fibre,
            @JsonKey(name: 'Sugar', fromJson: _numToDouble) double? sugar,
            @JsonKey(name: 'Sodium', fromJson: _numToDouble) double? sodium,
            @JsonKey(name: 'Iron', fromJson: _numToDouble) double? iron,
            @JsonKey(name: 'Calcium', fromJson: _numToDouble) double? calcium,
            @JsonKey(fromJson: _stringOrListToStringList) List<String>? type,
            @JsonKey(fromJson: _stringOrListToStringList) List<String>? time,
            @JsonKey(fromJson: _stringOrListToStringList) List<String>? day,
            @JsonKey(fromJson: _anyToString) String? selected)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nutrition():
        return $default(
            _that.id,
            _that.nutritionId,
            _that.localId,
            _that.createdAt,
            _that.dishName,
            _that.quantityRequired,
            _that.calories,
            _that.protein,
            _that.carbohydrates,
            _that.fats,
            _that.fibre,
            _that.sugar,
            _that.sodium,
            _that.iron,
            _that.calcium,
            _that.type,
            _that.time,
            _that.day,
            _that.selected);
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
            @JsonKey(fromJson: _anyToString) String? id,
            @JsonKey(fromJson: _anyToString) String? nutritionId,
            @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
            DateTime? createdAt,
            @JsonKey(name: 'DishName') String? dishName,
            @JsonKey(name: 'QuantityRequired') String? quantityRequired,
            @JsonKey(name: 'Calories', fromJson: _numToDouble) double? calories,
            @JsonKey(name: 'Protein', fromJson: _numToDouble) double? protein,
            @JsonKey(name: 'Carbohydrates', fromJson: _numToDouble)
            double? carbohydrates,
            @JsonKey(name: 'Fat', fromJson: _numToDouble) double? fats,
            @JsonKey(name: 'Fiber', fromJson: _numToDouble) double? fibre,
            @JsonKey(name: 'Sugar', fromJson: _numToDouble) double? sugar,
            @JsonKey(name: 'Sodium', fromJson: _numToDouble) double? sodium,
            @JsonKey(name: 'Iron', fromJson: _numToDouble) double? iron,
            @JsonKey(name: 'Calcium', fromJson: _numToDouble) double? calcium,
            @JsonKey(fromJson: _stringOrListToStringList) List<String>? type,
            @JsonKey(fromJson: _stringOrListToStringList) List<String>? time,
            @JsonKey(fromJson: _stringOrListToStringList) List<String>? day,
            @JsonKey(fromJson: _anyToString) String? selected)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nutrition() when $default != null:
        return $default(
            _that.id,
            _that.nutritionId,
            _that.localId,
            _that.createdAt,
            _that.dishName,
            _that.quantityRequired,
            _that.calories,
            _that.protein,
            _that.carbohydrates,
            _that.fats,
            _that.fibre,
            _that.sugar,
            _that.sodium,
            _that.iron,
            _that.calcium,
            _that.type,
            _that.time,
            _that.day,
            _that.selected);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Nutrition implements Nutrition {
  const _Nutrition(
      {@JsonKey(fromJson: _anyToString) this.id,
      @JsonKey(fromJson: _anyToString) this.nutritionId,
      @JsonKey(name: '_id', fromJson: _anyToString) this.localId,
      this.createdAt,
      @JsonKey(name: 'DishName') this.dishName,
      @JsonKey(name: 'QuantityRequired') this.quantityRequired,
      @JsonKey(name: 'Calories', fromJson: _numToDouble) this.calories,
      @JsonKey(name: 'Protein', fromJson: _numToDouble) this.protein,
      @JsonKey(name: 'Carbohydrates', fromJson: _numToDouble)
      this.carbohydrates,
      @JsonKey(name: 'Fat', fromJson: _numToDouble) this.fats,
      @JsonKey(name: 'Fiber', fromJson: _numToDouble) this.fibre,
      @JsonKey(name: 'Sugar', fromJson: _numToDouble) this.sugar,
      @JsonKey(name: 'Sodium', fromJson: _numToDouble) this.sodium,
      @JsonKey(name: 'Iron', fromJson: _numToDouble) this.iron,
      @JsonKey(name: 'Calcium', fromJson: _numToDouble) this.calcium,
      @JsonKey(fromJson: _stringOrListToStringList) final List<String>? type,
      @JsonKey(fromJson: _stringOrListToStringList) final List<String>? time,
      @JsonKey(fromJson: _stringOrListToStringList) final List<String>? day,
      @JsonKey(fromJson: _anyToString) this.selected})
      : _type = type,
        _time = time,
        _day = day;
  factory _Nutrition.fromJson(Map<String, dynamic> json) =>
      _$NutritionFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String? id;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? nutritionId;
  @override
  @JsonKey(name: '_id', fromJson: _anyToString)
  final String? localId;
  @override
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'DishName')
  final String? dishName;
  @override
  @JsonKey(name: 'QuantityRequired')
  final String? quantityRequired;
  @override
  @JsonKey(name: 'Calories', fromJson: _numToDouble)
  final double? calories;
  @override
  @JsonKey(name: 'Protein', fromJson: _numToDouble)
  final double? protein;
  @override
  @JsonKey(name: 'Carbohydrates', fromJson: _numToDouble)
  final double? carbohydrates;
  @override
  @JsonKey(name: 'Fat', fromJson: _numToDouble)
  final double? fats;
  @override
  @JsonKey(name: 'Fiber', fromJson: _numToDouble)
  final double? fibre;
  @override
  @JsonKey(name: 'Sugar', fromJson: _numToDouble)
  final double? sugar;
  @override
  @JsonKey(name: 'Sodium', fromJson: _numToDouble)
  final double? sodium;
  @override
  @JsonKey(name: 'Iron', fromJson: _numToDouble)
  final double? iron;
  @override
  @JsonKey(name: 'Calcium', fromJson: _numToDouble)
  final double? calcium;
  final List<String>? _type;
  @override
  @JsonKey(fromJson: _stringOrListToStringList)
  List<String>? get type {
    final value = _type;
    if (value == null) return null;
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _time;
  @override
  @JsonKey(fromJson: _stringOrListToStringList)
  List<String>? get time {
    final value = _time;
    if (value == null) return null;
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _day;
  @override
  @JsonKey(fromJson: _stringOrListToStringList)
  List<String>? get day {
    final value = _day;
    if (value == null) return null;
    if (_day is EqualUnmodifiableListView) return _day;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(fromJson: _anyToString)
  final String? selected;

  /// Create a copy of Nutrition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionCopyWith<_Nutrition> get copyWith =>
      __$NutritionCopyWithImpl<_Nutrition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutritionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Nutrition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutritionId, nutritionId) ||
                other.nutritionId == nutritionId) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.dishName, dishName) ||
                other.dishName == dishName) &&
            (identical(other.quantityRequired, quantityRequired) ||
                other.quantityRequired == quantityRequired) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates) &&
            (identical(other.fats, fats) || other.fats == fats) &&
            (identical(other.fibre, fibre) || other.fibre == fibre) &&
            (identical(other.sugar, sugar) || other.sugar == sugar) &&
            (identical(other.sodium, sodium) || other.sodium == sodium) &&
            (identical(other.iron, iron) || other.iron == iron) &&
            (identical(other.calcium, calcium) || other.calcium == calcium) &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            const DeepCollectionEquality().equals(other._time, _time) &&
            const DeepCollectionEquality().equals(other._day, _day) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        nutritionId,
        localId,
        createdAt,
        dishName,
        quantityRequired,
        calories,
        protein,
        carbohydrates,
        fats,
        fibre,
        sugar,
        sodium,
        iron,
        calcium,
        const DeepCollectionEquality().hash(_type),
        const DeepCollectionEquality().hash(_time),
        const DeepCollectionEquality().hash(_day),
        selected
      ]);

  @override
  String toString() {
    return 'Nutrition(id: $id, nutritionId: $nutritionId, localId: $localId, createdAt: $createdAt, dishName: $dishName, quantityRequired: $quantityRequired, calories: $calories, protein: $protein, carbohydrates: $carbohydrates, fats: $fats, fibre: $fibre, sugar: $sugar, sodium: $sodium, iron: $iron, calcium: $calcium, type: $type, time: $time, day: $day, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class _$NutritionCopyWith<$Res>
    implements $NutritionCopyWith<$Res> {
  factory _$NutritionCopyWith(
          _Nutrition value, $Res Function(_Nutrition) _then) =
      __$NutritionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _anyToString) String? id,
      @JsonKey(fromJson: _anyToString) String? nutritionId,
      @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
      DateTime? createdAt,
      @JsonKey(name: 'DishName') String? dishName,
      @JsonKey(name: 'QuantityRequired') String? quantityRequired,
      @JsonKey(name: 'Calories', fromJson: _numToDouble) double? calories,
      @JsonKey(name: 'Protein', fromJson: _numToDouble) double? protein,
      @JsonKey(name: 'Carbohydrates', fromJson: _numToDouble)
      double? carbohydrates,
      @JsonKey(name: 'Fat', fromJson: _numToDouble) double? fats,
      @JsonKey(name: 'Fiber', fromJson: _numToDouble) double? fibre,
      @JsonKey(name: 'Sugar', fromJson: _numToDouble) double? sugar,
      @JsonKey(name: 'Sodium', fromJson: _numToDouble) double? sodium,
      @JsonKey(name: 'Iron', fromJson: _numToDouble) double? iron,
      @JsonKey(name: 'Calcium', fromJson: _numToDouble) double? calcium,
      @JsonKey(fromJson: _stringOrListToStringList) List<String>? type,
      @JsonKey(fromJson: _stringOrListToStringList) List<String>? time,
      @JsonKey(fromJson: _stringOrListToStringList) List<String>? day,
      @JsonKey(fromJson: _anyToString) String? selected});
}

/// @nodoc
class __$NutritionCopyWithImpl<$Res> implements _$NutritionCopyWith<$Res> {
  __$NutritionCopyWithImpl(this._self, this._then);

  final _Nutrition _self;
  final $Res Function(_Nutrition) _then;

  /// Create a copy of Nutrition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? nutritionId = freezed,
    Object? localId = freezed,
    Object? createdAt = freezed,
    Object? dishName = freezed,
    Object? quantityRequired = freezed,
    Object? calories = freezed,
    Object? protein = freezed,
    Object? carbohydrates = freezed,
    Object? fats = freezed,
    Object? fibre = freezed,
    Object? sugar = freezed,
    Object? sodium = freezed,
    Object? iron = freezed,
    Object? calcium = freezed,
    Object? type = freezed,
    Object? time = freezed,
    Object? day = freezed,
    Object? selected = freezed,
  }) {
    return _then(_Nutrition(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nutritionId: freezed == nutritionId
          ? _self.nutritionId
          : nutritionId // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dishName: freezed == dishName
          ? _self.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityRequired: freezed == quantityRequired
          ? _self.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as String?,
      calories: freezed == calories
          ? _self.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double?,
      protein: freezed == protein
          ? _self.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double?,
      carbohydrates: freezed == carbohydrates
          ? _self.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as double?,
      fats: freezed == fats
          ? _self.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double?,
      fibre: freezed == fibre
          ? _self.fibre
          : fibre // ignore: cast_nullable_to_non_nullable
              as double?,
      sugar: freezed == sugar
          ? _self.sugar
          : sugar // ignore: cast_nullable_to_non_nullable
              as double?,
      sodium: freezed == sodium
          ? _self.sodium
          : sodium // ignore: cast_nullable_to_non_nullable
              as double?,
      iron: freezed == iron
          ? _self.iron
          : iron // ignore: cast_nullable_to_non_nullable
              as double?,
      calcium: freezed == calcium
          ? _self.calcium
          : calcium // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _self._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      time: freezed == time
          ? _self._time
          : time // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      day: freezed == day
          ? _self._day
          : day // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      selected: freezed == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
