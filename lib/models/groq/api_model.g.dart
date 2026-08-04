// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroqModel _$GroqModelFromJson(Map<String, dynamic> json) => _GroqModel(
      id: json['id'] as String,
      object: json['object'] as String,
      status: json['status'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      output: (json['output'] as List<dynamic>)
          .map((e) => GroqOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      previousResponseId: json['previous_response_id'] as String?,
      model: json['model'] as String,
      reasoning:
          GroqReasoning.fromJson(json['reasoning'] as Map<String, dynamic>),
      maxOutputTokens: (json['max_output_tokens'] as num?)?.toInt(),
      text: GroqText.fromJson(json['text'] as Map<String, dynamic>),
      tools: json['tools'] as List<dynamic>,
      toolChoice: json['tool_choice'] as String,
      truncation: json['truncation'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      groq: json['groq'],
      temperature: (json['temperature'] as num).toDouble(),
      topP: (json['top_p'] as num).toDouble(),
      user: json['user'],
      serviceTier: json['service_tier'] as String,
      background: json['background'] as bool,
      error: json['error'],
      incompleteDetails: json['incomplete_details'],
      usage: GroqUsage.fromJson(json['usage'] as Map<String, dynamic>),
      parallelToolCalls: json['parallel_tool_calls'] as bool,
      store: json['store'] as bool,
      topLogprobs: json['top_logprobs'],
      maxToolCalls: json['max_tool_calls'],
    );

Map<String, dynamic> _$GroqModelToJson(_GroqModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'status': instance.status,
      'created_at': instance.createdAt,
      'output': instance.output,
      'previous_response_id': instance.previousResponseId,
      'model': instance.model,
      'reasoning': instance.reasoning,
      'max_output_tokens': instance.maxOutputTokens,
      'text': instance.text,
      'tools': instance.tools,
      'tool_choice': instance.toolChoice,
      'truncation': instance.truncation,
      'metadata': instance.metadata,
      'groq': instance.groq,
      'temperature': instance.temperature,
      'top_p': instance.topP,
      'user': instance.user,
      'service_tier': instance.serviceTier,
      'background': instance.background,
      'error': instance.error,
      'incomplete_details': instance.incompleteDetails,
      'usage': instance.usage,
      'parallel_tool_calls': instance.parallelToolCalls,
      'store': instance.store,
      'top_logprobs': instance.topLogprobs,
      'max_tool_calls': instance.maxToolCalls,
    };

_GroqOutput _$GroqOutputFromJson(Map<String, dynamic> json) => _GroqOutput(
      type: json['type'] as String,
      id: json['id'] as String,
      status: json['status'] as String,
      content: (json['content'] as List<dynamic>)
          .map((e) => GroqContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: json['role'] as String?,
      summary: json['summary'] as List<dynamic>?,
    );

Map<String, dynamic> _$GroqOutputToJson(_GroqOutput instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'status': instance.status,
      'content': instance.content,
      'role': instance.role,
      'summary': instance.summary,
    };

_GroqContent _$GroqContentFromJson(Map<String, dynamic> json) => _GroqContent(
      type: json['type'] as String,
      text: json['text'] as String?,
      annotations: json['annotations'] as List<dynamic>?,
      logprobs: json['logprobs'],
    );

Map<String, dynamic> _$GroqContentToJson(_GroqContent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'annotations': instance.annotations,
      'logprobs': instance.logprobs,
    };

_GroqReasoning _$GroqReasoningFromJson(Map<String, dynamic> json) =>
    _GroqReasoning(
      effort: json['effort'],
      summary: json['summary'] as List<dynamic>?,
    );

Map<String, dynamic> _$GroqReasoningToJson(_GroqReasoning instance) =>
    <String, dynamic>{
      'effort': instance.effort,
      'summary': instance.summary,
    };

_GroqText _$GroqTextFromJson(Map<String, dynamic> json) => _GroqText(
      format: GroqFormat.fromJson(json['format'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroqTextToJson(_GroqText instance) => <String, dynamic>{
      'format': instance.format,
    };

_GroqFormat _$GroqFormatFromJson(Map<String, dynamic> json) => _GroqFormat(
      type: json['type'] as String,
    );

Map<String, dynamic> _$GroqFormatToJson(_GroqFormat instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

_GroqUsage _$GroqUsageFromJson(Map<String, dynamic> json) => _GroqUsage(
      inputTokens: (json['input_tokens'] as num).toInt(),
      inputTokensDetails: GroqInputTokensDetails.fromJson(
          json['input_tokens_details'] as Map<String, dynamic>),
      outputTokens: (json['output_tokens'] as num).toInt(),
      outputTokensDetails: GroqOutputTokensDetails.fromJson(
          json['output_tokens_details'] as Map<String, dynamic>),
      totalTokens: (json['total_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$GroqUsageToJson(_GroqUsage instance) =>
    <String, dynamic>{
      'input_tokens': instance.inputTokens,
      'input_tokens_details': instance.inputTokensDetails,
      'output_tokens': instance.outputTokens,
      'output_tokens_details': instance.outputTokensDetails,
      'total_tokens': instance.totalTokens,
    };

_GroqInputTokensDetails _$GroqInputTokensDetailsFromJson(
        Map<String, dynamic> json) =>
    _GroqInputTokensDetails(
      cachedTokens: (json['cached_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$GroqInputTokensDetailsToJson(
        _GroqInputTokensDetails instance) =>
    <String, dynamic>{
      'cached_tokens': instance.cachedTokens,
    };

_GroqOutputTokensDetails _$GroqOutputTokensDetailsFromJson(
        Map<String, dynamic> json) =>
    _GroqOutputTokensDetails(
      reasoningTokens: (json['reasoning_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$GroqOutputTokensDetailsToJson(
        _GroqOutputTokensDetails instance) =>
    <String, dynamic>{
      'reasoning_tokens': instance.reasoningTokens,
    };
