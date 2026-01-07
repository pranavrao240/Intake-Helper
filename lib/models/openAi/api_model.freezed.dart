// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiModel {
  String get id;
  String get object;
  @JsonKey(name: 'created_at')
  int get createdAt;
  String get status;
  bool get background;
  Billing get billing;
  @JsonKey(name: 'completed_at')
  int get completedAt;
  dynamic get error;
  @JsonKey(name: 'incomplete_details')
  dynamic get incompleteDetails;
  dynamic get instructions;
  @JsonKey(name: 'max_output_tokens')
  int? get maxOutputTokens;
  @JsonKey(name: 'max_tool_calls')
  int? get maxToolCalls;
  String get model;
  List<ResponseOutput> get output;
  @JsonKey(name: 'parallel_tool_calls')
  bool get parallelToolCalls;
  @JsonKey(name: 'previous_response_id')
  String? get previousResponseId;
  @JsonKey(name: 'prompt_cache_key')
  String? get promptCacheKey;
  @JsonKey(name: 'prompt_cache_retention')
  dynamic get promptCacheRetention;
  Reasoning get reasoning;
  @JsonKey(name: 'safety_identifier')
  dynamic get safetyIdentifier;
  @JsonKey(name: 'service_tier')
  String get serviceTier;
  bool get store;
  double get temperature;
  TextInfo get text;
  @JsonKey(name: 'tool_choice')
  String get toolChoice;
  List<dynamic> get tools;
  @JsonKey(name: 'top_logprobs')
  int get topLogprobs;
  @JsonKey(name: 'top_p')
  double get topP;
  String get truncation;
  Usage get usage;
  dynamic get user;
  Map<String, dynamic> get metadata;

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiModelCopyWith<ApiModel> get copyWith =>
      _$ApiModelCopyWithImpl<ApiModel>(this as ApiModel, _$identity);

  /// Serializes this ApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.billing, billing) || other.billing == billing) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.incompleteDetails, incompleteDetails) &&
            const DeepCollectionEquality()
                .equals(other.instructions, instructions) &&
            (identical(other.maxOutputTokens, maxOutputTokens) ||
                other.maxOutputTokens == maxOutputTokens) &&
            (identical(other.maxToolCalls, maxToolCalls) ||
                other.maxToolCalls == maxToolCalls) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other.output, output) &&
            (identical(other.parallelToolCalls, parallelToolCalls) ||
                other.parallelToolCalls == parallelToolCalls) &&
            (identical(other.previousResponseId, previousResponseId) ||
                other.previousResponseId == previousResponseId) &&
            (identical(other.promptCacheKey, promptCacheKey) ||
                other.promptCacheKey == promptCacheKey) &&
            const DeepCollectionEquality()
                .equals(other.promptCacheRetention, promptCacheRetention) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            const DeepCollectionEquality()
                .equals(other.safetyIdentifier, safetyIdentifier) &&
            (identical(other.serviceTier, serviceTier) ||
                other.serviceTier == serviceTier) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.toolChoice, toolChoice) ||
                other.toolChoice == toolChoice) &&
            const DeepCollectionEquality().equals(other.tools, tools) &&
            (identical(other.topLogprobs, topLogprobs) ||
                other.topLogprobs == topLogprobs) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.truncation, truncation) ||
                other.truncation == truncation) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        object,
        createdAt,
        status,
        background,
        billing,
        completedAt,
        const DeepCollectionEquality().hash(error),
        const DeepCollectionEquality().hash(incompleteDetails),
        const DeepCollectionEquality().hash(instructions),
        maxOutputTokens,
        maxToolCalls,
        model,
        const DeepCollectionEquality().hash(output),
        parallelToolCalls,
        previousResponseId,
        promptCacheKey,
        const DeepCollectionEquality().hash(promptCacheRetention),
        reasoning,
        const DeepCollectionEquality().hash(safetyIdentifier),
        serviceTier,
        store,
        temperature,
        text,
        toolChoice,
        const DeepCollectionEquality().hash(tools),
        topLogprobs,
        topP,
        truncation,
        usage,
        const DeepCollectionEquality().hash(user),
        const DeepCollectionEquality().hash(metadata)
      ]);

  @override
  String toString() {
    return 'ApiModel(id: $id, object: $object, createdAt: $createdAt, status: $status, background: $background, billing: $billing, completedAt: $completedAt, error: $error, incompleteDetails: $incompleteDetails, instructions: $instructions, maxOutputTokens: $maxOutputTokens, maxToolCalls: $maxToolCalls, model: $model, output: $output, parallelToolCalls: $parallelToolCalls, previousResponseId: $previousResponseId, promptCacheKey: $promptCacheKey, promptCacheRetention: $promptCacheRetention, reasoning: $reasoning, safetyIdentifier: $safetyIdentifier, serviceTier: $serviceTier, store: $store, temperature: $temperature, text: $text, toolChoice: $toolChoice, tools: $tools, topLogprobs: $topLogprobs, topP: $topP, truncation: $truncation, usage: $usage, user: $user, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class $ApiModelCopyWith<$Res> {
  factory $ApiModelCopyWith(ApiModel value, $Res Function(ApiModel) _then) =
      _$ApiModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String object,
      @JsonKey(name: 'created_at') int createdAt,
      String status,
      bool background,
      Billing billing,
      @JsonKey(name: 'completed_at') int completedAt,
      dynamic error,
      @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
      dynamic instructions,
      @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
      @JsonKey(name: 'max_tool_calls') int? maxToolCalls,
      String model,
      List<ResponseOutput> output,
      @JsonKey(name: 'parallel_tool_calls') bool parallelToolCalls,
      @JsonKey(name: 'previous_response_id') String? previousResponseId,
      @JsonKey(name: 'prompt_cache_key') String? promptCacheKey,
      @JsonKey(name: 'prompt_cache_retention') dynamic promptCacheRetention,
      Reasoning reasoning,
      @JsonKey(name: 'safety_identifier') dynamic safetyIdentifier,
      @JsonKey(name: 'service_tier') String serviceTier,
      bool store,
      double temperature,
      TextInfo text,
      @JsonKey(name: 'tool_choice') String toolChoice,
      List<dynamic> tools,
      @JsonKey(name: 'top_logprobs') int topLogprobs,
      @JsonKey(name: 'top_p') double topP,
      String truncation,
      Usage usage,
      dynamic user,
      Map<String, dynamic> metadata});

  $BillingCopyWith<$Res> get billing;
  $ReasoningCopyWith<$Res> get reasoning;
  $TextInfoCopyWith<$Res> get text;
  $UsageCopyWith<$Res> get usage;
}

/// @nodoc
class _$ApiModelCopyWithImpl<$Res> implements $ApiModelCopyWith<$Res> {
  _$ApiModelCopyWithImpl(this._self, this._then);

