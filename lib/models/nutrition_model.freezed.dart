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
  String? get id;
  String? get localId;
  String? get nutritionId;
  String? get dishName;
  double? get calories;
  double? get protein;
  double? get carbohydrates;
  double? get fats;
  double? get sodium;
  double? get iron;
  double? get calcium;
  double? get freeSugar;
  double? get fibre;
  double? get sugar;
  List<String>? get type;
  List<String>? get day; // ✅ Corrected
  List<String>? get time;
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
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.nutritionId, nutritionId) ||
                other.nutritionId == nutritionId) &&
            (identical(other.dishName, dishName) ||
                other.dishName == dishName) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates) &&
            (identical(other.fats, fats) || other.fats == fats) &&
            (identical(other.sodium, sodium) || other.sodium == sodium) &&
            (identical(other.iron, iron) || other.iron == iron) &&
            (identical(other.calcium, calcium) || other.calcium == calcium) &&
            (identical(other.freeSugar, freeSugar) ||
                other.freeSugar == freeSugar) &&
            (identical(other.fibre, fibre) || other.fibre == fibre) &&
            (identical(other.sugar, sugar) || other.sugar == sugar) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      localId,
      nutritionId,
      dishName,
      calories,
      protein,
      carbohydrates,
      fats,
      sodium,
      iron,
      calcium,
      freeSugar,
      fibre,
      sugar,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(time),
      selected);

  @override
  String toString() {
    return 'Nutrition(id: $id, localId: $localId, nutritionId: $nutritionId, dishName: $dishName, calories: $calories, protein: $protein, carbohydrates: $carbohydrates, fats: $fats, sodium: $sodium, iron: $iron, calcium: $calcium, freeSugar: $freeSugar, fibre: $fibre, sugar: $sugar, type: $type, day: $day, time: $time, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class $NutritionCopyWith<$Res> {
  factory $NutritionCopyWith(Nutrition value, $Res Function(Nutrition) _then) =
      _$NutritionCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? localId,
      String? nutritionId,
      String? dishName,
      double? calories,
      double? protein,
      double? carbohydrates,
      double? fats,
      double? sodium,
      double? iron,
      double? calcium,
      double? freeSugar,
      double? fibre,
      double? sugar,
      List<String>? type,
      List<String>? day,
      List<String>? time,
      String? selected});
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
    Object? localId = freezed,
    Object? nutritionId = freezed,
    Object? dishName = freezed,
    Object? calories = freezed,
    Object? protein = freezed,
    Object? carbohydrates = freezed,
    Object? fats = freezed,
    Object? sodium = freezed,
    Object? iron = freezed,
    Object? calcium = freezed,
    Object? freeSugar = freezed,
    Object? fibre = freezed,
    Object? sugar = freezed,
    Object? type = freezed,
    Object? day = freezed,
    Object? time = freezed,
    Object? selected = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      nutritionId: freezed == nutritionId
          ? _self.nutritionId
          : nutritionId // ignore: cast_nullable_to_non_nullable
              as String?,
      dishName: freezed == dishName
          ? _self.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
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
      freeSugar: freezed == freeSugar
          ? _self.freeSugar
          : freeSugar // ignore: cast_nullable_to_non_nullable
              as double?,
      fibre: freezed == fibre
          ? _self.fibre
          : fibre // ignore: cast_nullable_to_non_nullable
              as double?,
      sugar: freezed == sugar
          ? _self.sugar
          : sugar // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      day: freezed == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
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
            String? id,
            String? localId,
            String? nutritionId,
            String? dishName,
            double? calories,
            double? protein,
            double? carbohydrates,
            double? fats,
            double? sodium,
            double? iron,
            double? calcium,
            double? freeSugar,
            double? fibre,
            double? sugar,
            List<String>? type,
            List<String>? day,
            List<String>? time,
            String? selected)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Nutrition() when $default != null:
        return $default(
            _that.id,
            _that.localId,
            _that.nutritionId,
            _that.dishName,
            _that.calories,
            _that.protein,
            _that.carbohydrates,
            _that.fats,
            _that.sodium,
            _that.iron,
            _that.calcium,
            _that.freeSugar,
            _that.fibre,
            _that.sugar,
            _that.type,
            _that.day,
            _that.time,
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
            String? id,
            String? localId,
            String? nutritionId,
            String? dishName,
            double? calories,
            double? protein,
            double? carbohydrates,
            double? fats,
            double? sodium,
            double? iron,
            double? calcium,
            double? freeSugar,
            double? fibre,
            double? sugar,
            List<String>? type,
            List<String>? day,
            List<String>? time,
            String? selected)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nutrition():
        return $default(
            _that.id,
            _that.localId,
            _that.nutritionId,
            _that.dishName,
            _that.calories,
            _that.protein,
            _that.carbohydrates,
            _that.fats,
            _that.sodium,
            _that.iron,
            _that.calcium,
            _that.freeSugar,
            _that.fibre,
            _that.sugar,
            _that.type,
            _that.day,
            _that.time,
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
            String? id,
            String? localId,
            String? nutritionId,
            String? dishName,
            double? calories,
            double? protein,
            double? carbohydrates,
            double? fats,
            double? sodium,
            double? iron,
            double? calcium,
            double? freeSugar,
            double? fibre,
            double? sugar,
            List<String>? type,
            List<String>? day,
            List<String>? time,
            String? selected)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nutrition() when $default != null:
        return $default(
            _that.id,
            _that.localId,
            _that.nutritionId,
            _that.dishName,
            _that.calories,
            _that.protein,
            _that.carbohydrates,
            _that.fats,
            _that.sodium,
            _that.iron,
            _that.calcium,
            _that.freeSugar,
            _that.fibre,
            _that.sugar,
            _that.type,
            _that.day,
            _that.time,
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
      {this.id,
      this.localId,
      this.nutritionId,
      this.dishName,
      this.calories,
      this.protein,
      this.carbohydrates,
      this.fats,
      this.sodium,
      this.iron,
      this.calcium,
      this.freeSugar,
      this.fibre,
      this.sugar,
      final List<String>? type,
      final List<String>? day,
      final List<String>? time,
      this.selected})
      : _type = type,
        _day = day,
        _time = time;
  factory _Nutrition.fromJson(Map<String, dynamic> json) =>
      _$NutritionFromJson(json);

  @override
  final String? id;
  @override
  final String? localId;
  @override
  final String? nutritionId;
  @override
  final String? dishName;
  @override
  final double? calories;
  @override
  final double? protein;
  @override
  final double? carbohydrates;
  @override
  final double? fats;
  @override
  final double? sodium;
  @override
  final double? iron;
  @override
  final double? calcium;
  @override
  final double? freeSugar;
  @override
  final double? fibre;
  @override
  final double? sugar;
  final List<String>? _type;
  @override
  List<String>? get type {
    final value = _type;
    if (value == null) return null;
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _day;
  @override
  List<String>? get day {
    final value = _day;
    if (value == null) return null;
    if (_day is EqualUnmodifiableListView) return _day;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// ✅ Corrected
  final List<String>? _time;
// ✅ Corrected
  @override
  List<String>? get time {
    final value = _time;
    if (value == null) return null;
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
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
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.nutritionId, nutritionId) ||
                other.nutritionId == nutritionId) &&
            (identical(other.dishName, dishName) ||
                other.dishName == dishName) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates) &&
            (identical(other.fats, fats) || other.fats == fats) &&
            (identical(other.sodium, sodium) || other.sodium == sodium) &&
            (identical(other.iron, iron) || other.iron == iron) &&
            (identical(other.calcium, calcium) || other.calcium == calcium) &&
            (identical(other.freeSugar, freeSugar) ||
                other.freeSugar == freeSugar) &&
            (identical(other.fibre, fibre) || other.fibre == fibre) &&
            (identical(other.sugar, sugar) || other.sugar == sugar) &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            const DeepCollectionEquality().equals(other._day, _day) &&
            const DeepCollectionEquality().equals(other._time, _time) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      localId,
      nutritionId,
      dishName,
      calories,
      protein,
      carbohydrates,
      fats,
      sodium,
      iron,
      calcium,
      freeSugar,
      fibre,
      sugar,
      const DeepCollectionEquality().hash(_type),
      const DeepCollectionEquality().hash(_day),
      const DeepCollectionEquality().hash(_time),
      selected);

  @override
  String toString() {
    return 'Nutrition(id: $id, localId: $localId, nutritionId: $nutritionId, dishName: $dishName, calories: $calories, protein: $protein, carbohydrates: $carbohydrates, fats: $fats, sodium: $sodium, iron: $iron, calcium: $calcium, freeSugar: $freeSugar, fibre: $fibre, sugar: $sugar, type: $type, day: $day, time: $time, selected: $selected)';
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
      {String? id,
      String? localId,
      String? nutritionId,
      String? dishName,
      double? calories,
      double? protein,
      double? carbohydrates,
      double? fats,
      double? sodium,
      double? iron,
      double? calcium,
      double? freeSugar,
      double? fibre,
      double? sugar,
      List<String>? type,
      List<String>? day,
      List<String>? time,
      String? selected});
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
    Object? localId = freezed,
    Object? nutritionId = freezed,
    Object? dishName = freezed,
    Object? calories = freezed,
    Object? protein = freezed,
    Object? carbohydrates = freezed,
    Object? fats = freezed,
    Object? sodium = freezed,
    Object? iron = freezed,
    Object? calcium = freezed,
    Object? freeSugar = freezed,
    Object? fibre = freezed,
    Object? sugar = freezed,
    Object? type = freezed,
    Object? day = freezed,
    Object? time = freezed,
    Object? selected = freezed,
  }) {
    return _then(_Nutrition(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      nutritionId: freezed == nutritionId
          ? _self.nutritionId
          : nutritionId // ignore: cast_nullable_to_non_nullable
              as String?,
      dishName: freezed == dishName
          ? _self.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
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
      freeSugar: freezed == freeSugar
          ? _self.freeSugar
          : freeSugar // ignore: cast_nullable_to_non_nullable
              as double?,
      fibre: freezed == fibre
          ? _self.fibre
          : fibre // ignore: cast_nullable_to_non_nullable
              as double?,
      sugar: freezed == sugar
          ? _self.sugar
          : sugar // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _self._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      day: freezed == day
          ? _self._day
          : day // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      time: freezed == time
          ? _self._time
          : time // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      selected: freezed == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
