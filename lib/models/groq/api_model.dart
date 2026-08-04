import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_model.freezed.dart';
part 'api_model.g.dart';

@freezed
abstract class GroqModel with _$GroqModel {
  const factory GroqModel({
    required String id,
    required String object,
    required String status,
    @JsonKey(name: 'created_at') required int createdAt,
    required List<GroqOutput> output,
    @JsonKey(name: 'previous_response_id') String? previousResponseId,
    required String model,
    required GroqReasoning reasoning,
    @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
    required GroqText text,
    required List<dynamic> tools,
    @JsonKey(name: 'tool_choice') required String toolChoice,
    required String truncation,
    required Map<String, dynamic> metadata,
    dynamic groq,
    required double temperature,
    @JsonKey(name: 'top_p') required double topP,
    dynamic user,
    @JsonKey(name: 'service_tier') required String serviceTier,
    required bool background,
    dynamic error,
    @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
    required GroqUsage usage,
    @JsonKey(name: 'parallel_tool_calls') required bool parallelToolCalls,
    required bool store,
    @JsonKey(name: 'top_logprobs') dynamic topLogprobs,
    @JsonKey(name: 'max_tool_calls') dynamic maxToolCalls,
  }) = _GroqModel;

  factory GroqModel.fromJson(Map<String, dynamic> json) =>
      _$GroqModelFromJson(json);
}

@freezed
abstract class GroqOutput with _$GroqOutput {
  const factory GroqOutput({
    required String type,
    required String id,
    required String status,
    required List<GroqContent> content,
    String? role,
    List<dynamic>? summary,
  }) = _GroqOutput;

  factory GroqOutput.fromJson(Map<String, dynamic> json) =>
      _$GroqOutputFromJson(json);
}

@freezed
abstract class GroqContent with _$GroqContent {
  const factory GroqContent({
    required String type,
    String? text,
    List<dynamic>? annotations,
    dynamic logprobs,
  }) = _GroqContent;

  factory GroqContent.fromJson(Map<String, dynamic> json) =>
      _$GroqContentFromJson(json);
}

@freezed
abstract class GroqReasoning with _$GroqReasoning {
  const factory GroqReasoning({
    dynamic effort,
    List<dynamic>? summary,
  }) = _GroqReasoning;

  factory GroqReasoning.fromJson(Map<String, dynamic> json) =>
      _$GroqReasoningFromJson(json);
}

@freezed
abstract class GroqText with _$GroqText {
  const factory GroqText({
    required GroqFormat format,
  }) = _GroqText;

  factory GroqText.fromJson(Map<String, dynamic> json) =>
      _$GroqTextFromJson(json);
}

@freezed
abstract class GroqFormat with _$GroqFormat {
  const factory GroqFormat({
    required String type,
  }) = _GroqFormat;

  factory GroqFormat.fromJson(Map<String, dynamic> json) =>
      _$GroqFormatFromJson(json);
}

@freezed
abstract class GroqUsage with _$GroqUsage {
  const factory GroqUsage({
    @JsonKey(name: 'input_tokens') required int inputTokens,
    @JsonKey(name: 'input_tokens_details')
    required GroqInputTokensDetails inputTokensDetails,
    @JsonKey(name: 'output_tokens') required int outputTokens,
    @JsonKey(name: 'output_tokens_details')
    required GroqOutputTokensDetails outputTokensDetails,
    @JsonKey(name: 'total_tokens') required int totalTokens,
  }) = _GroqUsage;

  factory GroqUsage.fromJson(Map<String, dynamic> json) =>
      _$GroqUsageFromJson(json);
}

@freezed
abstract class GroqInputTokensDetails with _$GroqInputTokensDetails {
  const factory GroqInputTokensDetails({
    @JsonKey(name: 'cached_tokens') required int cachedTokens,
  }) = _GroqInputTokensDetails;

  factory GroqInputTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$GroqInputTokensDetailsFromJson(json);
}

@freezed
abstract class GroqOutputTokensDetails with _$GroqOutputTokensDetails {
  const factory GroqOutputTokensDetails({
    @JsonKey(name: 'reasoning_tokens') required int reasoningTokens,
  }) = _GroqOutputTokensDetails;

  factory GroqOutputTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$GroqOutputTokensDetailsFromJson(json);
}

extension GroqModelExtension on GroqModel {
  String get assistantMessage {
    for (final outputItem in output) {
      if (outputItem.type == 'message') {
        for (final content in outputItem.content) {
          if (content.type == 'output_text' || content.type == 'text') {
            final text = content.text?.trim();
            if (text != null && text.isNotEmpty) {
              return text;
            }
          }
        }
      }
    }

    return '';
  }
}
