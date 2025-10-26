// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  @JsonKey(name: '_id')
  String? get id;
  @JsonKey(name: 'id')
  String? get localId;
  @JsonKey(name: 'nutritionId', fromJson: _dynamicToString)
  String? get nutritionId;
  @JsonKey(name: 'DishName')
  String? get dishName;
  @JsonKey(name: 'Calories')
  double? get calories;
  @JsonKey(name: 'Protein')
  double? get protein;
  @JsonKey(name: 'Carbohydrates')
  double? get carbohydrates;
  @JsonKey(name: 'Fats')
  double? get fats;
  @JsonKey(name: 'Sodium')
  double? get sodium;
  @JsonKey(name: 'Iron')
  double? get iron;
  @JsonKey(name: 'Calcium')
  double? get calcium;
  @JsonKey(name: 'FreeSugar')
  double? get freeSugar;
  @JsonKey(name: 'Fibre')
  double? get fibre;
  @JsonKey(name: 'Sugar')
  double? get sugar;
  @JsonKey(name: 'type', fromJson: _dynamicToStringList)
  List<String>? get type;
  @JsonKey(name: 'day', fromJson: _dynamicToStringList)
  List<String>? get day; // ✅ Corrected
  @JsonKey(name: 'time', fromJson: _dynamicToStringList)
  List<String>? get time;
  @JsonKey(name: 'selected')
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
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'id') String? localId,
      @JsonKey(name: 'nutritionId', fromJson: _dynamicToString)
      String? nutritionId,
      @JsonKey(name: 'DishName') String? dishName,
      @JsonKey(name: 'Calories') double? calories,
      @JsonKey(name: 'Protein') double? protein,
      @JsonKey(name: 'Carbohydrates') double? carbohydrates,
      @JsonKey(name: 'Fats') double? fats,
      @JsonKey(name: 'Sodium') double? sodium,
      @JsonKey(name: 'Iron') double? iron,
      @JsonKey(name: 'Calcium') double? calcium,
      @JsonKey(name: 'FreeSugar') double? freeSugar,
      @JsonKey(name: 'Fibre') double? fibre,
      @JsonKey(name: 'Sugar') double? sugar,
      @JsonKey(name: 'type', fromJson: _dynamicToStringList) List<String>? type,
      @JsonKey(name: 'day', fromJson: _dynamicToStringList) List<String>? day,
      @JsonKey(name: 'time', fromJson: _dynamicToStringList) List<String>? time,
      @JsonKey(name: 'selected') String? selected});
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

/// @nodoc
@JsonSerializable()
class _Nutrition implements Nutrition {
  const _Nutrition(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'id') this.localId,
      @JsonKey(name: 'nutritionId', fromJson: _dynamicToString)
      this.nutritionId,
      @JsonKey(name: 'DishName') this.dishName,
      @JsonKey(name: 'Calories') this.calories,
      @JsonKey(name: 'Protein') this.protein,
      @JsonKey(name: 'Carbohydrates') this.carbohydrates,
      @JsonKey(name: 'Fats') this.fats,
      @JsonKey(name: 'Sodium') this.sodium,
      @JsonKey(name: 'Iron') this.iron,
      @JsonKey(name: 'Calcium') this.calcium,
      @JsonKey(name: 'FreeSugar') this.freeSugar,
      @JsonKey(name: 'Fibre') this.fibre,
      @JsonKey(name: 'Sugar') this.sugar,
      @JsonKey(name: 'type', fromJson: _dynamicToStringList)
      final List<String>? type,
      @JsonKey(name: 'day', fromJson: _dynamicToStringList)
      final List<String>? day,
      @JsonKey(name: 'time', fromJson: _dynamicToStringList)
      final List<String>? time,
      @JsonKey(name: 'selected') this.selected})
      : _type = type,
        _day = day,
        _time = time;
  factory _Nutrition.fromJson(Map<String, dynamic> json) =>
      _$NutritionFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'id')
  final String? localId;
  @override
  @JsonKey(name: 'nutritionId', fromJson: _dynamicToString)
  final String? nutritionId;
  @override
  @JsonKey(name: 'DishName')
  final String? dishName;
  @override
  @JsonKey(name: 'Calories')
  final double? calories;
  @override
  @JsonKey(name: 'Protein')
  final double? protein;
  @override
  @JsonKey(name: 'Carbohydrates')
  final double? carbohydrates;
  @override
  @JsonKey(name: 'Fats')
  final double? fats;
  @override
  @JsonKey(name: 'Sodium')
  final double? sodium;
  @override
  @JsonKey(name: 'Iron')
  final double? iron;
  @override
  @JsonKey(name: 'Calcium')
  final double? calcium;
  @override
  @JsonKey(name: 'FreeSugar')
  final double? freeSugar;
  @override
  @JsonKey(name: 'Fibre')
  final double? fibre;
  @override
  @JsonKey(name: 'Sugar')
  final double? sugar;
  final List<String>? _type;
  @override
  @JsonKey(name: 'type', fromJson: _dynamicToStringList)
  List<String>? get type {
    final value = _type;
    if (value == null) return null;
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _day;
  @override
  @JsonKey(name: 'day', fromJson: _dynamicToStringList)
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
  @JsonKey(name: 'time', fromJson: _dynamicToStringList)
  List<String>? get time {
    final value = _time;
    if (value == null) return null;
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'selected')
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
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'id') String? localId,
      @JsonKey(name: 'nutritionId', fromJson: _dynamicToString)
      String? nutritionId,
      @JsonKey(name: 'DishName') String? dishName,
      @JsonKey(name: 'Calories') double? calories,
      @JsonKey(name: 'Protein') double? protein,
      @JsonKey(name: 'Carbohydrates') double? carbohydrates,
      @JsonKey(name: 'Fats') double? fats,
      @JsonKey(name: 'Sodium') double? sodium,
      @JsonKey(name: 'Iron') double? iron,
      @JsonKey(name: 'Calcium') double? calcium,
      @JsonKey(name: 'FreeSugar') double? freeSugar,
      @JsonKey(name: 'Fibre') double? fibre,
      @JsonKey(name: 'Sugar') double? sugar,
      @JsonKey(name: 'type', fromJson: _dynamicToStringList) List<String>? type,
      @JsonKey(name: 'day', fromJson: _dynamicToStringList) List<String>? day,
      @JsonKey(name: 'time', fromJson: _dynamicToStringList) List<String>? time,
      @JsonKey(name: 'selected') String? selected});
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