  final ApiModel _self;
  final $Res Function(ApiModel) _then;

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? createdAt = null,
    Object? status = null,
    Object? background = null,
    Object? billing = null,
    Object? completedAt = null,
    Object? error = freezed,
    Object? incompleteDetails = freezed,
    Object? instructions = freezed,
    Object? maxOutputTokens = freezed,
    Object? maxToolCalls = freezed,
    Object? model = null,
    Object? output = null,
    Object? parallelToolCalls = null,
    Object? previousResponseId = freezed,
    Object? promptCacheKey = freezed,
    Object? promptCacheRetention = freezed,
    Object? reasoning = null,
    Object? safetyIdentifier = freezed,
    Object? serviceTier = null,
    Object? store = null,
    Object? temperature = null,
    Object? text = null,
    Object? toolChoice = null,
    Object? tools = null,
    Object? topLogprobs = null,
    Object? topP = null,
    Object? truncation = null,
    Object? usage = null,
    Object? user = freezed,
    Object? metadata = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      background: null == background
          ? _self.background
          : background // ignore: cast_nullable_to_non_nullable
              as bool,
      billing: null == billing
          ? _self.billing
          : billing // ignore: cast_nullable_to_non_nullable
              as Billing,
      completedAt: null == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      incompleteDetails: freezed == incompleteDetails
          ? _self.incompleteDetails
          : incompleteDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxOutputTokens: freezed == maxOutputTokens
          ? _self.maxOutputTokens
          : maxOutputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      maxToolCalls: freezed == maxToolCalls
          ? _self.maxToolCalls
          : maxToolCalls // ignore: cast_nullable_to_non_nullable
              as int?,
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      output: null == output
          ? _self.output
          : output // ignore: cast_nullable_to_non_nullable
              as List<ResponseOutput>,
      parallelToolCalls: null == parallelToolCalls
          ? _self.parallelToolCalls
          : parallelToolCalls // ignore: cast_nullable_to_non_nullable
              as bool,
      previousResponseId: freezed == previousResponseId
          ? _self.previousResponseId
          : previousResponseId // ignore: cast_nullable_to_non_nullable
              as String?,
      promptCacheKey: freezed == promptCacheKey
          ? _self.promptCacheKey
          : promptCacheKey // ignore: cast_nullable_to_non_nullable
              as String?,
      promptCacheRetention: freezed == promptCacheRetention
          ? _self.promptCacheRetention
          : promptCacheRetention // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reasoning: null == reasoning
          ? _self.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as Reasoning,
      safetyIdentifier: freezed == safetyIdentifier
          ? _self.safetyIdentifier
          : safetyIdentifier // ignore: cast_nullable_to_non_nullable
              as dynamic,
      serviceTier: null == serviceTier
          ? _self.serviceTier
          : serviceTier // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _self.store
          : store // ignore: cast_nullable_to_non_nullable
              as bool,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as TextInfo,
      toolChoice: null == toolChoice
          ? _self.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as String,
      tools: null == tools
          ? _self.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      topLogprobs: null == topLogprobs
          ? _self.topLogprobs
          : topLogprobs // ignore: cast_nullable_to_non_nullable
              as int,
      topP: null == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double,
      truncation: null == truncation
          ? _self.truncation
          : truncation // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _self.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BillingCopyWith<$Res> get billing {
    return $BillingCopyWith<$Res>(_self.billing, (value) {
      return _then(_self.copyWith(billing: value));
    });
  }

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReasoningCopyWith<$Res> get reasoning {
    return $ReasoningCopyWith<$Res>(_self.reasoning, (value) {
      return _then(_self.copyWith(reasoning: value));
    });
  }

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextInfoCopyWith<$Res> get text {
    return $TextInfoCopyWith<$Res>(_self.text, (value) {
      return _then(_self.copyWith(text: value));
    });
  }

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsageCopyWith<$Res> get usage {
    return $UsageCopyWith<$Res>(_self.usage, (value) {
      return _then(_self.copyWith(usage: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ApiModel].
extension ApiModelPatterns on ApiModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String object,
            @JsonKey(name: 'created_at') int createdAt,
            String status,
            bool background,
            Billing billing,
            @JsonKey(name: 'completed_at') int completedAt,
            dynamic error,
            @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
            dynamic instructions,
            @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
            @JsonKey(name: 'max_tool_calls') int? maxToolCalls,
            String model,
            List<ResponseOutput> output,
            @JsonKey(name: 'parallel_tool_calls') bool parallelToolCalls,
            @JsonKey(name: 'previous_response_id') String? previousResponseId,
            @JsonKey(name: 'prompt_cache_key') String? promptCacheKey,
            @JsonKey(name: 'prompt_cache_retention')
            dynamic promptCacheRetention,
            Reasoning reasoning,
            @JsonKey(name: 'safety_identifier') dynamic safetyIdentifier,
            @JsonKey(name: 'service_tier') String serviceTier,
            bool store,
            double temperature,
            TextInfo text,
            @JsonKey(name: 'tool_choice') String toolChoice,
            List<dynamic> tools,
            @JsonKey(name: 'top_logprobs') int topLogprobs,
            @JsonKey(name: 'top_p') double topP,
            String truncation,
            Usage usage,
            dynamic user,
            Map<String, dynamic> metadata)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiModel() when $default != null:
        return $default(
            _that.id,
            _that.object,
            _that.createdAt,
            _that.status,
            _that.background,
            _that.billing,
            _that.completedAt,
            _that.error,
            _that.incompleteDetails,
            _that.instructions,
            _that.maxOutputTokens,
            _that.maxToolCalls,
            _that.model,
            _that.output,
            _that.parallelToolCalls,
            _that.previousResponseId,
            _that.promptCacheKey,
            _that.promptCacheRetention,
            _that.reasoning,
            _that.safetyIdentifier,
            _that.serviceTier,
            _that.store,
            _that.temperature,
            _that.text,
            _that.toolChoice,
            _that.tools,
            _that.topLogprobs,
            _that.topP,
            _that.truncation,
            _that.usage,
            _that.user,
            _that.metadata);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String object,
            @JsonKey(name: 'created_at') int createdAt,
            String status,
            bool background,
            Billing billing,
            @JsonKey(name: 'completed_at') int completedAt,
            dynamic error,
            @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
            dynamic instructions,
            @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
            @JsonKey(name: 'max_tool_calls') int? maxToolCalls,
            String model,
            List<ResponseOutput> output,
            @JsonKey(name: 'parallel_tool_calls') bool parallelToolCalls,
            @JsonKey(name: 'previous_response_id') String? previousResponseId,
            @JsonKey(name: 'prompt_cache_key') String? promptCacheKey,
            @JsonKey(name: 'prompt_cache_retention')
            dynamic promptCacheRetention,
            Reasoning reasoning,
            @JsonKey(name: 'safety_identifier') dynamic safetyIdentifier,
            @JsonKey(name: 'service_tier') String serviceTier,
            bool store,
            double temperature,
            TextInfo text,
            @JsonKey(name: 'tool_choice') String toolChoice,
            List<dynamic> tools,
            @JsonKey(name: 'top_logprobs') int topLogprobs,
            @JsonKey(name: 'top_p') double topP,
            String truncation,
            Usage usage,
            dynamic user,
            Map<String, dynamic> metadata)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiModel():
        return $default(
            _that.id,
            _that.object,
            _that.createdAt,
            _that.status,
            _that.background,
            _that.billing,
            _that.completedAt,
            _that.error,
            _that.incompleteDetails,
            _that.instructions,
            _that.maxOutputTokens,
            _that.maxToolCalls,
            _that.model,
            _that.output,
            _that.parallelToolCalls,
            _that.previousResponseId,
            _that.promptCacheKey,
            _that.promptCacheRetention,
            _that.reasoning,
            _that.safetyIdentifier,
            _that.serviceTier,
            _that.store,
            _that.temperature,
            _that.text,
            _that.toolChoice,
            _that.tools,
            _that.topLogprobs,
            _that.topP,
            _that.truncation,
            _that.usage,
            _that.user,
            _that.metadata);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String object,
            @JsonKey(name: 'created_at') int createdAt,
            String status,
            bool background,
            Billing billing,
            @JsonKey(name: 'completed_at') int completedAt,
            dynamic error,
            @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
            dynamic instructions,
            @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
            @JsonKey(name: 'max_tool_calls') int? maxToolCalls,
            String model,
            List<ResponseOutput> output,
            @JsonKey(name: 'parallel_tool_calls') bool parallelToolCalls,
            @JsonKey(name: 'previous_response_id') String? previousResponseId,
            @JsonKey(name: 'prompt_cache_key') String? promptCacheKey,
            @JsonKey(name: 'prompt_cache_retention')
            dynamic promptCacheRetention,
            Reasoning reasoning,
            @JsonKey(name: 'safety_identifier') dynamic safetyIdentifier,
            @JsonKey(name: 'service_tier') String serviceTier,
            bool store,
            double temperature,
            TextInfo text,
            @JsonKey(name: 'tool_choice') String toolChoice,
            List<dynamic> tools,
            @JsonKey(name: 'top_logprobs') int topLogprobs,
            @JsonKey(name: 'top_p') double topP,
            String truncation,
            Usage usage,
            dynamic user,
            Map<String, dynamic> metadata)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiModel() when $default != null:
        return $default(
            _that.id,
            _that.object,
            _that.createdAt,
            _that.status,
            _that.background,
            _that.billing,
            _that.completedAt,
            _that.error,
            _that.incompleteDetails,
            _that.instructions,
            _that.maxOutputTokens,
            _that.maxToolCalls,
            _that.model,
            _that.output,
            _that.parallelToolCalls,
            _that.previousResponseId,
            _that.promptCacheKey,
            _that.promptCacheRetention,
            _that.reasoning,
            _that.safetyIdentifier,
            _that.serviceTier,
            _that.store,
            _that.temperature,
            _that.text,
            _that.toolChoice,
            _that.tools,
            _that.topLogprobs,
            _that.topP,
            _that.truncation,
            _that.usage,
            _that.user,
            _that.metadata);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ApiModel implements ApiModel {
  const _ApiModel(
      {required this.id,
      required this.object,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.status,
      required this.background,
      required this.billing,
      @JsonKey(name: 'completed_at') required this.completedAt,
      this.error,
      @JsonKey(name: 'incomplete_details') this.incompleteDetails,
      this.instructions,
      @JsonKey(name: 'max_output_tokens') this.maxOutputTokens,
      @JsonKey(name: 'max_tool_calls') this.maxToolCalls,
      required this.model,
      required final List<ResponseOutput> output,
      @JsonKey(name: 'parallel_tool_calls') required this.parallelToolCalls,
      @JsonKey(name: 'previous_response_id') this.previousResponseId,
      @JsonKey(name: 'prompt_cache_key') this.promptCacheKey,
      @JsonKey(name: 'prompt_cache_retention') this.promptCacheRetention,
      required this.reasoning,
      @JsonKey(name: 'safety_identifier') this.safetyIdentifier,
      @JsonKey(name: 'service_tier') required this.serviceTier,
      required this.store,
      required this.temperature,
      required this.text,
      @JsonKey(name: 'tool_choice') required this.toolChoice,
      required final List<dynamic> tools,
      @JsonKey(name: 'top_logprobs') required this.topLogprobs,
      @JsonKey(name: 'top_p') required this.topP,
      required this.truncation,
      required this.usage,
      this.user,
      required final Map<String, dynamic> metadata})
      : _output = output,
        _tools = tools,
        _metadata = metadata;
  factory _ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);

  @override
  final String id;
  @override
  final String object;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  final String status;
  @override
  final bool background;
  @override
  final Billing billing;
  @override
  @JsonKey(name: 'completed_at')
  final int completedAt;
  @override
  final dynamic error;
  @override
  @JsonKey(name: 'incomplete_details')
  final dynamic incompleteDetails;
  @override
  final dynamic instructions;
  @override
  @JsonKey(name: 'max_output_tokens')
  final int? maxOutputTokens;
  @override
  @JsonKey(name: 'max_tool_calls')
  final int? maxToolCalls;
  @override
  final String model;
  final List<ResponseOutput> _output;
  @override
  List<ResponseOutput> get output {
    if (_output is EqualUnmodifiableListView) return _output;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_output);
  }

  @override
  @JsonKey(name: 'parallel_tool_calls')
  final bool parallelToolCalls;
  @override
  @JsonKey(name: 'previous_response_id')
  final String? previousResponseId;
  @override
  @JsonKey(name: 'prompt_cache_key')
  final String? promptCacheKey;
  @override
  @JsonKey(name: 'prompt_cache_retention')
  final dynamic promptCacheRetention;
  @override
  final Reasoning reasoning;
  @override
  @JsonKey(name: 'safety_identifier')
  final dynamic safetyIdentifier;
  @override
  @JsonKey(name: 'service_tier')
  final String serviceTier;
  @override
  final bool store;
  @override
  final double temperature;
  @override
  final TextInfo text;
  @override
  @JsonKey(name: 'tool_choice')
  final String toolChoice;
  final List<dynamic> _tools;
  @override
  List<dynamic> get tools {
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tools);
  }

  @override
  @JsonKey(name: 'top_logprobs')
  final int topLogprobs;
  @override
  @JsonKey(name: 'top_p')
  final double topP;
  @override
  final String truncation;
  @override
  final Usage usage;
  @override
  final dynamic user;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ApiModelCopyWith<_ApiModel> get copyWith =>
      __$ApiModelCopyWithImpl<_ApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.billing, billing) || other.billing == billing) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.incompleteDetails, incompleteDetails) &&
            const DeepCollectionEquality()
                .equals(other.instructions, instructions) &&
            (identical(other.maxOutputTokens, maxOutputTokens) ||
                other.maxOutputTokens == maxOutputTokens) &&
            (identical(other.maxToolCalls, maxToolCalls) ||
                other.maxToolCalls == maxToolCalls) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._output, _output) &&
            (identical(other.parallelToolCalls, parallelToolCalls) ||
                other.parallelToolCalls == parallelToolCalls) &&
            (identical(other.previousResponseId, previousResponseId) ||
                other.previousResponseId == previousResponseId) &&
            (identical(other.promptCacheKey, promptCacheKey) ||
                other.promptCacheKey == promptCacheKey) &&
            const DeepCollectionEquality()
                .equals(other.promptCacheRetention, promptCacheRetention) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            const DeepCollectionEquality()
                .equals(other.safetyIdentifier, safetyIdentifier) &&
            (identical(other.serviceTier, serviceTier) ||
                other.serviceTier == serviceTier) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.toolChoice, toolChoice) ||
                other.toolChoice == toolChoice) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            (identical(other.topLogprobs, topLogprobs) ||
                other.topLogprobs == topLogprobs) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.truncation, truncation) ||
                other.truncation == truncation) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        object,
        createdAt,
        status,
        background,
        billing,
        completedAt,
        const DeepCollectionEquality().hash(error),
        const DeepCollectionEquality().hash(incompleteDetails),
        const DeepCollectionEquality().hash(instructions),
        maxOutputTokens,
        maxToolCalls,
        model,
        const DeepCollectionEquality().hash(_output),
        parallelToolCalls,
        previousResponseId,
        promptCacheKey,
        const DeepCollectionEquality().hash(promptCacheRetention),
        reasoning,
        const DeepCollectionEquality().hash(safetyIdentifier),
        serviceTier,
        store,
        temperature,
        text,
        toolChoice,
        const DeepCollectionEquality().hash(_tools),
        topLogprobs,
        topP,
        truncation,
        usage,
        const DeepCollectionEquality().hash(user),
        const DeepCollectionEquality().hash(_metadata)
      ]);

  @override
  String toString() {
    return 'ApiModel(id: $id, object: $object, createdAt: $createdAt, status: $status, background: $background, billing: $billing, completedAt: $completedAt, error: $error, incompleteDetails: $incompleteDetails, instructions: $instructions, maxOutputTokens: $maxOutputTokens, maxToolCalls: $maxToolCalls, model: $model, output: $output, parallelToolCalls: $parallelToolCalls, previousResponseId: $previousResponseId, promptCacheKey: $promptCacheKey, promptCacheRetention: $promptCacheRetention, reasoning: $reasoning, safetyIdentifier: $safetyIdentifier, serviceTier: $serviceTier, store: $store, temperature: $temperature, text: $text, toolChoice: $toolChoice, tools: $tools, topLogprobs: $topLogprobs, topP: $topP, truncation: $truncation, usage: $usage, user: $user, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$ApiModelCopyWith<$Res>
    implements $ApiModelCopyWith<$Res> {
  factory _$ApiModelCopyWith(_ApiModel value, $Res Function(_ApiModel) _then) =
      __$ApiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String object,
      @JsonKey(name: 'created_at') int createdAt,
      String status,
      bool background,
      Billing billing,
      @JsonKey(name: 'completed_at') int completedAt,
      dynamic error,
      @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
      dynamic instructions,
      @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
      @JsonKey(name: 'max_tool_calls') int? maxToolCalls,
      String model,
      List<ResponseOutput> output,
      @JsonKey(name: 'parallel_tool_calls') bool parallelToolCalls,
      @JsonKey(name: 'previous_response_id') String? previousResponseId,
      @JsonKey(name: 'prompt_cache_key') String? promptCacheKey,
      @JsonKey(name: 'prompt_cache_retention') dynamic promptCacheRetention,
      Reasoning reasoning,
      @JsonKey(name: 'safety_identifier') dynamic safetyIdentifier,
      @JsonKey(name: 'service_tier') String serviceTier,
      bool store,
      double temperature,
      TextInfo text,
      @JsonKey(name: 'tool_choice') String toolChoice,
      List<dynamic> tools,
      @JsonKey(name: 'top_logprobs') int topLogprobs,
      @JsonKey(name: 'top_p') double topP,
      String truncation,
      Usage usage,
      dynamic user,
      Map<String, dynamic> metadata});

  @override
  $BillingCopyWith<$Res> get billing;
  @override
  $ReasoningCopyWith<$Res> get reasoning;
  @override
  $TextInfoCopyWith<$Res> get text;
  @override
  $UsageCopyWith<$Res> get usage;
}

