// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_nutrition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedNutritionModel {
  @JsonKey(fromJson: _anyToString)
  String? get id;
  @JsonKey(name: '_id', fromJson: _anyToString)
  String? get localId;
  int? get nutritionId;
  @JsonKey(name: 'DishName')
  String? get dishName;
  @JsonKey(name: 'DishImage')
  String? get dishImage;
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
  @JsonKey(name: 'isSaved')
  bool? get isSaved;
  @JsonKey(fromJson: _anyToString)
  String? get type;
  @JsonKey(fromJson: _anyToString)
  String? get time;
  List<String>? get day;
  @JsonKey(fromJson: _anyToString)
  String? get selected;

  /// Create a copy of SavedNutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedNutritionModelCopyWith<SavedNutritionModel> get copyWith =>
      _$SavedNutritionModelCopyWithImpl<SavedNutritionModel>(
          this as SavedNutritionModel, _$identity);

  /// Serializes this SavedNutritionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedNutritionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.nutritionId, nutritionId) ||
                other.nutritionId == nutritionId) &&
            (identical(other.dishName, dishName) ||
                other.dishName == dishName) &&
            (identical(other.dishImage, dishImage) ||
                other.dishImage == dishImage) &&
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
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other.day, day) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        localId,
        nutritionId,
        dishName,
        dishImage,
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
        isSaved,
        type,
        time,
        const DeepCollectionEquality().hash(day),
        selected
      ]);

  @override
  String toString() {
    return 'SavedNutritionModel(id: $id, localId: $localId, nutritionId: $nutritionId, dishName: $dishName, dishImage: $dishImage, quantityRequired: $quantityRequired, calories: $calories, protein: $protein, carbohydrates: $carbohydrates, fats: $fats, fibre: $fibre, sugar: $sugar, sodium: $sodium, iron: $iron, calcium: $calcium, isSaved: $isSaved, type: $type, time: $time, day: $day, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class $SavedNutritionModelCopyWith<$Res> {
  factory $SavedNutritionModelCopyWith(
          SavedNutritionModel value, $Res Function(SavedNutritionModel) _then) =
      _$SavedNutritionModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _anyToString) String? id,
      @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
      int? nutritionId,
      @JsonKey(name: 'DishName') String? dishName,
      @JsonKey(name: 'DishImage') String? dishImage,
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
      @JsonKey(name: 'isSaved') bool? isSaved,
      @JsonKey(fromJson: _anyToString) String? type,
      @JsonKey(fromJson: _anyToString) String? time,
      List<String>? day,
      @JsonKey(fromJson: _anyToString) String? selected});
}

