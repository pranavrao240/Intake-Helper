// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_meal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedMealModel {
  @JsonKey(name: '_id')
  String get id;
  String get userId;
  NutritionModel get nutritionId;
  String? get customNotes;
  String? get quantity;
  DateTime get savedAt;

  /// Create a copy of SavedMealModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedMealModelCopyWith<SavedMealModel> get copyWith =>
      _$SavedMealModelCopyWithImpl<SavedMealModel>(
          this as SavedMealModel, _$identity);

  /// Serializes this SavedMealModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedMealModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nutritionId, nutritionId) ||
                other.nutritionId == nutritionId) &&
            (identical(other.customNotes, customNotes) ||
                other.customNotes == customNotes) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, nutritionId, customNotes, quantity, savedAt);

  @override
  String toString() {
    return 'SavedMealModel(id: $id, userId: $userId, nutritionId: $nutritionId, customNotes: $customNotes, quantity: $quantity, savedAt: $savedAt)';
  }
}

/// @nodoc
abstract mixin class $SavedMealModelCopyWith<$Res> {
  factory $SavedMealModelCopyWith(
          SavedMealModel value, $Res Function(SavedMealModel) _then) =
      _$SavedMealModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String userId,
      NutritionModel nutritionId,
      String? customNotes,
      String? quantity,
      DateTime savedAt});

  $NutritionModelCopyWith<$Res> get nutritionId;
}

