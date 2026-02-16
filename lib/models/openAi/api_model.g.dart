// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiModel _$ApiModelFromJson(Map<String, dynamic> json) => _ApiModel(
      id: json['id'] as String,
      object: json['object'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      status: json['status'] as String,
      background: json['background'] as bool,
      billing: Billing.fromJson(json['billing'] as Map<String, dynamic>),
      completedAt: (json['completed_at'] as num).toInt(),
      error: json['error'],
      incompleteDetails: json['incomplete_details'],
      instructions: json['instructions'],
      maxOutputTokens: (json['max_output_tokens'] as num?)?.toInt(),
      maxToolCalls: (json['max_tool_calls'] as num?)?.toInt(),
      model: json['model'] as String,
      output: (json['output'] as List<dynamic>)
          .map((e) => ResponseOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      parallelToolCalls: json['parallel_tool_calls'] as bool,
      previousResponseId: json['previous_response_id'] as String?,
      promptCacheKey: json['prompt_cache_key'] as String?,
      promptCacheRetention: json['prompt_cache_retention'],
      reasoning: Reasoning.fromJson(json['reasoning'] as Map<String, dynamic>),
      safetyIdentifier: json['safety_identifier'],
      serviceTier: json['service_tier'] as String,
      store: json['store'] as bool,
      temperature: (json['temperature'] as num).toDouble(),
      text: TextInfo.fromJson(json['text'] as Map<String, dynamic>),
      toolChoice: json['tool_choice'] as String,
      tools: json['tools'] as List<dynamic>,
      topLogprobs: (json['top_logprobs'] as num).toInt(),
      topP: (json['top_p'] as num).toDouble(),
      truncation: json['truncation'] as String,
      usage: Usage.fromJson(json['usage'] as Map<String, dynamic>),
      user: json['user'],
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ApiModelToJson(_ApiModel instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created_at': instance.createdAt,
      'status': instance.status,
      'background': instance.background,
      'billing': instance.billing,
      'completed_at': instance.completedAt,
      'error': instance.error,
      'incomplete_details': instance.incompleteDetails,
      'instructions': instance.instructions,
      'max_output_tokens': instance.maxOutputTokens,
      'max_tool_calls': instance.maxToolCalls,
      'model': instance.model,
      'output': instance.output,
      'parallel_tool_calls': instance.parallelToolCalls,
      'previous_response_id': instance.previousResponseId,
      'prompt_cache_key': instance.promptCacheKey,
      'prompt_cache_retention': instance.promptCacheRetention,
      'reasoning': instance.reasoning,
      'safety_identifier': instance.safetyIdentifier,
      'service_tier': instance.serviceTier,
      'store': instance.store,
      'temperature': instance.temperature,
      'text': instance.text,
      'tool_choice': instance.toolChoice,
      'tools': instance.tools,
      'top_logprobs': instance.topLogprobs,
      'top_p': instance.topP,
      'truncation': instance.truncation,
      'usage': instance.usage,
      'user': instance.user,
      'metadata': instance.metadata,
    };

_Billing _$BillingFromJson(Map<String, dynamic> json) => _Billing(
      payer: json['payer'] as String,
    );

Map<String, dynamic> _$BillingToJson(_Billing instance) => <String, dynamic>{
      'payer': instance.payer,
    };

_ResponseOutput _$ResponseOutputFromJson(Map<String, dynamic> json) =>
    _ResponseOutput(
      id: json['id'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      content: (json['content'] as List<dynamic>)
          .map((e) => ContentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: json['role'] as String,
    );

Map<String, dynamic> _$ResponseOutputToJson(_ResponseOutput instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'content': instance.content,
      'role': instance.role,
    };

_ContentItem _$ContentItemFromJson(Map<String, dynamic> json) => _ContentItem(
      type: json['type'] as String,
      annotations: json['annotations'] as List<dynamic>,
      logprobs: json['logprobs'] as List<dynamic>,
      text: json['text'] as String,
    );

Map<String, dynamic> _$ContentItemToJson(_ContentItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'annotations': instance.annotations,
      'logprobs': instance.logprobs,
      'text': instance.text,
    };

_Reasoning _$ReasoningFromJson(Map<String, dynamic> json) => _Reasoning(
      effort: json['effort'],
      summary: json['summary'],
    );

Map<String, dynamic> _$ReasoningToJson(_Reasoning instance) =>
    <String, dynamic>{
      'effort': instance.effort,
      'summary': instance.summary,
    };

_TextInfo _$TextInfoFromJson(Map<String, dynamic> json) => _TextInfo(
      format: Format.fromJson(json['format'] as Map<String, dynamic>),
      verbosity: json['verbosity'] as String,
    );

Map<String, dynamic> _$TextInfoToJson(_TextInfo instance) => <String, dynamic>{
      'format': instance.format,
      'verbosity': instance.verbosity,
    };

_Format _$FormatFromJson(Map<String, dynamic> json) => _Format(
      type: json['type'] as String,
    );

Map<String, dynamic> _$FormatToJson(_Format instance) => <String, dynamic>{
      'type': instance.type,
    };

_Usage _$UsageFromJson(Map<String, dynamic> json) => _Usage(
      inputTokens: (json['input_tokens'] as num).toInt(),
      inputTokensDetails: InputTokensDetails.fromJson(
          json['input_tokens_details'] as Map<String, dynamic>),
      outputTokens: (json['output_tokens'] as num).toInt(),
      outputTokensDetails: OutputTokensDetails.fromJson(
          json['output_tokens_details'] as Map<String, dynamic>),
      totalTokens: (json['total_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$UsageToJson(_Usage instance) => <String, dynamic>{
      'input_tokens': instance.inputTokens,
      'input_tokens_details': instance.inputTokensDetails,
      'output_tokens': instance.outputTokens,
      'output_tokens_details': instance.outputTokensDetails,
      'total_tokens': instance.totalTokens,
    };

_InputTokensDetails _$InputTokensDetailsFromJson(Map<String, dynamic> json) =>
    _InputTokensDetails(
      cachedTokens: (json['cached_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$InputTokensDetailsToJson(_InputTokensDetails instance) =>
    <String, dynamic>{
      'cached_tokens': instance.cachedTokens,
    };

_OutputTokensDetails _$OutputTokensDetailsFromJson(Map<String, dynamic> json) =>
    _OutputTokensDetails(
      reasoningTokens: (json['reasoning_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$OutputTokensDetailsToJson(
        _OutputTokensDetails instance) =>
    <String, dynamic>{
      'reasoning_tokens': instance.reasoningTokens,
    };