/// @nodoc
class _$SavedNutritionModelCopyWithImpl<$Res>
    implements $SavedNutritionModelCopyWith<$Res> {
  _$SavedNutritionModelCopyWithImpl(this._self, this._then);

  final SavedNutritionModel _self;
  final $Res Function(SavedNutritionModel) _then;

  /// Create a copy of SavedNutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? localId = freezed,
    Object? nutritionId = freezed,
    Object? dishName = freezed,
    Object? dishImage = freezed,
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
    Object? isSaved = freezed,
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
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      nutritionId: freezed == nutritionId
          ? _self.nutritionId
          : nutritionId // ignore: cast_nullable_to_non_nullable
              as int?,
      dishName: freezed == dishName
          ? _self.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String?,
      dishImage: freezed == dishImage
          ? _self.dishImage
          : dishImage // ignore: cast_nullable_to_non_nullable
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
      isSaved: freezed == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
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

/// Adds pattern-matching-related methods to [SavedNutritionModel].
extension SavedNutritionModelPatterns on SavedNutritionModel {
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
    TResult Function(_SavedNutritionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedNutritionModel() when $default != null:
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
    TResult Function(_SavedNutritionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedNutritionModel():
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
    TResult? Function(_SavedNutritionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedNutritionModel() when $default != null:
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
            @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
            int? nutritionId,
            @JsonKey(name: 'DishName') String? dishName,
            @JsonKey(name: 'DishImage') String? dishImage,
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
            @JsonKey(name: 'isSaved') bool? isSaved,
            @JsonKey(fromJson: _anyToString) String? type,
            @JsonKey(fromJson: _anyToString) String? time,
            List<String>? day,
            @JsonKey(fromJson: _anyToString) String? selected)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedNutritionModel() when $default != null:
        return $default(
            _that.id,
            _that.localId,
            _that.nutritionId,
            _that.dishName,
            _that.dishImage,
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
            _that.isSaved,
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
            @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
            int? nutritionId,
            @JsonKey(name: 'DishName') String? dishName,
            @JsonKey(name: 'DishImage') String? dishImage,
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
            @JsonKey(name: 'isSaved') bool? isSaved,
            @JsonKey(fromJson: _anyToString) String? type,
            @JsonKey(fromJson: _anyToString) String? time,
            List<String>? day,
            @JsonKey(fromJson: _anyToString) String? selected)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedNutritionModel():
        return $default(
            _that.id,
            _that.localId,
            _that.nutritionId,
            _that.dishName,
            _that.dishImage,
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
            _that.isSaved,
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
            @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
            int? nutritionId,
            @JsonKey(name: 'DishName') String? dishName,
            @JsonKey(name: 'DishImage') String? dishImage,
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
            @JsonKey(name: 'isSaved') bool? isSaved,
            @JsonKey(fromJson: _anyToString) String? type,
            @JsonKey(fromJson: _anyToString) String? time,
            List<String>? day,
            @JsonKey(fromJson: _anyToString) String? selected)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedNutritionModel() when $default != null:
        return $default(
            _that.id,
            _that.localId,
            _that.nutritionId,
            _that.dishName,
            _that.dishImage,
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
            _that.isSaved,
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
class _SavedNutritionModel implements SavedNutritionModel {
  const _SavedNutritionModel(
      {@JsonKey(fromJson: _anyToString) this.id,
      @JsonKey(name: '_id', fromJson: _anyToString) this.localId,
      this.nutritionId,
      @JsonKey(name: 'DishName') this.dishName,
      @JsonKey(name: 'DishImage') this.dishImage,
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
      @JsonKey(name: 'isSaved') this.isSaved,
      @JsonKey(fromJson: _anyToString) this.type,
      @JsonKey(fromJson: _anyToString) this.time,
      final List<String>? day,
      @JsonKey(fromJson: _anyToString) this.selected})
      : _day = day;
  factory _SavedNutritionModel.fromJson(Map<String, dynamic> json) =>
      _$SavedNutritionModelFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String? id;
  @override
  @JsonKey(name: '_id', fromJson: _anyToString)
  final String? localId;
  @override
  final int? nutritionId;
  @override
  @JsonKey(name: 'DishName')
  final String? dishName;
  @override
  @JsonKey(name: 'DishImage')
  final String? dishImage;
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
  @override
  @JsonKey(name: 'isSaved')
  final bool? isSaved;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? type;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? time;
  final List<String>? _day;
  @override
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

  /// Create a copy of SavedNutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedNutritionModelCopyWith<_SavedNutritionModel> get copyWith =>
      __$SavedNutritionModelCopyWithImpl<_SavedNutritionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedNutritionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedNutritionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.nutritionId, nutritionId) ||
                other.nutritionId == nutritionId) &&
            (identical(other.dishName, dishName) ||
                other.dishName == dishName) &&
            (identical(other.dishImage, dishImage) ||
                other.dishImage == dishImage) &&
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
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other._day, _day) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        localId,
        nutritionId,
        dishName,
        dishImage,
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
        isSaved,
        type,
        time,
        const DeepCollectionEquality().hash(_day),
        selected
      ]);

  @override
  String toString() {
    return 'SavedNutritionModel(id: $id, localId: $localId, nutritionId: $nutritionId, dishName: $dishName, dishImage: $dishImage, quantityRequired: $quantityRequired, calories: $calories, protein: $protein, carbohydrates: $carbohydrates, fats: $fats, fibre: $fibre, sugar: $sugar, sodium: $sodium, iron: $iron, calcium: $calcium, isSaved: $isSaved, type: $type, time: $time, day: $day, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class _$SavedNutritionModelCopyWith<$Res>
    implements $SavedNutritionModelCopyWith<$Res> {
  factory _$SavedNutritionModelCopyWith(_SavedNutritionModel value,
          $Res Function(_SavedNutritionModel) _then) =
      __$SavedNutritionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _anyToString) String? id,
      @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
      int? nutritionId,
      @JsonKey(name: 'DishName') String? dishName,
      @JsonKey(name: 'DishImage') String? dishImage,
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
      @JsonKey(name: 'isSaved') bool? isSaved,
      @JsonKey(fromJson: _anyToString) String? type,
      @JsonKey(fromJson: _anyToString) String? time,
      List<String>? day,
      @JsonKey(fromJson: _anyToString) String? selected});
}

/// @nodoc
class __$SavedNutritionModelCopyWithImpl<$Res>
    implements _$SavedNutritionModelCopyWith<$Res> {
  __$SavedNutritionModelCopyWithImpl(this._self, this._then);

  final _SavedNutritionModel _self;
  final $Res Function(_SavedNutritionModel) _then;

  /// Create a copy of SavedNutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? localId = freezed,
    Object? nutritionId = freezed,
    Object? dishName = freezed,
    Object? dishImage = freezed,
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
    Object? isSaved = freezed,
    Object? type = freezed,
    Object? time = freezed,
    Object? day = freezed,
    Object? selected = freezed,
  }) {
    return _then(_SavedNutritionModel(
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
              as int?,
      dishName: freezed == dishName
          ? _self.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String?,
      dishImage: freezed == dishImage
          ? _self.dishImage
          : dishImage // ignore: cast_nullable_to_non_nullable
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
      isSaved: freezed == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
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