/// @nodoc
class _$SavedMealModelCopyWithImpl<$Res>
    implements $SavedMealModelCopyWith<$Res> {
  _$SavedMealModelCopyWithImpl(this._self, this._then);

  final SavedMealModel _self;
  final $Res Function(SavedMealModel) _then;

  /// Create a copy of SavedMealModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? nutritionId = null,
    Object? customNotes = freezed,
    Object? quantity = freezed,
    Object? savedAt = null,
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
      nutritionId: null == nutritionId
          ? _self.nutritionId
          : nutritionId // ignore: cast_nullable_to_non_nullable
              as NutritionModel,
      customNotes: freezed == customNotes
          ? _self.customNotes
          : customNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      savedAt: null == savedAt
          ? _self.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of SavedMealModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionModelCopyWith<$Res> get nutritionId {
    return $NutritionModelCopyWith<$Res>(_self.nutritionId, (value) {
      return _then(_self.copyWith(nutritionId: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SavedMealModel].
extension SavedMealModelPatterns on SavedMealModel {
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
    TResult Function(_SavedMealModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedMealModel() when $default != null:
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
    TResult Function(_SavedMealModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedMealModel():
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
    TResult? Function(_SavedMealModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedMealModel() when $default != null:
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
            @JsonKey(name: '_id') String id,
            String userId,
            NutritionModel nutritionId,
            String? customNotes,
            String? quantity,
            DateTime savedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedMealModel() when $default != null:
        return $default(_that.id, _that.userId, _that.nutritionId,
            _that.customNotes, _that.quantity, _that.savedAt);
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
            @JsonKey(name: '_id') String id,
            String userId,
            NutritionModel nutritionId,
            String? customNotes,
            String? quantity,
            DateTime savedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedMealModel():
        return $default(_that.id, _that.userId, _that.nutritionId,
            _that.customNotes, _that.quantity, _that.savedAt);
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
            @JsonKey(name: '_id') String id,
            String userId,
            NutritionModel nutritionId,
            String? customNotes,
            String? quantity,
            DateTime savedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedMealModel() when $default != null:
        return $default(_that.id, _that.userId, _that.nutritionId,
            _that.customNotes, _that.quantity, _that.savedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SavedMealModel implements SavedMealModel {
  const _SavedMealModel(
      {@JsonKey(name: '_id') required this.id,
      required this.userId,
      required this.nutritionId,
      this.customNotes,
      this.quantity,
      required this.savedAt});
  factory _SavedMealModel.fromJson(Map<String, dynamic> json) =>
      _$SavedMealModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String userId;
  @override
  final NutritionModel nutritionId;
  @override
  final String? customNotes;
  @override
  final String? quantity;
  @override
  final DateTime savedAt;

  /// Create a copy of SavedMealModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedMealModelCopyWith<_SavedMealModel> get copyWith =>
      __$SavedMealModelCopyWithImpl<_SavedMealModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedMealModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedMealModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nutritionId, nutritionId) ||
                other.nutritionId == nutritionId) &&
            (identical(other.customNotes, customNotes) ||
                other.customNotes == customNotes) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, nutritionId, customNotes, quantity, savedAt);

  @override
  String toString() {
    return 'SavedMealModel(id: $id, userId: $userId, nutritionId: $nutritionId, customNotes: $customNotes, quantity: $quantity, savedAt: $savedAt)';
  }
}

/// @nodoc
abstract mixin class _$SavedMealModelCopyWith<$Res>
    implements $SavedMealModelCopyWith<$Res> {
  factory _$SavedMealModelCopyWith(
          _SavedMealModel value, $Res Function(_SavedMealModel) _then) =
      __$SavedMealModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String userId,
      NutritionModel nutritionId,
      String? customNotes,
      String? quantity,
      DateTime savedAt});

  @override
  $NutritionModelCopyWith<$Res> get nutritionId;
}

/// @nodoc
class __$SavedMealModelCopyWithImpl<$Res>
    implements _$SavedMealModelCopyWith<$Res> {
  __$SavedMealModelCopyWithImpl(this._self, this._then);

  final _SavedMealModel _self;
  final $Res Function(_SavedMealModel) _then;

  /// Create a copy of SavedMealModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? nutritionId = null,
    Object? customNotes = freezed,
    Object? quantity = freezed,
    Object? savedAt = null,
  }) {
    return _then(_SavedMealModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      nutritionId: null == nutritionId
          ? _self.nutritionId
          : nutritionId // ignore: cast_nullable_to_non_nullable
              as NutritionModel,
      customNotes: freezed == customNotes
          ? _self.customNotes
          : customNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      savedAt: null == savedAt
          ? _self.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of SavedMealModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionModelCopyWith<$Res> get nutritionId {
    return $NutritionModelCopyWith<$Res>(_self.nutritionId, (value) {
      return _then(_self.copyWith(nutritionId: value));
    });
  }
}

/// @nodoc
mixin _$NutritionModel {
  @JsonKey(name: '_id')
  String get id;
  String get selected;
  String get dishName;
  String get dishImage;
  int get calories;
  int get protein;
  int get fats;
  int get carbohydrates;
  int get sodium;
  int get calcium;
  double get iron;
  String get quantityRequired;
  String get type;
  String get time;
  List<dynamic> get day;

  /// Create a copy of NutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionModelCopyWith<NutritionModel> get copyWith =>
      _$NutritionModelCopyWithImpl<NutritionModel>(
          this as NutritionModel, _$identity);

  /// Serializes this NutritionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.dishName, dishName) ||
                other.dishName == dishName) &&
            (identical(other.dishImage, dishImage) ||
                other.dishImage == dishImage) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.fats, fats) || other.fats == fats) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates) &&
            (identical(other.sodium, sodium) || other.sodium == sodium) &&
            (identical(other.calcium, calcium) || other.calcium == calcium) &&
            (identical(other.iron, iron) || other.iron == iron) &&
            (identical(other.quantityRequired, quantityRequired) ||
                other.quantityRequired == quantityRequired) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other.day, day));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      selected,
      dishName,
      dishImage,
      calories,
      protein,
      fats,
      carbohydrates,
      sodium,
      calcium,
      iron,
      quantityRequired,
      type,
      time,
      const DeepCollectionEquality().hash(day));

  @override
  String toString() {
    return 'NutritionModel(id: $id, selected: $selected, dishName: $dishName, dishImage: $dishImage, calories: $calories, protein: $protein, fats: $fats, carbohydrates: $carbohydrates, sodium: $sodium, calcium: $calcium, iron: $iron, quantityRequired: $quantityRequired, type: $type, time: $time, day: $day)';
  }
}

