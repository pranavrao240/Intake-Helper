// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Todo _$TodoFromJson(Map<String, dynamic> json) => _Todo(
      id: json['_id'] as String?,
      nutrition: Nutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TodoToJson(_Todo instance) => <String, dynamic>{
      '_id': instance.id,
      'nutrition': instance.nutrition,
    };