/// @nodoc
class __$ApiModelCopyWithImpl<$Res> implements _$ApiModelCopyWith<$Res> {
  __$ApiModelCopyWithImpl(this._self, this._then);

  final _ApiModel _self;
  final $Res Function(_ApiModel) _then;

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? createdAt = null,
    Object? status = null,
    Object? background = null,
    Object? billing = null,
    Object? completedAt = null,
    Object? error = freezed,
    Object? incompleteDetails = freezed,
    Object? instructions = freezed,
    Object? maxOutputTokens = freezed,
    Object? maxToolCalls = freezed,
    Object? model = null,
    Object? output = null,
    Object? parallelToolCalls = null,
    Object? previousResponseId = freezed,
    Object? promptCacheKey = freezed,
    Object? promptCacheRetention = freezed,
    Object? reasoning = null,
    Object? safetyIdentifier = freezed,
    Object? serviceTier = null,
    Object? store = null,
    Object? temperature = null,
    Object? text = null,
    Object? toolChoice = null,
    Object? tools = null,
    Object? topLogprobs = null,
    Object? topP = null,
    Object? truncation = null,
    Object? usage = null,
    Object? user = freezed,
    Object? metadata = null,
  }) {
    return _then(_ApiModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      background: null == background
          ? _self.background
          : background // ignore: cast_nullable_to_non_nullable
              as bool,
      billing: null == billing
          ? _self.billing
          : billing // ignore: cast_nullable_to_non_nullable
              as Billing,
      completedAt: null == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      incompleteDetails: freezed == incompleteDetails
          ? _self.incompleteDetails
          : incompleteDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxOutputTokens: freezed == maxOutputTokens
          ? _self.maxOutputTokens
          : maxOutputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      maxToolCalls: freezed == maxToolCalls
          ? _self.maxToolCalls
          : maxToolCalls // ignore: cast_nullable_to_non_nullable
              as int?,
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      output: null == output
          ? _self._output
          : output // ignore: cast_nullable_to_non_nullable
              as List<ResponseOutput>,
      parallelToolCalls: null == parallelToolCalls
          ? _self.parallelToolCalls
          : parallelToolCalls // ignore: cast_nullable_to_non_nullable
              as bool,
      previousResponseId: freezed == previousResponseId
          ? _self.previousResponseId
          : previousResponseId // ignore: cast_nullable_to_non_nullable
              as String?,
      promptCacheKey: freezed == promptCacheKey
          ? _self.promptCacheKey
          : promptCacheKey // ignore: cast_nullable_to_non_nullable
              as String?,
      promptCacheRetention: freezed == promptCacheRetention
          ? _self.promptCacheRetention
          : promptCacheRetention // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reasoning: null == reasoning
          ? _self.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as Reasoning,
      safetyIdentifier: freezed == safetyIdentifier
          ? _self.safetyIdentifier
          : safetyIdentifier // ignore: cast_nullable_to_non_nullable
              as dynamic,
      serviceTier: null == serviceTier
          ? _self.serviceTier
          : serviceTier // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _self.store
          : store // ignore: cast_nullable_to_non_nullable
              as bool,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as TextInfo,
      toolChoice: null == toolChoice
          ? _self.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as String,
      tools: null == tools
          ? _self._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      topLogprobs: null == topLogprobs
          ? _self.topLogprobs
          : topLogprobs // ignore: cast_nullable_to_non_nullable
              as int,
      topP: null == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double,
      truncation: null == truncation
          ? _self.truncation
          : truncation // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _self.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      metadata: null == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BillingCopyWith<$Res> get billing {
    return $BillingCopyWith<$Res>(_self.billing, (value) {
      return _then(_self.copyWith(billing: value));
    });
  }

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReasoningCopyWith<$Res> get reasoning {
    return $ReasoningCopyWith<$Res>(_self.reasoning, (value) {
      return _then(_self.copyWith(reasoning: value));
    });
  }

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextInfoCopyWith<$Res> get text {
    return $TextInfoCopyWith<$Res>(_self.text, (value) {
      return _then(_self.copyWith(text: value));
    });
  }

  /// Create a copy of ApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsageCopyWith<$Res> get usage {
    return $UsageCopyWith<$Res>(_self.usage, (value) {
      return _then(_self.copyWith(usage: value));
    });
  }
}

