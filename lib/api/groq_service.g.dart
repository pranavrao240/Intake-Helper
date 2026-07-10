// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groq_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroqState _$GroqStateFromJson(Map<String, dynamic> json) => _GroqState(
      groqModel: json['groqModel'] == null
          ? null
          : GroqModel.fromJson(json['groqModel'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GroqStateToJson(_GroqState instance) =>
    <String, dynamic>{
      'groqModel': instance.groqModel,
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
      'message': instance.message,
    };
