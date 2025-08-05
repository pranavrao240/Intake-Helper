// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singlenutrition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SingleNutritionResponse _$SingleNutritionResponseFromJson(
        Map<String, dynamic> json) =>
    _SingleNutritionResponse(
      message: json['message'] as String,
      data: Nutrition.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleNutritionResponseToJson(
        _SingleNutritionResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