/// @nodoc
mixin _$Billing {
  String get payer;

  /// Create a copy of Billing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BillingCopyWith<Billing> get copyWith =>
      _$BillingCopyWithImpl<Billing>(this as Billing, _$identity);

  /// Serializes this Billing to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Billing &&
            (identical(other.payer, payer) || other.payer == payer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, payer);

  @override
  String toString() {
    return 'Billing(payer: $payer)';
  }
}

/// @nodoc
abstract mixin class $BillingCopyWith<$Res> {
  factory $BillingCopyWith(Billing value, $Res Function(Billing) _then) =
      _$BillingCopyWithImpl;
  @useResult
  $Res call({String payer});
}

/// @nodoc
class _$BillingCopyWithImpl<$Res> implements $BillingCopyWith<$Res> {
  _$BillingCopyWithImpl(this._self, this._then);

  final Billing _self;
  final $Res Function(Billing) _then;

  /// Create a copy of Billing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payer = null,
  }) {
    return _then(_self.copyWith(
      payer: null == payer
          ? _self.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Billing].
extension BillingPatterns on Billing {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Billing value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Billing() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Billing value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Billing():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Billing value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Billing() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String payer)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Billing() when $default != null:
        return $default(_that.payer);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String payer) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Billing():
        return $default(_that.payer);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String payer)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Billing() when $default != null:
        return $default(_that.payer);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Billing implements Billing {
  const _Billing({required this.payer});
  factory _Billing.fromJson(Map<String, dynamic> json) =>
      _$BillingFromJson(json);

  @override
  final String payer;

  /// Create a copy of Billing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BillingCopyWith<_Billing> get copyWith =>
      __$BillingCopyWithImpl<_Billing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BillingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Billing &&
            (identical(other.payer, payer) || other.payer == payer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, payer);

  @override
  String toString() {
    return 'Billing(payer: $payer)';
  }
}

/// @nodoc
abstract mixin class _$BillingCopyWith<$Res> implements $BillingCopyWith<$Res> {
  factory _$BillingCopyWith(_Billing value, $Res Function(_Billing) _then) =
      __$BillingCopyWithImpl;
  @override
  @useResult
  $Res call({String payer});
}

/// @nodoc
class __$BillingCopyWithImpl<$Res> implements _$BillingCopyWith<$Res> {
  __$BillingCopyWithImpl(this._self, this._then);

  final _Billing _self;
  final $Res Function(_Billing) _then;

  /// Create a copy of Billing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? payer = null,
  }) {
    return _then(_Billing(
      payer: null == payer
          ? _self.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ResponseOutput {
  String get id;
  String get type;
  String get status;
  List<ContentItem> get content;
  String get role;

  /// Create a copy of ResponseOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseOutputCopyWith<ResponseOutput> get copyWith =>
      _$ResponseOutputCopyWithImpl<ResponseOutput>(
          this as ResponseOutput, _$identity);

  /// Serializes this ResponseOutput to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseOutput &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, status,
      const DeepCollectionEquality().hash(content), role);

  @override
  String toString() {
    return 'ResponseOutput(id: $id, type: $type, status: $status, content: $content, role: $role)';
  }
}

/// @nodoc
abstract mixin class $ResponseOutputCopyWith<$Res> {
  factory $ResponseOutputCopyWith(
          ResponseOutput value, $Res Function(ResponseOutput) _then) =
      _$ResponseOutputCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String type,
      String status,
      List<ContentItem> content,
      String role});
}

