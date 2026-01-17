// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionResponse _$NutritionResponseFromJson(Map<String, dynamic> json) =>
    _NutritionResponse(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Nutrition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NutritionResponseToJson(_NutritionResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

_Nutrition _$NutritionFromJson(Map<String, dynamic> json) => _Nutrition(
      id: _anyToString(json['id']),
      nutritionId: _anyToString(json['nutritionId']),
      localId: _anyToString(json['_id']),
      dishName: json['DishName'] as String?,
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
      type: _stringOrListToStringList(json['type']),
      time: _stringOrListToStringList(json['time']),
      day: _stringOrListToStringList(json['day']),
      selected: _anyToString(json['selected']),
    );

Map<String, dynamic> _$NutritionToJson(_Nutrition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nutritionId': instance.nutritionId,
      '_id': instance.localId,
      'DishName': instance.dishName,
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
      'type': instance.type,
      'time': instance.time,
      'day': instance.day,
      'selected': instance.selected,
    };
