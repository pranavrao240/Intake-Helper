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
      id: json['_id'] as String?,
      localId: json['id'] as String?,
      nutritionId: _dynamicToString(json['nutritionId']),
      dishName: json['DishName'] as String?,
      calories: (json['Calories'] as num?)?.toDouble(),
      protein: (json['Protein'] as num?)?.toDouble(),
      carbohydrates: (json['Carbohydrates'] as num?)?.toDouble(),
      fats: (json['Fats'] as num?)?.toDouble(),
      sodium: (json['Sodium'] as num?)?.toDouble(),
      iron: (json['Iron'] as num?)?.toDouble(),
      calcium: (json['Calcium'] as num?)?.toDouble(),
      freeSugar: (json['FreeSugar'] as num?)?.toDouble(),
      fibre: (json['Fibre'] as num?)?.toDouble(),
      sugar: (json['Sugar'] as num?)?.toDouble(),
      type: _dynamicToStringList(json['type']),
      day: _dynamicToStringList(json['day']),
      time: _dynamicToStringList(json['time']),
      selected: json['selected'] as String?,
    );

Map<String, dynamic> _$NutritionToJson(_Nutrition instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'id': instance.localId,
      'nutritionId': instance.nutritionId,
      'DishName': instance.dishName,
      'Calories': instance.calories,
      'Protein': instance.protein,
      'Carbohydrates': instance.carbohydrates,
      'Fats': instance.fats,
      'Sodium': instance.sodium,
      'Iron': instance.iron,
      'Calcium': instance.calcium,
      'FreeSugar': instance.freeSugar,
      'Fibre': instance.fibre,
      'Sugar': instance.sugar,
      'type': instance.type,
      'day': instance.day,
      'time': instance.time,
      'selected': instance.selected,
    };