/// @nodoc
class _$ResponseOutputCopyWithImpl<$Res>
    implements $ResponseOutputCopyWith<$Res> {
  _$ResponseOutputCopyWithImpl(this._self, this._then);

  final ResponseOutput _self;
  final $Res Function(ResponseOutput) _then;

  /// Create a copy of ResponseOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? status = null,
    Object? content = null,
    Object? role = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ContentItem>,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ResponseOutput].
extension ResponseOutputPatterns on ResponseOutput {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ResponseOutput value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResponseOutput() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ResponseOutput value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseOutput():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ResponseOutput value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseOutput() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String type, String status,
            List<ContentItem> content, String role)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResponseOutput() when $default != null:
        return $default(
            _that.id, _that.type, _that.status, _that.content, _that.role);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String type, String status,
            List<ContentItem> content, String role)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseOutput():
        return $default(
            _that.id, _that.type, _that.status, _that.content, _that.role);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String type, String status,
            List<ContentItem> content, String role)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseOutput() when $default != null:
        return $default(
            _that.id, _that.type, _that.status, _that.content, _that.role);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ResponseOutput implements ResponseOutput {
  const _ResponseOutput(
      {required this.id,
      required this.type,
      required this.status,
      required final List<ContentItem> content,
      required this.role})
      : _content = content;
  factory _ResponseOutput.fromJson(Map<String, dynamic> json) =>
      _$ResponseOutputFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String status;
  final List<ContentItem> _content;
  @override
  List<ContentItem> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final String role;

  /// Create a copy of ResponseOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResponseOutputCopyWith<_ResponseOutput> get copyWith =>
      __$ResponseOutputCopyWithImpl<_ResponseOutput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseOutputToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResponseOutput &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, status,
      const DeepCollectionEquality().hash(_content), role);

  @override
  String toString() {
    return 'ResponseOutput(id: $id, type: $type, status: $status, content: $content, role: $role)';
  }
}

/// @nodoc
abstract mixin class _$ResponseOutputCopyWith<$Res>
    implements $ResponseOutputCopyWith<$Res> {
  factory _$ResponseOutputCopyWith(
          _ResponseOutput value, $Res Function(_ResponseOutput) _then) =
      __$ResponseOutputCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String status,
      List<ContentItem> content,
      String role});
}

/// @nodoc
class __$ResponseOutputCopyWithImpl<$Res>
    implements _$ResponseOutputCopyWith<$Res> {
  __$ResponseOutputCopyWithImpl(this._self, this._then);

  final _ResponseOutput _self;
  final $Res Function(_ResponseOutput) _then;

  /// Create a copy of ResponseOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? status = null,
    Object? content = null,
    Object? role = null,
  }) {
    return _then(_ResponseOutput(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ContentItem>,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ContentItem {
  String get type;
  List<dynamic> get annotations;
  List<dynamic> get logprobs;
  String get text;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentItemCopyWith<ContentItem> get copyWith =>
      _$ContentItemCopyWithImpl<ContentItem>(this as ContentItem, _$identity);

  /// Serializes this ContentItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentItem &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.annotations, annotations) &&
            const DeepCollectionEquality().equals(other.logprobs, logprobs) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(annotations),
      const DeepCollectionEquality().hash(logprobs),
      text);

  @override
  String toString() {
    return 'ContentItem(type: $type, annotations: $annotations, logprobs: $logprobs, text: $text)';
  }
}

/// @nodoc
abstract mixin class $ContentItemCopyWith<$Res> {
  factory $ContentItemCopyWith(
          ContentItem value, $Res Function(ContentItem) _then) =
      _$ContentItemCopyWithImpl;
  @useResult
  $Res call(
      {String type,
      List<dynamic> annotations,
      List<dynamic> logprobs,
      String text});
}

/// @nodoc
class _$ContentItemCopyWithImpl<$Res> implements $ContentItemCopyWith<$Res> {
  _$ContentItemCopyWithImpl(this._self, this._then);

  final ContentItem _self;
  final $Res Function(ContentItem) _then;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? annotations = null,
    Object? logprobs = null,
    Object? text = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      annotations: null == annotations
          ? _self.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      logprobs: null == logprobs
          ? _self.logprobs
          : logprobs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ContentItem].
extension ContentItemPatterns on ContentItem {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ContentItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentItem() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ContentItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentItem():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ContentItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentItem() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String type, List<dynamic> annotations,
            List<dynamic> logprobs, String text)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentItem() when $default != null:
        return $default(
            _that.type, _that.annotations, _that.logprobs, _that.text);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String type, List<dynamic> annotations,
            List<dynamic> logprobs, String text)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentItem():
        return $default(
            _that.type, _that.annotations, _that.logprobs, _that.text);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String type, List<dynamic> annotations,
            List<dynamic> logprobs, String text)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentItem() when $default != null:
        return $default(
            _that.type, _that.annotations, _that.logprobs, _that.text);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ContentItem implements ContentItem {
  const _ContentItem(
      {required this.type,
      required final List<dynamic> annotations,
      required final List<dynamic> logprobs,
      required this.text})
      : _annotations = annotations,
        _logprobs = logprobs;
  factory _ContentItem.fromJson(Map<String, dynamic> json) =>
      _$ContentItemFromJson(json);

  @override
  final String type;
  final List<dynamic> _annotations;
  @override
  List<dynamic> get annotations {
    if (_annotations is EqualUnmodifiableListView) return _annotations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_annotations);
  }

  final List<dynamic> _logprobs;
  @override
  List<dynamic> get logprobs {
    if (_logprobs is EqualUnmodifiableListView) return _logprobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logprobs);
  }

  @override
  final String text;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentItemCopyWith<_ContentItem> get copyWith =>
      __$ContentItemCopyWithImpl<_ContentItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentItem &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._annotations, _annotations) &&
            const DeepCollectionEquality().equals(other._logprobs, _logprobs) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_annotations),
      const DeepCollectionEquality().hash(_logprobs),
      text);

  @override
  String toString() {
    return 'ContentItem(type: $type, annotations: $annotations, logprobs: $logprobs, text: $text)';
  }
}

/// @nodoc
abstract mixin class _$ContentItemCopyWith<$Res>
    implements $ContentItemCopyWith<$Res> {
  factory _$ContentItemCopyWith(
          _ContentItem value, $Res Function(_ContentItem) _then) =
      __$ContentItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String type,
      List<dynamic> annotations,
      List<dynamic> logprobs,
      String text});
}

/// @nodoc
class __$ContentItemCopyWithImpl<$Res> implements _$ContentItemCopyWith<$Res> {
  __$ContentItemCopyWithImpl(this._self, this._then);