/// @nodoc
abstract mixin class $NutritionModelCopyWith<$Res> {
  factory $NutritionModelCopyWith(
          NutritionModel value, $Res Function(NutritionModel) _then) =
      _$NutritionModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String selected,
      String dishName,
      String dishImage,
      int calories,
      int protein,
      int fats,
      int carbohydrates,
      int sodium,
      int calcium,
      double iron,
      String quantityRequired,
      String type,
      String time,
      List<dynamic> day});
}

/// @nodoc
class _$NutritionModelCopyWithImpl<$Res>
    implements $NutritionModelCopyWith<$Res> {
  _$NutritionModelCopyWithImpl(this._self, this._then);

  final NutritionModel _self;
  final $Res Function(NutritionModel) _then;

  /// Create a copy of NutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? selected = null,
    Object? dishName = null,
    Object? dishImage = null,
    Object? calories = null,
    Object? protein = null,
    Object? fats = null,
    Object? carbohydrates = null,
    Object? sodium = null,
    Object? calcium = null,
    Object? iron = null,
    Object? quantityRequired = null,
    Object? type = null,
    Object? time = null,
    Object? day = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String,
      dishName: null == dishName
          ? _self.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String,
      dishImage: null == dishImage
          ? _self.dishImage
          : dishImage // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _self.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      protein: null == protein
          ? _self.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as int,
      fats: null == fats
          ? _self.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as int,
      carbohydrates: null == carbohydrates
          ? _self.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as int,
      sodium: null == sodium
          ? _self.sodium
          : sodium // ignore: cast_nullable_to_non_nullable
              as int,
      calcium: null == calcium
          ? _self.calcium
          : calcium // ignore: cast_nullable_to_non_nullable
              as int,
      iron: null == iron
          ? _self.iron
          : iron // ignore: cast_nullable_to_non_nullable
              as double,
      quantityRequired: null == quantityRequired
          ? _self.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// Adds pattern-matching-related methods to [NutritionModel].
extension NutritionModelPatterns on NutritionModel {
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
    TResult Function(_NutritionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NutritionModel() when $default != null:
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
    TResult Function(_NutritionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NutritionModel():
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
    TResult? Function(_NutritionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NutritionModel() when $default != null:
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
            @JsonKey(name: '_id') String id,
            String selected,
            String dishName,
            String dishImage,
            int calories,
            int protein,
            int fats,
            int carbohydrates,
            int sodium,
            int calcium,
            double iron,
            String quantityRequired,
            String type,
            String time,
            List<dynamic> day)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NutritionModel() when $default != null:
        return $default(
            _that.id,
            _that.selected,
            _that.dishName,
            _that.dishImage,
            _that.calories,
            _that.protein,
            _that.fats,
            _that.carbohydrates,
            _that.sodium,
            _that.calcium,
            _that.iron,
            _that.quantityRequired,
            _that.type,
            _that.time,
            _that.day);
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
            @JsonKey(name: '_id') String id,
            String selected,
            String dishName,
            String dishImage,
            int calories,
            int protein,
            int fats,
            int carbohydrates,
            int sodium,
            int calcium,
            double iron,
            String quantityRequired,
            String type,
            String time,
            List<dynamic> day)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NutritionModel():
        return $default(
            _that.id,
            _that.selected,
            _that.dishName,
            _that.dishImage,
            _that.calories,
            _that.protein,
            _that.fats,
            _that.carbohydrates,
            _that.sodium,
            _that.calcium,
            _that.iron,
            _that.quantityRequired,
            _that.type,
            _that.time,
            _that.day);
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
            @JsonKey(name: '_id') String id,
            String selected,
            String dishName,
            String dishImage,
            int calories,
            int protein,
            int fats,
            int carbohydrates,
            int sodium,
            int calcium,
            double iron,
            String quantityRequired,
            String type,
            String time,
            List<dynamic> day)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NutritionModel() when $default != null:
        return $default(
            _that.id,
            _that.selected,
            _that.dishName,
            _that.dishImage,
            _that.calories,
            _that.protein,
            _that.fats,
            _that.carbohydrates,
            _that.sodium,
            _that.calcium,
            _that.iron,
            _that.quantityRequired,
            _that.type,
            _that.time,
            _that.day);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NutritionModel implements NutritionModel {
  const _NutritionModel(
      {@JsonKey(name: '_id') required this.id,
      required this.selected,
      required this.dishName,
      required this.dishImage,
      required this.calories,
      required this.protein,
      required this.fats,
      required this.carbohydrates,
      required this.sodium,
      required this.calcium,
      required this.iron,
      required this.quantityRequired,
      required this.type,
      required this.time,
      required final List<dynamic> day})
      : _day = day;
  factory _NutritionModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String selected;
  @override
  final String dishName;
  @override
  final String dishImage;
  @override
  final int calories;
  @override
  final int protein;
  @override
  final int fats;
  @override
  final int carbohydrates;
  @override
  final int sodium;
  @override
  final int calcium;
  @override
  final double iron;
  @override
  final String quantityRequired;
  @override
  final String type;
  @override
  final String time;
  final List<dynamic> _day;
  @override
  List<dynamic> get day {
    if (_day is EqualUnmodifiableListView) return _day;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_day);
  }

  /// Create a copy of NutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionModelCopyWith<_NutritionModel> get copyWith =>
      __$NutritionModelCopyWithImpl<_NutritionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutritionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.dishName, dishName) ||
                other.dishName == dishName) &&
            (identical(other.dishImage, dishImage) ||
                other.dishImage == dishImage) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.fats, fats) || other.fats == fats) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates) &&
            (identical(other.sodium, sodium) || other.sodium == sodium) &&
            (identical(other.calcium, calcium) || other.calcium == calcium) &&
            (identical(other.iron, iron) || other.iron == iron) &&
            (identical(other.quantityRequired, quantityRequired) ||
                other.quantityRequired == quantityRequired) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other._day, _day));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      selected,
      dishName,
      dishImage,
      calories,
      protein,
      fats,
      carbohydrates,
      sodium,
      calcium,
      iron,
      quantityRequired,
      type,
      time,
      const DeepCollectionEquality().hash(_day));

  @override
  String toString() {
    return 'NutritionModel(id: $id, selected: $selected, dishName: $dishName, dishImage: $dishImage, calories: $calories, protein: $protein, fats: $fats, carbohydrates: $carbohydrates, sodium: $sodium, calcium: $calcium, iron: $iron, quantityRequired: $quantityRequired, type: $type, time: $time, day: $day)';
  }
}

