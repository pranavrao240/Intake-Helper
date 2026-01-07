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
      id: json['id'] as String?,
      localId: json['localId'] as String?,
      nutritionId: json['nutritionId'] as String?,
      dishName: json['dishName'] as String?,
      calories: (json['calories'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble(),
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
      fats: (json['fats'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toDouble(),
      iron: (json['iron'] as num?)?.toDouble(),
      calcium: (json['calcium'] as num?)?.toDouble(),
      freeSugar: (json['freeSugar'] as num?)?.toDouble(),
      fibre: (json['fibre'] as num?)?.toDouble(),
      sugar: (json['sugar'] as num?)?.toDouble(),
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
      day: (json['day'] as List<dynamic>?)?.map((e) => e as String).toList(),
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      selected: json['selected'] as String?,
    );

Map<String, dynamic> _$NutritionToJson(_Nutrition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localId': instance.localId,
      'nutritionId': instance.nutritionId,
      'dishName': instance.dishName,
      'calories': instance.calories,
      'protein': instance.protein,
      'carbohydrates': instance.carbohydrates,
      'fats': instance.fats,
      'sodium': instance.sodium,
      'iron': instance.iron,
      'calcium': instance.calcium,
      'freeSugar': instance.freeSugar,
      'fibre': instance.fibre,
      'sugar': instance.sugar,
      'type': instance.type,
      'day': instance.day,
      'time': instance.time,
      'selected': instance.selected,
    };