  final _ContentItem _self;
  final $Res Function(_ContentItem) _then;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? annotations = null,
    Object? logprobs = null,
    Object? text = null,
  }) {
    return _then(_ContentItem(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      annotations: null == annotations
          ? _self._annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      logprobs: null == logprobs
          ? _self._logprobs
          : logprobs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Reasoning {
  dynamic get effort;
  dynamic get summary;

  /// Create a copy of Reasoning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReasoningCopyWith<Reasoning> get copyWith =>
      _$ReasoningCopyWithImpl<Reasoning>(this as Reasoning, _$identity);

  /// Serializes this Reasoning to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Reasoning &&
            const DeepCollectionEquality().equals(other.effort, effort) &&
            const DeepCollectionEquality().equals(other.summary, summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(effort),
      const DeepCollectionEquality().hash(summary));

  @override
  String toString() {
    return 'Reasoning(effort: $effort, summary: $summary)';
  }
}

/// @nodoc
abstract mixin class $ReasoningCopyWith<$Res> {
  factory $ReasoningCopyWith(Reasoning value, $Res Function(Reasoning) _then) =
      _$ReasoningCopyWithImpl;
  @useResult
  $Res call({dynamic effort, dynamic summary});
}

/// @nodoc
class _$ReasoningCopyWithImpl<$Res> implements $ReasoningCopyWith<$Res> {
  _$ReasoningCopyWithImpl(this._self, this._then);

  final Reasoning _self;
  final $Res Function(Reasoning) _then;

  /// Create a copy of Reasoning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effort = freezed,
    Object? summary = freezed,
  }) {
    return _then(_self.copyWith(
      effort: freezed == effort
          ? _self.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as dynamic,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// Adds pattern-matching-related methods to [Reasoning].
extension ReasoningPatterns on Reasoning {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Reasoning value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Reasoning() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Reasoning value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Reasoning():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Reasoning value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Reasoning() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(dynamic effort, dynamic summary)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Reasoning() when $default != null:
        return $default(_that.effort, _that.summary);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(dynamic effort, dynamic summary) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Reasoning():
        return $default(_that.effort, _that.summary);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(dynamic effort, dynamic summary)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Reasoning() when $default != null:
        return $default(_that.effort, _that.summary);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Reasoning implements Reasoning {
  const _Reasoning({this.effort, this.summary});
  factory _Reasoning.fromJson(Map<String, dynamic> json) =>
      _$ReasoningFromJson(json);

  @override
  final dynamic effort;
  @override
  final dynamic summary;

  /// Create a copy of Reasoning
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReasoningCopyWith<_Reasoning> get copyWith =>
      __$ReasoningCopyWithImpl<_Reasoning>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReasoningToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reasoning &&
            const DeepCollectionEquality().equals(other.effort, effort) &&
            const DeepCollectionEquality().equals(other.summary, summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(effort),
      const DeepCollectionEquality().hash(summary));

  @override
  String toString() {
    return 'Reasoning(effort: $effort, summary: $summary)';
  }
}

/// @nodoc
abstract mixin class _$ReasoningCopyWith<$Res>
    implements $ReasoningCopyWith<$Res> {
  factory _$ReasoningCopyWith(
          _Reasoning value, $Res Function(_Reasoning) _then) =
      __$ReasoningCopyWithImpl;
  @override
  @useResult
  $Res call({dynamic effort, dynamic summary});
}

/// @nodoc
class __$ReasoningCopyWithImpl<$Res> implements _$ReasoningCopyWith<$Res> {
  __$ReasoningCopyWithImpl(this._self, this._then);

  final _Reasoning _self;
  final $Res Function(_Reasoning) _then;

  /// Create a copy of Reasoning
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? effort = freezed,
    Object? summary = freezed,
  }) {
    return _then(_Reasoning(
      effort: freezed == effort
          ? _self.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as dynamic,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
mixin _$TextInfo {
  Format get format;
  String get verbosity;

  /// Create a copy of TextInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TextInfoCopyWith<TextInfo> get copyWith =>
      _$TextInfoCopyWithImpl<TextInfo>(this as TextInfo, _$identity);

  /// Serializes this TextInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextInfo &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.verbosity, verbosity) ||
                other.verbosity == verbosity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, format, verbosity);

  @override
  String toString() {
    return 'TextInfo(format: $format, verbosity: $verbosity)';
  }
}

/// @nodoc
abstract mixin class $TextInfoCopyWith<$Res> {
  factory $TextInfoCopyWith(TextInfo value, $Res Function(TextInfo) _then) =
      _$TextInfoCopyWithImpl;
  @useResult
  $Res call({Format format, String verbosity});

  $FormatCopyWith<$Res> get format;
}

/// @nodoc
class _$TextInfoCopyWithImpl<$Res> implements $TextInfoCopyWith<$Res> {
  _$TextInfoCopyWithImpl(this._self, this._then);

  final TextInfo _self;
  final $Res Function(TextInfo) _then;

  /// Create a copy of TextInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? verbosity = null,
  }) {
    return _then(_self.copyWith(
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as Format,
      verbosity: null == verbosity
          ? _self.verbosity
          : verbosity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of TextInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormatCopyWith<$Res> get format {
    return $FormatCopyWith<$Res>(_self.format, (value) {
      return _then(_self.copyWith(format: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TextInfo].
extension TextInfoPatterns on TextInfo {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TextInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TextInfo() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TextInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextInfo():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TextInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextInfo() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Format format, String verbosity)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TextInfo() when $default != null:
        return $default(_that.format, _that.verbosity);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Format format, String verbosity) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextInfo():
        return $default(_that.format, _that.verbosity);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Format format, String verbosity)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextInfo() when $default != null:
        return $default(_that.format, _that.verbosity);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TextInfo implements TextInfo {
  const _TextInfo({required this.format, required this.verbosity});
  factory _TextInfo.fromJson(Map<String, dynamic> json) =>
      _$TextInfoFromJson(json);

  @override
  final Format format;
  @override
  final String verbosity;

  /// Create a copy of TextInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TextInfoCopyWith<_TextInfo> get copyWith =>
      __$TextInfoCopyWithImpl<_TextInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TextInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TextInfo &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.verbosity, verbosity) ||
                other.verbosity == verbosity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, format, verbosity);

  @override
  String toString() {
    return 'TextInfo(format: $format, verbosity: $verbosity)';
  }
}

/// @nodoc
abstract mixin class _$TextInfoCopyWith<$Res>
    implements $TextInfoCopyWith<$Res> {
  factory _$TextInfoCopyWith(_TextInfo value, $Res Function(_TextInfo) _then) =
      __$TextInfoCopyWithImpl;
  @override
  @useResult
  $Res call({Format format, String verbosity});

  @override
  $FormatCopyWith<$Res> get format;
}

/// @nodoc
class __$TextInfoCopyWithImpl<$Res> implements _$TextInfoCopyWith<$Res> {
  __$TextInfoCopyWithImpl(this._self, this._then);

  final _TextInfo _self;
  final $Res Function(_TextInfo) _then;

  /// Create a copy of TextInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? format = null,
    Object? verbosity = null,
  }) {
    return _then(_TextInfo(
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as Format,
      verbosity: null == verbosity
          ? _self.verbosity
          : verbosity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of TextInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormatCopyWith<$Res> get format {
    return $FormatCopyWith<$Res>(_self.format, (value) {
      return _then(_self.copyWith(format: value));
    });
  }
}

/// @nodoc
mixin _$Format {
  String get type;

  /// Create a copy of Format
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormatCopyWith<Format> get copyWith =>
      _$FormatCopyWithImpl<Format>(this as Format, _$identity);

  /// Serializes this Format to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Format &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'Format(type: $type)';
  }
}

/// @nodoc
abstract mixin class $FormatCopyWith<$Res> {
  factory $FormatCopyWith(Format value, $Res Function(Format) _then) =
      _$FormatCopyWithImpl;
  @useResult
  $Res call({String type});
}

/// @nodoc
class _$FormatCopyWithImpl<$Res> implements $FormatCopyWith<$Res> {
  _$FormatCopyWithImpl(this._self, this._then);

  final Format _self;
  final $Res Function(Format) _then;

  /// Create a copy of Format
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Format].
extension FormatPatterns on Format {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Format value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Format() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Format value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Format():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Format value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Format() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String type)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Format() when $default != null:
        return $default(_that.type);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String type) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Format():
        return $default(_that.type);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String type)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Format() when $default != null:
        return $default(_that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Format implements Format {
  const _Format({required this.type});
  factory _Format.fromJson(Map<String, dynamic> json) => _$FormatFromJson(json);

  @override
  final String type;

  /// Create a copy of Format
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormatCopyWith<_Format> get copyWith =>
      __$FormatCopyWithImpl<_Format>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormatToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Format &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'Format(type: $type)';
  }
}

/// @nodoc
abstract mixin class _$FormatCopyWith<$Res> implements $FormatCopyWith<$Res> {
  factory _$FormatCopyWith(_Format value, $Res Function(_Format) _then) =
      __$FormatCopyWithImpl;
  @override
  @useResult
  $Res call({String type});
}

/// @nodoc
class __$FormatCopyWithImpl<$Res> implements _$FormatCopyWith<$Res> {
  __$FormatCopyWithImpl(this._self, this._then);

  final _Format _self;
  final $Res Function(_Format) _then;

  /// Create a copy of Format
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
  }) {
    return _then(_Format(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Usage {
  @JsonKey(name: 'input_tokens')
  int get inputTokens;
  @JsonKey(name: 'input_tokens_details')
  InputTokensDetails get inputTokensDetails;
  @JsonKey(name: 'output_tokens')
  int get outputTokens;
  @JsonKey(name: 'output_tokens_details')
  OutputTokensDetails get outputTokensDetails;
  @JsonKey(name: 'total_tokens')
  int get totalTokens;

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsageCopyWith<Usage> get copyWith =>
      _$UsageCopyWithImpl<Usage>(this as Usage, _$identity);

  /// Serializes this Usage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Usage &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.inputTokensDetails, inputTokensDetails) ||
                other.inputTokensDetails == inputTokensDetails) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.outputTokensDetails, outputTokensDetails) ||
                other.outputTokensDetails == outputTokensDetails) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, inputTokens, inputTokensDetails,
      outputTokens, outputTokensDetails, totalTokens);

  @override
  String toString() {
    return 'Usage(inputTokens: $inputTokens, inputTokensDetails: $inputTokensDetails, outputTokens: $outputTokens, outputTokensDetails: $outputTokensDetails, totalTokens: $totalTokens)';
  }
}

/// @nodoc
abstract mixin class $UsageCopyWith<$Res> {
  factory $UsageCopyWith(Usage value, $Res Function(Usage) _then) =
      _$UsageCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'input_tokens') int inputTokens,
      @JsonKey(name: 'input_tokens_details')
      InputTokensDetails inputTokensDetails,
      @JsonKey(name: 'output_tokens') int outputTokens,
      @JsonKey(name: 'output_tokens_details')
      OutputTokensDetails outputTokensDetails,
      @JsonKey(name: 'total_tokens') int totalTokens});

  $InputTokensDetailsCopyWith<$Res> get inputTokensDetails;
  $OutputTokensDetailsCopyWith<$Res> get outputTokensDetails;
}

/// @nodoc
class _$UsageCopyWithImpl<$Res> implements $UsageCopyWith<$Res> {
  _$UsageCopyWithImpl(this._self, this._then);

  final Usage _self;
  final $Res Function(Usage) _then;

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputTokens = null,
    Object? inputTokensDetails = null,
    Object? outputTokens = null,
    Object? outputTokensDetails = null,
    Object? totalTokens = null,
  }) {
    return _then(_self.copyWith(
      inputTokens: null == inputTokens
          ? _self.inputTokens
          : inputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      inputTokensDetails: null == inputTokensDetails
          ? _self.inputTokensDetails
          : inputTokensDetails // ignore: cast_nullable_to_non_nullable
              as InputTokensDetails,
      outputTokens: null == outputTokens
          ? _self.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      outputTokensDetails: null == outputTokensDetails
          ? _self.outputTokensDetails
          : outputTokensDetails // ignore: cast_nullable_to_non_nullable
              as OutputTokensDetails,
      totalTokens: null == totalTokens
          ? _self.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputTokensDetailsCopyWith<$Res> get inputTokensDetails {
    return $InputTokensDetailsCopyWith<$Res>(_self.inputTokensDetails, (value) {
      return _then(_self.copyWith(inputTokensDetails: value));
    });
  }

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputTokensDetailsCopyWith<$Res> get outputTokensDetails {
    return $OutputTokensDetailsCopyWith<$Res>(_self.outputTokensDetails,
        (value) {
      return _then(_self.copyWith(outputTokensDetails: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Usage].
extension UsagePatterns on Usage {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Usage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Usage() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Usage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Usage():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Usage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Usage() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'input_tokens') int inputTokens,
            @JsonKey(name: 'input_tokens_details')
            InputTokensDetails inputTokensDetails,
            @JsonKey(name: 'output_tokens') int outputTokens,
            @JsonKey(name: 'output_tokens_details')
            OutputTokensDetails outputTokensDetails,
            @JsonKey(name: 'total_tokens') int totalTokens)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Usage() when $default != null:
        return $default(_that.inputTokens, _that.inputTokensDetails,
            _that.outputTokens, _that.outputTokensDetails, _that.totalTokens);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'input_tokens') int inputTokens,
            @JsonKey(name: 'input_tokens_details')
            InputTokensDetails inputTokensDetails,
            @JsonKey(name: 'output_tokens') int outputTokens,
            @JsonKey(name: 'output_tokens_details')
            OutputTokensDetails outputTokensDetails,
            @JsonKey(name: 'total_tokens') int totalTokens)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Usage():
        return $default(_that.inputTokens, _that.inputTokensDetails,
            _that.outputTokens, _that.outputTokensDetails, _that.totalTokens);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'input_tokens') int inputTokens,
            @JsonKey(name: 'input_tokens_details')
            InputTokensDetails inputTokensDetails,
            @JsonKey(name: 'output_tokens') int outputTokens,
            @JsonKey(name: 'output_tokens_details')
            OutputTokensDetails outputTokensDetails,
            @JsonKey(name: 'total_tokens') int totalTokens)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Usage() when $default != null:
        return $default(_that.inputTokens, _that.inputTokensDetails,
            _that.outputTokens, _that.outputTokensDetails, _that.totalTokens);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Usage implements Usage {
  const _Usage(
      {@JsonKey(name: 'input_tokens') required this.inputTokens,
      @JsonKey(name: 'input_tokens_details') required this.inputTokensDetails,
      @JsonKey(name: 'output_tokens') required this.outputTokens,
      @JsonKey(name: 'output_tokens_details') required this.outputTokensDetails,
      @JsonKey(name: 'total_tokens') required this.totalTokens});
  factory _Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  @override
  @JsonKey(name: 'input_tokens')
  final int inputTokens;
  @override
  @JsonKey(name: 'input_tokens_details')
  final InputTokensDetails inputTokensDetails;
  @override
  @JsonKey(name: 'output_tokens')
  final int outputTokens;
  @override
  @JsonKey(name: 'output_tokens_details')
  final OutputTokensDetails outputTokensDetails;
  @override
  @JsonKey(name: 'total_tokens')
  final int totalTokens;

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsageCopyWith<_Usage> get copyWith =>
      __$UsageCopyWithImpl<_Usage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Usage &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.inputTokensDetails, inputTokensDetails) ||
                other.inputTokensDetails == inputTokensDetails) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.outputTokensDetails, outputTokensDetails) ||
                other.outputTokensDetails == outputTokensDetails) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, inputTokens, inputTokensDetails,
      outputTokens, outputTokensDetails, totalTokens);

  @override
  String toString() {
    return 'Usage(inputTokens: $inputTokens, inputTokensDetails: $inputTokensDetails, outputTokens: $outputTokens, outputTokensDetails: $outputTokensDetails, totalTokens: $totalTokens)';
  }
}

