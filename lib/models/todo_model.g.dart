// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => _TodoModel(
      userId: json['userId'] as String?,
      mealId: json['mealId'] as String?,
      meals: (json['meals'] as List<dynamic>?)
              ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TodoModelToJson(_TodoModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'mealId': instance.mealId,
      'meals': instance.meals,
    };

_Meal _$MealFromJson(Map<String, dynamic> json) => _Meal(
      id: json['_id'] as String?,
      nutrition: Nutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MealToJson(_Meal instance) => <String, dynamic>{
      '_id': instance.id,
      'nutrition': instance.nutrition,
    };