/// @nodoc
abstract mixin class _$NutritionModelCopyWith<$Res>
    implements $NutritionModelCopyWith<$Res> {
  factory _$NutritionModelCopyWith(
          _NutritionModel value, $Res Function(_NutritionModel) _then) =
      __$NutritionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String selected,
      String dishName,
      String dishImage,
      int calories,
      int protein,
      int fats,
      int carbohydrates,
      int sodium,
      int calcium,
      double iron,
      String quantityRequired,
      String type,
      String time,
      List<dynamic> day});
}

/// @nodoc
class __$NutritionModelCopyWithImpl<$Res>
    implements _$NutritionModelCopyWith<$Res> {
  __$NutritionModelCopyWithImpl(this._self, this._then);

  final _NutritionModel _self;
  final $Res Function(_NutritionModel) _then;

  /// Create a copy of NutritionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? selected = null,
    Object? dishName = null,
    Object? dishImage = null,
    Object? calories = null,
    Object? protein = null,
    Object? fats = null,
    Object? carbohydrates = null,
    Object? sodium = null,
    Object? calcium = null,
    Object? iron = null,
    Object? quantityRequired = null,
    Object? type = null,
    Object? time = null,
    Object? day = null,
  }) {
    return _then(_NutritionModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String,
      dishName: null == dishName
          ? _self.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String,
      dishImage: null == dishImage
          ? _self.dishImage
          : dishImage // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _self.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      protein: null == protein
          ? _self.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as int,
      fats: null == fats
          ? _self.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as int,
      carbohydrates: null == carbohydrates
          ? _self.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as int,
      sodium: null == sodium
          ? _self.sodium
          : sodium // ignore: cast_nullable_to_non_nullable
              as int,
      calcium: null == calcium
          ? _self.calcium
          : calcium // ignore: cast_nullable_to_non_nullable
              as int,
      iron: null == iron
          ? _self.iron
          : iron // ignore: cast_nullable_to_non_nullable
              as double,
      quantityRequired: null == quantityRequired
          ? _self.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _self._day
          : day // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
mixin _$PaginationModel {
  int get currentPage;
  int get totalPages;
  int get totalItems;
  int get itemsPerPage;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<PaginationModel> get copyWith =>
      _$PaginationModelCopyWithImpl<PaginationModel>(
          this as PaginationModel, _$identity);

  /// Serializes this PaginationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationModel &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, totalPages, totalItems, itemsPerPage);

  @override
  String toString() {
    return 'PaginationModel(currentPage: $currentPage, totalPages: $totalPages, totalItems: $totalItems, itemsPerPage: $itemsPerPage)';
  }
}

/// @nodoc
abstract mixin class $PaginationModelCopyWith<$Res> {
  factory $PaginationModelCopyWith(
          PaginationModel value, $Res Function(PaginationModel) _then) =
      _$PaginationModelCopyWithImpl;
  @useResult
  $Res call(
      {int currentPage, int totalPages, int totalItems, int itemsPerPage});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<$Res>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._self, this._then);

  final PaginationModel _self;
  final $Res Function(PaginationModel) _then;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalItems = null,
    Object? itemsPerPage = null,
  }) {
    return _then(_self.copyWith(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _self.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaginationModel].
extension PaginationModelPatterns on PaginationModel {
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
    TResult Function(_PaginationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginationModel() when $default != null:
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
    TResult Function(_PaginationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationModel():
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
    TResult? Function(_PaginationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationModel() when $default != null:
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
            int currentPage, int totalPages, int totalItems, int itemsPerPage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginationModel() when $default != null:
        return $default(_that.currentPage, _that.totalPages, _that.totalItems,
            _that.itemsPerPage);
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
            int currentPage, int totalPages, int totalItems, int itemsPerPage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationModel():
        return $default(_that.currentPage, _that.totalPages, _that.totalItems,
            _that.itemsPerPage);
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
            int currentPage, int totalPages, int totalItems, int itemsPerPage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationModel() when $default != null:
        return $default(_that.currentPage, _that.totalPages, _that.totalItems,
            _that.itemsPerPage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaginationModel implements PaginationModel {
  const _PaginationModel(
      {required this.currentPage,
      required this.totalPages,
      required this.totalItems,
      required this.itemsPerPage});
  factory _PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final int totalItems;
  @override
  final int itemsPerPage;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginationModelCopyWith<_PaginationModel> get copyWith =>
      __$PaginationModelCopyWithImpl<_PaginationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaginationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationModel &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, totalPages, totalItems, itemsPerPage);

  @override
  String toString() {
    return 'PaginationModel(currentPage: $currentPage, totalPages: $totalPages, totalItems: $totalItems, itemsPerPage: $itemsPerPage)';
  }
}

/// @nodoc
abstract mixin class _$PaginationModelCopyWith<$Res>
    implements $PaginationModelCopyWith<$Res> {
  factory _$PaginationModelCopyWith(
          _PaginationModel value, $Res Function(_PaginationModel) _then) =
      __$PaginationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int currentPage, int totalPages, int totalItems, int itemsPerPage});
}

/// @nodoc
class __$PaginationModelCopyWithImpl<$Res>
    implements _$PaginationModelCopyWith<$Res> {
  __$PaginationModelCopyWithImpl(this._self, this._then);

  final _PaginationModel _self;
  final $Res Function(_PaginationModel) _then;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalItems = null,
    Object? itemsPerPage = null,
  }) {
    return _then(_PaginationModel(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _self.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