/// @nodoc
abstract mixin class _$UsageCopyWith<$Res> implements $UsageCopyWith<$Res> {
  factory _$UsageCopyWith(_Usage value, $Res Function(_Usage) _then) =
      __$UsageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'input_tokens') int inputTokens,
      @JsonKey(name: 'input_tokens_details')
      InputTokensDetails inputTokensDetails,
      @JsonKey(name: 'output_tokens') int outputTokens,
      @JsonKey(name: 'output_tokens_details')
      OutputTokensDetails outputTokensDetails,
      @JsonKey(name: 'total_tokens') int totalTokens});

  @override
  $InputTokensDetailsCopyWith<$Res> get inputTokensDetails;
  @override
  $OutputTokensDetailsCopyWith<$Res> get outputTokensDetails;
}

/// @nodoc
class __$UsageCopyWithImpl<$Res> implements _$UsageCopyWith<$Res> {
  __$UsageCopyWithImpl(this._self, this._then);

  final _Usage _self;
  final $Res Function(_Usage) _then;

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? inputTokens = null,
    Object? inputTokensDetails = null,
    Object? outputTokens = null,
    Object? outputTokensDetails = null,
    Object? totalTokens = null,
  }) {
    return _then(_Usage(
      inputTokens: null == inputTokens
          ? _self.inputTokens
          : inputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      inputTokensDetails: null == inputTokensDetails
          ? _self.inputTokensDetails
          : inputTokensDetails // ignore: cast_nullable_to_non_nullable
              as InputTokensDetails,
      outputTokens: null == outputTokens
          ? _self.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      outputTokensDetails: null == outputTokensDetails
          ? _self.outputTokensDetails
          : outputTokensDetails // ignore: cast_nullable_to_non_nullable
              as OutputTokensDetails,
      totalTokens: null == totalTokens
          ? _self.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputTokensDetailsCopyWith<$Res> get inputTokensDetails {
    return $InputTokensDetailsCopyWith<$Res>(_self.inputTokensDetails, (value) {
      return _then(_self.copyWith(inputTokensDetails: value));
    });
  }

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputTokensDetailsCopyWith<$Res> get outputTokensDetails {
    return $OutputTokensDetailsCopyWith<$Res>(_self.outputTokensDetails,
        (value) {
      return _then(_self.copyWith(outputTokensDetails: value));
    });
  }
}

/// @nodoc
mixin _$InputTokensDetails {
  @JsonKey(name: 'cached_tokens')
  int get cachedTokens;

  /// Create a copy of InputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InputTokensDetailsCopyWith<InputTokensDetails> get copyWith =>
      _$InputTokensDetailsCopyWithImpl<InputTokensDetails>(
          this as InputTokensDetails, _$identity);

  /// Serializes this InputTokensDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InputTokensDetails &&
            (identical(other.cachedTokens, cachedTokens) ||
                other.cachedTokens == cachedTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cachedTokens);

  @override
  String toString() {
    return 'InputTokensDetails(cachedTokens: $cachedTokens)';
  }
}

/// @nodoc
abstract mixin class $InputTokensDetailsCopyWith<$Res> {
  factory $InputTokensDetailsCopyWith(
          InputTokensDetails value, $Res Function(InputTokensDetails) _then) =
      _$InputTokensDetailsCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'cached_tokens') int cachedTokens});
}

