// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_suggestion_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealSuggestionHistoryModel _$MealSuggestionHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _MealSuggestionHistoryModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      prompt: json['prompt'] as String,
      response: json['response'],
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$MealSuggestionHistoryModelToJson(
        _MealSuggestionHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'prompt': instance.prompt,
      'response': instance.response,
      'created_at': instance.createdAt.toIso8601String(),
    };
