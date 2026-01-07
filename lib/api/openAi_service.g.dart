// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openAi_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpenAiState _$OpenAiStateFromJson(Map<String, dynamic> json) => _OpenAiState(
      openAiModel: json['openAiModel'] == null
          ? null
          : ApiModel.fromJson(json['openAiModel'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$OpenAiStateToJson(_OpenAiState instance) =>
    <String, dynamic>{
      'openAiModel': instance.openAiModel,
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
      'message': instance.message,
    };