/// @nodoc
class _$InputTokensDetailsCopyWithImpl<$Res>
    implements $InputTokensDetailsCopyWith<$Res> {
  _$InputTokensDetailsCopyWithImpl(this._self, this._then);

  final InputTokensDetails _self;
  final $Res Function(InputTokensDetails) _then;

  /// Create a copy of InputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cachedTokens = null,
  }) {
    return _then(_self.copyWith(
      cachedTokens: null == cachedTokens
          ? _self.cachedTokens
          : cachedTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [InputTokensDetails].
extension InputTokensDetailsPatterns on InputTokensDetails {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InputTokensDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InputTokensDetails() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InputTokensDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputTokensDetails():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InputTokensDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputTokensDetails() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'cached_tokens') int cachedTokens)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InputTokensDetails() when $default != null:
        return $default(_that.cachedTokens);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'cached_tokens') int cachedTokens) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputTokensDetails():
        return $default(_that.cachedTokens);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'cached_tokens') int cachedTokens)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputTokensDetails() when $default != null:
        return $default(_that.cachedTokens);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InputTokensDetails implements InputTokensDetails {
  const _InputTokensDetails(
      {@JsonKey(name: 'cached_tokens') required this.cachedTokens});
  factory _InputTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$InputTokensDetailsFromJson(json);

  @override
  @JsonKey(name: 'cached_tokens')
  final int cachedTokens;

  /// Create a copy of InputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InputTokensDetailsCopyWith<_InputTokensDetails> get copyWith =>
      __$InputTokensDetailsCopyWithImpl<_InputTokensDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InputTokensDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InputTokensDetails &&
            (identical(other.cachedTokens, cachedTokens) ||
                other.cachedTokens == cachedTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cachedTokens);

  @override
  String toString() {
    return 'InputTokensDetails(cachedTokens: $cachedTokens)';
  }
}

/// @nodoc
abstract mixin class _$InputTokensDetailsCopyWith<$Res>
    implements $InputTokensDetailsCopyWith<$Res> {
  factory _$InputTokensDetailsCopyWith(
          _InputTokensDetails value, $Res Function(_InputTokensDetails) _then) =
      __$InputTokensDetailsCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'cached_tokens') int cachedTokens});
}

/// @nodoc
class __$InputTokensDetailsCopyWithImpl<$Res>
    implements _$InputTokensDetailsCopyWith<$Res> {
  __$InputTokensDetailsCopyWithImpl(this._self, this._then);

  final _InputTokensDetails _self;
  final $Res Function(_InputTokensDetails) _then;

  /// Create a copy of InputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cachedTokens = null,
  }) {
    return _then(_InputTokensDetails(
      cachedTokens: null == cachedTokens
          ? _self.cachedTokens
          : cachedTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$OutputTokensDetails {
  @JsonKey(name: 'reasoning_tokens')
  int get reasoningTokens;

  /// Create a copy of OutputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputTokensDetailsCopyWith<OutputTokensDetails> get copyWith =>
      _$OutputTokensDetailsCopyWithImpl<OutputTokensDetails>(
          this as OutputTokensDetails, _$identity);

  /// Serializes this OutputTokensDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputTokensDetails &&
            (identical(other.reasoningTokens, reasoningTokens) ||
                other.reasoningTokens == reasoningTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reasoningTokens);

  @override
  String toString() {
    return 'OutputTokensDetails(reasoningTokens: $reasoningTokens)';
  }
}

/// @nodoc
abstract mixin class $OutputTokensDetailsCopyWith<$Res> {
  factory $OutputTokensDetailsCopyWith(
          OutputTokensDetails value, $Res Function(OutputTokensDetails) _then) =
      _$OutputTokensDetailsCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'reasoning_tokens') int reasoningTokens});
}

/// @nodoc
class _$OutputTokensDetailsCopyWithImpl<$Res>
    implements $OutputTokensDetailsCopyWith<$Res> {
  _$OutputTokensDetailsCopyWithImpl(this._self, this._then);

  final OutputTokensDetails _self;
  final $Res Function(OutputTokensDetails) _then;

  /// Create a copy of OutputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasoningTokens = null,
  }) {
    return _then(_self.copyWith(
      reasoningTokens: null == reasoningTokens
          ? _self.reasoningTokens
          : reasoningTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [OutputTokensDetails].
extension OutputTokensDetailsPatterns on OutputTokensDetails {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OutputTokensDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OutputTokensDetails() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OutputTokensDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputTokensDetails():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OutputTokensDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputTokensDetails() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'reasoning_tokens') int reasoningTokens)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OutputTokensDetails() when $default != null:
        return $default(_that.reasoningTokens);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'reasoning_tokens') int reasoningTokens)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputTokensDetails():
        return $default(_that.reasoningTokens);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'reasoning_tokens') int reasoningTokens)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputTokensDetails() when $default != null:
        return $default(_that.reasoningTokens);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OutputTokensDetails implements OutputTokensDetails {
  const _OutputTokensDetails(
      {@JsonKey(name: 'reasoning_tokens') required this.reasoningTokens});
  factory _OutputTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$OutputTokensDetailsFromJson(json);

  @override
  @JsonKey(name: 'reasoning_tokens')
  final int reasoningTokens;

  /// Create a copy of OutputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OutputTokensDetailsCopyWith<_OutputTokensDetails> get copyWith =>
      __$OutputTokensDetailsCopyWithImpl<_OutputTokensDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OutputTokensDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OutputTokensDetails &&
            (identical(other.reasoningTokens, reasoningTokens) ||
                other.reasoningTokens == reasoningTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reasoningTokens);

  @override
  String toString() {
    return 'OutputTokensDetails(reasoningTokens: $reasoningTokens)';
  }
}

/// @nodoc
abstract mixin class _$OutputTokensDetailsCopyWith<$Res>
    implements $OutputTokensDetailsCopyWith<$Res> {
  factory _$OutputTokensDetailsCopyWith(_OutputTokensDetails value,
          $Res Function(_OutputTokensDetails) _then) =
      __$OutputTokensDetailsCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'reasoning_tokens') int reasoningTokens});
}

/// @nodoc
class __$OutputTokensDetailsCopyWithImpl<$Res>
    implements _$OutputTokensDetailsCopyWith<$Res> {
  __$OutputTokensDetailsCopyWithImpl(this._self, this._then);

  final _OutputTokensDetails _self;
  final $Res Function(_OutputTokensDetails) _then;

  /// Create a copy of OutputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reasoningTokens = null,
  }) {
    return _then(_OutputTokensDetails(
      reasoningTokens: null == reasoningTokens
          ? _self.reasoningTokens
          : reasoningTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
