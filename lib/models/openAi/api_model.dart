// response_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_model.freezed.dart';
part 'api_model.g.dart';

@freezed
abstract class ApiModel with _$ApiModel {
  const factory ApiModel({
    required String id,
    required String object,
    @JsonKey(name: 'created_at') required int createdAt,
    required String status,
    required bool background,
    required Billing billing,
    @JsonKey(name: 'completed_at') required int completedAt,
    dynamic error,
    @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
    dynamic instructions,
    @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
    @JsonKey(name: 'max_tool_calls') int? maxToolCalls,
    required String model,
    required List<ResponseOutput> output,
    @JsonKey(name: 'parallel_tool_calls') required bool parallelToolCalls,
    @JsonKey(name: 'previous_response_id') String? previousResponseId,
    @JsonKey(name: 'prompt_cache_key') String? promptCacheKey,
    @JsonKey(name: 'prompt_cache_retention') dynamic promptCacheRetention,
    required Reasoning reasoning,
    @JsonKey(name: 'safety_identifier') dynamic safetyIdentifier,
    @JsonKey(name: 'service_tier') required String serviceTier,
    required bool store,
    required double temperature,
    required TextInfo text,
    @JsonKey(name: 'tool_choice') required String toolChoice,
    required List<dynamic> tools,
    @JsonKey(name: 'top_logprobs') required int topLogprobs,
    @JsonKey(name: 'top_p') required double topP,
    required String truncation,
    required Usage usage,
    dynamic user,
    required Map<String, dynamic> metadata,
  }) = _ApiModel;

  factory ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);
}

@freezed
abstract class Billing with _$Billing {
  const factory Billing({
    required String payer,
  }) = _Billing;

  factory Billing.fromJson(Map<String, dynamic> json) =>
      _$BillingFromJson(json);
}

@freezed
abstract class ResponseOutput with _$ResponseOutput {
  const factory ResponseOutput({
    required String id,
    required String type,
    required String status,
    required List<ContentItem> content,
    required String role,
  }) = _ResponseOutput;

  factory ResponseOutput.fromJson(Map<String, dynamic> json) =>
      _$ResponseOutputFromJson(json);
}

@freezed
abstract class ContentItem with _$ContentItem {
  const factory ContentItem({
    required String type,
    required List<dynamic> annotations,
    required List<dynamic> logprobs,
    required String text,
  }) = _ContentItem;

  factory ContentItem.fromJson(Map<String, dynamic> json) =>
      _$ContentItemFromJson(json);
}

@freezed
abstract class Reasoning with _$Reasoning {
  const factory Reasoning({
    dynamic effort,
    dynamic summary,
  }) = _Reasoning;

  factory Reasoning.fromJson(Map<String, dynamic> json) =>
      _$ReasoningFromJson(json);
}

@freezed
abstract class TextInfo with _$TextInfo {
  const factory TextInfo({
    required Format format,
    required String verbosity,
  }) = _TextInfo;

  factory TextInfo.fromJson(Map<String, dynamic> json) =>
      _$TextInfoFromJson(json);
}

@freezed
abstract class Format with _$Format {
  const factory Format({
    required String type,
  }) = _Format;

  factory Format.fromJson(Map<String, dynamic> json) => _$FormatFromJson(json);
}

@freezed
abstract class Usage with _$Usage {
  const factory Usage({
    @JsonKey(name: 'input_tokens') required int inputTokens,
    @JsonKey(name: 'input_tokens_details')
    required InputTokensDetails inputTokensDetails,
    @JsonKey(name: 'output_tokens') required int outputTokens,
    @JsonKey(name: 'output_tokens_details')
    required OutputTokensDetails outputTokensDetails,
    @JsonKey(name: 'total_tokens') required int totalTokens,
  }) = _Usage;

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
}

@freezed
abstract class InputTokensDetails with _$InputTokensDetails {
  const factory InputTokensDetails({
    @JsonKey(name: 'cached_tokens') required int cachedTokens,
  }) = _InputTokensDetails;

  factory InputTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$InputTokensDetailsFromJson(json);
}

@freezed
abstract class OutputTokensDetails with _$OutputTokensDetails {
  const factory OutputTokensDetails({
    @JsonKey(name: 'reasoning_tokens') required int reasoningTokens,
  }) = _OutputTokensDetails;

  factory OutputTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$OutputTokensDetailsFromJson(json);
}
