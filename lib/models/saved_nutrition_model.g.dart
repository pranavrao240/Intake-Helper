// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_nutrition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedNutritionModel _$SavedNutritionModelFromJson(Map<String, dynamic> json) =>
    _SavedNutritionModel(
      id: _anyToString(json['id']),
      localId: _anyToString(json['_id']),
      nutritionId: (json['nutritionId'] as num?)?.toInt(),
      dishName: json['DishName'] as String?,
      dishImage: json['DishImage'] as String?,
      quantityRequired: json['QuantityRequired'] as String?,
      calories: _numToDouble(json['Calories']),
      protein: _numToDouble(json['Protein']),
      carbohydrates: _numToDouble(json['Carbohydrates']),
      fats: _numToDouble(json['Fat']),
      fibre: _numToDouble(json['Fiber']),
      sugar: _numToDouble(json['Sugar']),
      sodium: _numToDouble(json['Sodium']),
      iron: _numToDouble(json['Iron']),
      calcium: _numToDouble(json['Calcium']),
      isSaved: json['isSaved'] as bool?,
      type: _anyToString(json['type']),
      time: _anyToString(json['time']),
      day: (json['day'] as List<dynamic>?)?.map((e) => e as String).toList(),
      selected: _anyToString(json['selected']),
    );

Map<String, dynamic> _$SavedNutritionModelToJson(
        _SavedNutritionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      '_id': instance.localId,
      'nutritionId': instance.nutritionId,
      'DishName': instance.dishName,
      'DishImage': instance.dishImage,
      'QuantityRequired': instance.quantityRequired,
      'Calories': instance.calories,
      'Protein': instance.protein,
      'Carbohydrates': instance.carbohydrates,
      'Fat': instance.fats,
      'Fiber': instance.fibre,
      'Sugar': instance.sugar,
      'Sodium': instance.sodium,
      'Iron': instance.iron,
      'Calcium': instance.calcium,
      'isSaved': instance.isSaved,
      'type': instance.type,
      'time': instance.time,
      'day': instance.day,
      'selected': instance.selected,
    };
