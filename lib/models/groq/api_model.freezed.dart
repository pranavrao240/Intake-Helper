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
mixin _$GroqModel {
  String get id;
  String get object;
  String get status;
  @JsonKey(name: 'created_at')
  int get createdAt;
  List<GroqOutput> get output;
  @JsonKey(name: 'previous_response_id')
  String? get previousResponseId;
  String get model;
  GroqReasoning get reasoning;
  @JsonKey(name: 'max_output_tokens')
  int? get maxOutputTokens;
  GroqText get text;
  List<dynamic> get tools;
  @JsonKey(name: 'tool_choice')
  String get toolChoice;
  String get truncation;
  Map<String, dynamic> get metadata;
  dynamic get groq;
  double get temperature;
  @JsonKey(name: 'top_p')
  double get topP;
  dynamic get user;
  @JsonKey(name: 'service_tier')
  String get serviceTier;
  bool get background;
  dynamic get error;
  @JsonKey(name: 'incomplete_details')
  dynamic get incompleteDetails;
  GroqUsage get usage;
  @JsonKey(name: 'parallel_tool_calls')
  bool get parallelToolCalls;
  bool get store;
  @JsonKey(name: 'top_logprobs')
  dynamic get topLogprobs;
  @JsonKey(name: 'max_tool_calls')
  dynamic get maxToolCalls;

  /// Create a copy of GroqModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroqModelCopyWith<GroqModel> get copyWith =>
      _$GroqModelCopyWithImpl<GroqModel>(this as GroqModel, _$identity);

  /// Serializes this GroqModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroqModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.output, output) &&
            (identical(other.previousResponseId, previousResponseId) ||
                other.previousResponseId == previousResponseId) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.maxOutputTokens, maxOutputTokens) ||
                other.maxOutputTokens == maxOutputTokens) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other.tools, tools) &&
            (identical(other.toolChoice, toolChoice) ||
                other.toolChoice == toolChoice) &&
            (identical(other.truncation, truncation) ||
                other.truncation == truncation) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            const DeepCollectionEquality().equals(other.groq, groq) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            (identical(other.serviceTier, serviceTier) ||
                other.serviceTier == serviceTier) &&
            (identical(other.background, background) ||
                other.background == background) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.incompleteDetails, incompleteDetails) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            (identical(other.parallelToolCalls, parallelToolCalls) ||
                other.parallelToolCalls == parallelToolCalls) &&
            (identical(other.store, store) || other.store == store) &&
            const DeepCollectionEquality()
                .equals(other.topLogprobs, topLogprobs) &&
            const DeepCollectionEquality()
                .equals(other.maxToolCalls, maxToolCalls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        object,
        status,
        createdAt,
        const DeepCollectionEquality().hash(output),
        previousResponseId,
        model,
        reasoning,
        maxOutputTokens,
        text,
        const DeepCollectionEquality().hash(tools),
        toolChoice,
        truncation,
        const DeepCollectionEquality().hash(metadata),
        const DeepCollectionEquality().hash(groq),
        temperature,
        topP,
        const DeepCollectionEquality().hash(user),
        serviceTier,
        background,
        const DeepCollectionEquality().hash(error),
        const DeepCollectionEquality().hash(incompleteDetails),
        usage,
        parallelToolCalls,
        store,
        const DeepCollectionEquality().hash(topLogprobs),
        const DeepCollectionEquality().hash(maxToolCalls)
      ]);

  @override
  String toString() {
    return 'GroqModel(id: $id, object: $object, status: $status, createdAt: $createdAt, output: $output, previousResponseId: $previousResponseId, model: $model, reasoning: $reasoning, maxOutputTokens: $maxOutputTokens, text: $text, tools: $tools, toolChoice: $toolChoice, truncation: $truncation, metadata: $metadata, groq: $groq, temperature: $temperature, topP: $topP, user: $user, serviceTier: $serviceTier, background: $background, error: $error, incompleteDetails: $incompleteDetails, usage: $usage, parallelToolCalls: $parallelToolCalls, store: $store, topLogprobs: $topLogprobs, maxToolCalls: $maxToolCalls)';
  }
}

/// @nodoc
abstract mixin class $GroqModelCopyWith<$Res> {
  factory $GroqModelCopyWith(GroqModel value, $Res Function(GroqModel) _then) =
      _$GroqModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String object,
      String status,
      @JsonKey(name: 'created_at') int createdAt,
      List<GroqOutput> output,
      @JsonKey(name: 'previous_response_id') String? previousResponseId,
      String model,
      GroqReasoning reasoning,
      @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
      GroqText text,
      List<dynamic> tools,
      @JsonKey(name: 'tool_choice') String toolChoice,
      String truncation,
      Map<String, dynamic> metadata,
      dynamic groq,
      double temperature,
      @JsonKey(name: 'top_p') double topP,
      dynamic user,
      @JsonKey(name: 'service_tier') String serviceTier,
      bool background,
      dynamic error,
      @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
      GroqUsage usage,
      @JsonKey(name: 'parallel_tool_calls') bool parallelToolCalls,
      bool store,
      @JsonKey(name: 'top_logprobs') dynamic topLogprobs,
      @JsonKey(name: 'max_tool_calls') dynamic maxToolCalls});

  $GroqReasoningCopyWith<$Res> get reasoning;
  $GroqTextCopyWith<$Res> get text;
  $GroqUsageCopyWith<$Res> get usage;
}

/// @nodoc
class _$GroqModelCopyWithImpl<$Res> implements $GroqModelCopyWith<$Res> {
  _$GroqModelCopyWithImpl(this._self, this._then);

  final GroqModel _self;
  final $Res Function(GroqModel) _then;

  /// Create a copy of GroqModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? status = null,
    Object? createdAt = null,
    Object? output = null,
    Object? previousResponseId = freezed,
    Object? model = null,
    Object? reasoning = null,
    Object? maxOutputTokens = freezed,
    Object? text = null,
    Object? tools = null,
    Object? toolChoice = null,
    Object? truncation = null,
    Object? metadata = null,
    Object? groq = freezed,
    Object? temperature = null,
    Object? topP = null,
    Object? user = freezed,
    Object? serviceTier = null,
    Object? background = null,
    Object? error = freezed,
    Object? incompleteDetails = freezed,
    Object? usage = null,
    Object? parallelToolCalls = null,
    Object? store = null,
    Object? topLogprobs = freezed,
    Object? maxToolCalls = freezed,
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
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      output: null == output
          ? _self.output
          : output // ignore: cast_nullable_to_non_nullable
              as List<GroqOutput>,
      previousResponseId: freezed == previousResponseId
          ? _self.previousResponseId
          : previousResponseId // ignore: cast_nullable_to_non_nullable
              as String?,
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      reasoning: null == reasoning
          ? _self.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as GroqReasoning,
      maxOutputTokens: freezed == maxOutputTokens
          ? _self.maxOutputTokens
          : maxOutputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as GroqText,
      tools: null == tools
          ? _self.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      toolChoice: null == toolChoice
          ? _self.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as String,
      truncation: null == truncation
          ? _self.truncation
          : truncation // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      groq: freezed == groq
          ? _self.groq
          : groq // ignore: cast_nullable_to_non_nullable
              as dynamic,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      topP: null == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      serviceTier: null == serviceTier
          ? _self.serviceTier
          : serviceTier // ignore: cast_nullable_to_non_nullable
              as String,
      background: null == background
          ? _self.background
          : background // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      incompleteDetails: freezed == incompleteDetails
          ? _self.incompleteDetails
          : incompleteDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      usage: null == usage
          ? _self.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as GroqUsage,
      parallelToolCalls: null == parallelToolCalls
          ? _self.parallelToolCalls
          : parallelToolCalls // ignore: cast_nullable_to_non_nullable
              as bool,
      store: null == store
          ? _self.store
          : store // ignore: cast_nullable_to_non_nullable
              as bool,
      topLogprobs: freezed == topLogprobs
          ? _self.topLogprobs
          : topLogprobs // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxToolCalls: freezed == maxToolCalls
          ? _self.maxToolCalls
          : maxToolCalls // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of GroqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqReasoningCopyWith<$Res> get reasoning {
    return $GroqReasoningCopyWith<$Res>(_self.reasoning, (value) {
      return _then(_self.copyWith(reasoning: value));
    });
  }

  /// Create a copy of GroqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqTextCopyWith<$Res> get text {
    return $GroqTextCopyWith<$Res>(_self.text, (value) {
      return _then(_self.copyWith(text: value));
    });
  }

  /// Create a copy of GroqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqUsageCopyWith<$Res> get usage {
    return $GroqUsageCopyWith<$Res>(_self.usage, (value) {
      return _then(_self.copyWith(usage: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GroqModel].
extension GroqModelPatterns on GroqModel {
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
    TResult Function(_GroqModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqModel() when $default != null:
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
    TResult Function(_GroqModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqModel():
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
    TResult? Function(_GroqModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqModel() when $default != null:
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
            String status,
            @JsonKey(name: 'created_at') int createdAt,
            List<GroqOutput> output,
            @JsonKey(name: 'previous_response_id') String? previousResponseId,
            String model,
            GroqReasoning reasoning,
            @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
            GroqText text,
            List<dynamic> tools,
            @JsonKey(name: 'tool_choice') String toolChoice,
            String truncation,
            Map<String, dynamic> metadata,
            dynamic groq,
            double temperature,
            @JsonKey(name: 'top_p') double topP,
            dynamic user,
            @JsonKey(name: 'service_tier') String serviceTier,
            bool background,
            dynamic error,
            @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
            GroqUsage usage,
            @JsonKey(name: 'parallel_tool_calls') bool parallelToolCalls,
            bool store,
            @JsonKey(name: 'top_logprobs') dynamic topLogprobs,
            @JsonKey(name: 'max_tool_calls') dynamic maxToolCalls)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqModel() when $default != null:
        return $default(
            _that.id,
            _that.object,
            _that.status,
            _that.createdAt,
            _that.output,
            _that.previousResponseId,
            _that.model,
            _that.reasoning,
            _that.maxOutputTokens,
            _that.text,
            _that.tools,
            _that.toolChoice,
            _that.truncation,
            _that.metadata,
            _that.groq,
            _that.temperature,
            _that.topP,
            _that.user,
            _that.serviceTier,
            _that.background,
            _that.error,
            _that.incompleteDetails,
            _that.usage,
            _that.parallelToolCalls,
            _that.store,
            _that.topLogprobs,
            _that.maxToolCalls);
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
            String status,
            @JsonKey(name: 'created_at') int createdAt,
            List<GroqOutput> output,
            @JsonKey(name: 'previous_response_id') String? previousResponseId,
            String model,
            GroqReasoning reasoning,
            @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
            GroqText text,
            List<dynamic> tools,
            @JsonKey(name: 'tool_choice') String toolChoice,
            String truncation,
            Map<String, dynamic> metadata,
            dynamic groq,
            double temperature,
            @JsonKey(name: 'top_p') double topP,
            dynamic user,
            @JsonKey(name: 'service_tier') String serviceTier,
            bool background,
            dynamic error,
            @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
            GroqUsage usage,
            @JsonKey(name: 'parallel_tool_calls') bool parallelToolCalls,
            bool store,
            @JsonKey(name: 'top_logprobs') dynamic topLogprobs,
            @JsonKey(name: 'max_tool_calls') dynamic maxToolCalls)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqModel():
        return $default(
            _that.id,
            _that.object,
            _that.status,
            _that.createdAt,
            _that.output,
            _that.previousResponseId,
            _that.model,
            _that.reasoning,
            _that.maxOutputTokens,
            _that.text,
            _that.tools,
            _that.toolChoice,
            _that.truncation,
            _that.metadata,
            _that.groq,
            _that.temperature,
            _that.topP,
            _that.user,
            _that.serviceTier,
            _that.background,
            _that.error,
            _that.incompleteDetails,
            _that.usage,
            _that.parallelToolCalls,
            _that.store,
            _that.topLogprobs,
            _that.maxToolCalls);
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
            String status,
            @JsonKey(name: 'created_at') int createdAt,
            List<GroqOutput> output,
            @JsonKey(name: 'previous_response_id') String? previousResponseId,
            String model,
            GroqReasoning reasoning,
            @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
            GroqText text,
            List<dynamic> tools,
            @JsonKey(name: 'tool_choice') String toolChoice,
            String truncation,
            Map<String, dynamic> metadata,
            dynamic groq,
            double temperature,
            @JsonKey(name: 'top_p') double topP,
            dynamic user,
            @JsonKey(name: 'service_tier') String serviceTier,
            bool background,
            dynamic error,
            @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
            GroqUsage usage,
            @JsonKey(name: 'parallel_tool_calls') bool parallelToolCalls,
            bool store,
            @JsonKey(name: 'top_logprobs') dynamic topLogprobs,
            @JsonKey(name: 'max_tool_calls') dynamic maxToolCalls)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqModel() when $default != null:
        return $default(
            _that.id,
            _that.object,
            _that.status,
            _that.createdAt,
            _that.output,
            _that.previousResponseId,
            _that.model,
            _that.reasoning,
            _that.maxOutputTokens,
            _that.text,
            _that.tools,
            _that.toolChoice,
            _that.truncation,
            _that.metadata,
            _that.groq,
            _that.temperature,
            _that.topP,
            _that.user,
            _that.serviceTier,
            _that.background,
            _that.error,
            _that.incompleteDetails,
            _that.usage,
            _that.parallelToolCalls,
            _that.store,
            _that.topLogprobs,
            _that.maxToolCalls);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroqModel implements GroqModel {
  const _GroqModel(
      {required this.id,
      required this.object,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      required final List<GroqOutput> output,
      @JsonKey(name: 'previous_response_id') this.previousResponseId,
      required this.model,
      required this.reasoning,
      @JsonKey(name: 'max_output_tokens') this.maxOutputTokens,
      required this.text,
      required final List<dynamic> tools,
      @JsonKey(name: 'tool_choice') required this.toolChoice,
      required this.truncation,
      required final Map<String, dynamic> metadata,
      this.groq,
      required this.temperature,
      @JsonKey(name: 'top_p') required this.topP,
      this.user,
      @JsonKey(name: 'service_tier') required this.serviceTier,
      required this.background,
      this.error,
      @JsonKey(name: 'incomplete_details') this.incompleteDetails,
      required this.usage,
      @JsonKey(name: 'parallel_tool_calls') required this.parallelToolCalls,
      required this.store,
      @JsonKey(name: 'top_logprobs') this.topLogprobs,
      @JsonKey(name: 'max_tool_calls') this.maxToolCalls})
      : _output = output,
        _tools = tools,
        _metadata = metadata;
  factory _GroqModel.fromJson(Map<String, dynamic> json) =>
      _$GroqModelFromJson(json);

  @override
  final String id;
  @override
  final String object;
  @override
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  final List<GroqOutput> _output;
  @override
  List<GroqOutput> get output {
    if (_output is EqualUnmodifiableListView) return _output;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_output);
  }

  @override
  @JsonKey(name: 'previous_response_id')
  final String? previousResponseId;
  @override
  final String model;
  @override
  final GroqReasoning reasoning;
  @override
  @JsonKey(name: 'max_output_tokens')
  final int? maxOutputTokens;
  @override
  final GroqText text;
  final List<dynamic> _tools;
  @override
  List<dynamic> get tools {
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tools);
  }

  @override
  @JsonKey(name: 'tool_choice')
  final String toolChoice;
  @override
  final String truncation;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final dynamic groq;
  @override
  final double temperature;
  @override
  @JsonKey(name: 'top_p')
  final double topP;
  @override
  final dynamic user;
  @override
  @JsonKey(name: 'service_tier')
  final String serviceTier;
  @override
  final bool background;
  @override
  final dynamic error;
  @override
  @JsonKey(name: 'incomplete_details')
  final dynamic incompleteDetails;
  @override
  final GroqUsage usage;
  @override
  @JsonKey(name: 'parallel_tool_calls')
  final bool parallelToolCalls;
  @override
  final bool store;
  @override
  @JsonKey(name: 'top_logprobs')
  final dynamic topLogprobs;
  @override
  @JsonKey(name: 'max_tool_calls')
  final dynamic maxToolCalls;

  /// Create a copy of GroqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroqModelCopyWith<_GroqModel> get copyWith =>
      __$GroqModelCopyWithImpl<_GroqModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroqModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroqModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._output, _output) &&
            (identical(other.previousResponseId, previousResponseId) ||
                other.previousResponseId == previousResponseId) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.maxOutputTokens, maxOutputTokens) ||
                other.maxOutputTokens == maxOutputTokens) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            (identical(other.toolChoice, toolChoice) ||
                other.toolChoice == toolChoice) &&
            (identical(other.truncation, truncation) ||
                other.truncation == truncation) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality().equals(other.groq, groq) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            (identical(other.serviceTier, serviceTier) ||
                other.serviceTier == serviceTier) &&
            (identical(other.background, background) ||
                other.background == background) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.incompleteDetails, incompleteDetails) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            (identical(other.parallelToolCalls, parallelToolCalls) ||
                other.parallelToolCalls == parallelToolCalls) &&
            (identical(other.store, store) || other.store == store) &&
            const DeepCollectionEquality()
                .equals(other.topLogprobs, topLogprobs) &&
            const DeepCollectionEquality()
                .equals(other.maxToolCalls, maxToolCalls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        object,
        status,
        createdAt,
        const DeepCollectionEquality().hash(_output),
        previousResponseId,
        model,
        reasoning,
        maxOutputTokens,
        text,
        const DeepCollectionEquality().hash(_tools),
        toolChoice,
        truncation,
        const DeepCollectionEquality().hash(_metadata),
        const DeepCollectionEquality().hash(groq),
        temperature,
        topP,
        const DeepCollectionEquality().hash(user),
        serviceTier,
        background,
        const DeepCollectionEquality().hash(error),
        const DeepCollectionEquality().hash(incompleteDetails),
        usage,
        parallelToolCalls,
        store,
        const DeepCollectionEquality().hash(topLogprobs),
        const DeepCollectionEquality().hash(maxToolCalls)
      ]);

  @override
  String toString() {
    return 'GroqModel(id: $id, object: $object, status: $status, createdAt: $createdAt, output: $output, previousResponseId: $previousResponseId, model: $model, reasoning: $reasoning, maxOutputTokens: $maxOutputTokens, text: $text, tools: $tools, toolChoice: $toolChoice, truncation: $truncation, metadata: $metadata, groq: $groq, temperature: $temperature, topP: $topP, user: $user, serviceTier: $serviceTier, background: $background, error: $error, incompleteDetails: $incompleteDetails, usage: $usage, parallelToolCalls: $parallelToolCalls, store: $store, topLogprobs: $topLogprobs, maxToolCalls: $maxToolCalls)';
  }
}

/// @nodoc
abstract mixin class _$GroqModelCopyWith<$Res>
    implements $GroqModelCopyWith<$Res> {
  factory _$GroqModelCopyWith(
          _GroqModel value, $Res Function(_GroqModel) _then) =
      __$GroqModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String object,
      String status,
      @JsonKey(name: 'created_at') int createdAt,
      List<GroqOutput> output,
      @JsonKey(name: 'previous_response_id') String? previousResponseId,
      String model,
      GroqReasoning reasoning,
      @JsonKey(name: 'max_output_tokens') int? maxOutputTokens,
      GroqText text,
      List<dynamic> tools,
      @JsonKey(name: 'tool_choice') String toolChoice,
      String truncation,
      Map<String, dynamic> metadata,
      dynamic groq,
      double temperature,
      @JsonKey(name: 'top_p') double topP,
      dynamic user,
      @JsonKey(name: 'service_tier') String serviceTier,
      bool background,
      dynamic error,
      @JsonKey(name: 'incomplete_details') dynamic incompleteDetails,
      GroqUsage usage,
      @JsonKey(name: 'parallel_tool_calls') bool parallelToolCalls,
      bool store,
      @JsonKey(name: 'top_logprobs') dynamic topLogprobs,
      @JsonKey(name: 'max_tool_calls') dynamic maxToolCalls});

  @override
  $GroqReasoningCopyWith<$Res> get reasoning;
  @override
  $GroqTextCopyWith<$Res> get text;
  @override
  $GroqUsageCopyWith<$Res> get usage;
}

/// @nodoc
class __$GroqModelCopyWithImpl<$Res> implements _$GroqModelCopyWith<$Res> {
  __$GroqModelCopyWithImpl(this._self, this._then);

  final _GroqModel _self;
  final $Res Function(_GroqModel) _then;

  /// Create a copy of GroqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? status = null,
    Object? createdAt = null,
    Object? output = null,
    Object? previousResponseId = freezed,
    Object? model = null,
    Object? reasoning = null,
    Object? maxOutputTokens = freezed,
    Object? text = null,
    Object? tools = null,
    Object? toolChoice = null,
    Object? truncation = null,
    Object? metadata = null,
    Object? groq = freezed,
    Object? temperature = null,
    Object? topP = null,
    Object? user = freezed,
    Object? serviceTier = null,
    Object? background = null,
    Object? error = freezed,
    Object? incompleteDetails = freezed,
    Object? usage = null,
    Object? parallelToolCalls = null,
    Object? store = null,
    Object? topLogprobs = freezed,
    Object? maxToolCalls = freezed,
  }) {
    return _then(_GroqModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      output: null == output
          ? _self._output
          : output // ignore: cast_nullable_to_non_nullable
              as List<GroqOutput>,
      previousResponseId: freezed == previousResponseId
          ? _self.previousResponseId
          : previousResponseId // ignore: cast_nullable_to_non_nullable
              as String?,
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      reasoning: null == reasoning
          ? _self.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as GroqReasoning,
      maxOutputTokens: freezed == maxOutputTokens
          ? _self.maxOutputTokens
          : maxOutputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as GroqText,
      tools: null == tools
          ? _self._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      toolChoice: null == toolChoice
          ? _self.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as String,
      truncation: null == truncation
          ? _self.truncation
          : truncation // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      groq: freezed == groq
          ? _self.groq
          : groq // ignore: cast_nullable_to_non_nullable
              as dynamic,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      topP: null == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      serviceTier: null == serviceTier
          ? _self.serviceTier
          : serviceTier // ignore: cast_nullable_to_non_nullable
              as String,
      background: null == background
          ? _self.background
          : background // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      incompleteDetails: freezed == incompleteDetails
          ? _self.incompleteDetails
          : incompleteDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      usage: null == usage
          ? _self.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as GroqUsage,
      parallelToolCalls: null == parallelToolCalls
          ? _self.parallelToolCalls
          : parallelToolCalls // ignore: cast_nullable_to_non_nullable
              as bool,
      store: null == store
          ? _self.store
          : store // ignore: cast_nullable_to_non_nullable
              as bool,
      topLogprobs: freezed == topLogprobs
          ? _self.topLogprobs
          : topLogprobs // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxToolCalls: freezed == maxToolCalls
          ? _self.maxToolCalls
          : maxToolCalls // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of GroqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqReasoningCopyWith<$Res> get reasoning {
    return $GroqReasoningCopyWith<$Res>(_self.reasoning, (value) {
      return _then(_self.copyWith(reasoning: value));
    });
  }

  /// Create a copy of GroqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqTextCopyWith<$Res> get text {
    return $GroqTextCopyWith<$Res>(_self.text, (value) {
      return _then(_self.copyWith(text: value));
    });
  }

  /// Create a copy of GroqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqUsageCopyWith<$Res> get usage {
    return $GroqUsageCopyWith<$Res>(_self.usage, (value) {
      return _then(_self.copyWith(usage: value));
    });
  }
}

/// @nodoc
mixin _$GroqOutput {
  String get type;
  String get id;
  String get status;
  List<GroqContent> get content;
  String? get role;
  List<dynamic>? get summary;

  /// Create a copy of GroqOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroqOutputCopyWith<GroqOutput> get copyWith =>
      _$GroqOutputCopyWithImpl<GroqOutput>(this as GroqOutput, _$identity);

  /// Serializes this GroqOutput to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroqOutput &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other.summary, summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      status,
      const DeepCollectionEquality().hash(content),
      role,
      const DeepCollectionEquality().hash(summary));

  @override
  String toString() {
    return 'GroqOutput(type: $type, id: $id, status: $status, content: $content, role: $role, summary: $summary)';
  }
}

/// @nodoc
abstract mixin class $GroqOutputCopyWith<$Res> {
  factory $GroqOutputCopyWith(
          GroqOutput value, $Res Function(GroqOutput) _then) =
      _$GroqOutputCopyWithImpl;
  @useResult
  $Res call(
      {String type,
      String id,
      String status,
      List<GroqContent> content,
      String? role,
      List<dynamic>? summary});
}

/// @nodoc
class _$GroqOutputCopyWithImpl<$Res> implements $GroqOutputCopyWith<$Res> {
  _$GroqOutputCopyWithImpl(this._self, this._then);

  final GroqOutput _self;
  final $Res Function(GroqOutput) _then;

  /// Create a copy of GroqOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? status = null,
    Object? content = null,
    Object? role = freezed,
    Object? summary = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<GroqContent>,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [GroqOutput].
extension GroqOutputPatterns on GroqOutput {
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
    TResult Function(_GroqOutput value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqOutput() when $default != null:
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
    TResult Function(_GroqOutput value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqOutput():
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
    TResult? Function(_GroqOutput value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqOutput() when $default != null:
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
    TResult Function(String type, String id, String status,
            List<GroqContent> content, String? role, List<dynamic>? summary)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqOutput() when $default != null:
        return $default(_that.type, _that.id, _that.status, _that.content,
            _that.role, _that.summary);
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
    TResult Function(String type, String id, String status,
            List<GroqContent> content, String? role, List<dynamic>? summary)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqOutput():
        return $default(_that.type, _that.id, _that.status, _that.content,
            _that.role, _that.summary);
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
    TResult? Function(String type, String id, String status,
            List<GroqContent> content, String? role, List<dynamic>? summary)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqOutput() when $default != null:
        return $default(_that.type, _that.id, _that.status, _that.content,
            _that.role, _that.summary);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroqOutput implements GroqOutput {
  const _GroqOutput(
      {required this.type,
      required this.id,
      required this.status,
      required final List<GroqContent> content,
      this.role,
      final List<dynamic>? summary})
      : _content = content,
        _summary = summary;
  factory _GroqOutput.fromJson(Map<String, dynamic> json) =>
      _$GroqOutputFromJson(json);

  @override
  final String type;
  @override
  final String id;
  @override
  final String status;
  final List<GroqContent> _content;
  @override
  List<GroqContent> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final String? role;
  final List<dynamic>? _summary;
  @override
  List<dynamic>? get summary {
    final value = _summary;
    if (value == null) return null;
    if (_summary is EqualUnmodifiableListView) return _summary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of GroqOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroqOutputCopyWith<_GroqOutput> get copyWith =>
      __$GroqOutputCopyWithImpl<_GroqOutput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroqOutputToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroqOutput &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other._summary, _summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      status,
      const DeepCollectionEquality().hash(_content),
      role,
      const DeepCollectionEquality().hash(_summary));

  @override
  String toString() {
    return 'GroqOutput(type: $type, id: $id, status: $status, content: $content, role: $role, summary: $summary)';
  }
}

/// @nodoc
abstract mixin class _$GroqOutputCopyWith<$Res>
    implements $GroqOutputCopyWith<$Res> {
  factory _$GroqOutputCopyWith(
          _GroqOutput value, $Res Function(_GroqOutput) _then) =
      __$GroqOutputCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String type,
      String id,
      String status,
      List<GroqContent> content,
      String? role,
      List<dynamic>? summary});
}

/// @nodoc
class __$GroqOutputCopyWithImpl<$Res> implements _$GroqOutputCopyWith<$Res> {
  __$GroqOutputCopyWithImpl(this._self, this._then);

  final _GroqOutput _self;
  final $Res Function(_GroqOutput) _then;

  /// Create a copy of GroqOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? status = null,
    Object? content = null,
    Object? role = freezed,
    Object? summary = freezed,
  }) {
    return _then(_GroqOutput(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<GroqContent>,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _self._summary
          : summary // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
mixin _$GroqContent {
  String get type;
  String? get text;
  List<dynamic>? get annotations;
  dynamic get logprobs;

  /// Create a copy of GroqContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroqContentCopyWith<GroqContent> get copyWith =>
      _$GroqContentCopyWithImpl<GroqContent>(this as GroqContent, _$identity);

  /// Serializes this GroqContent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroqContent &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other.annotations, annotations) &&
            const DeepCollectionEquality().equals(other.logprobs, logprobs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      text,
      const DeepCollectionEquality().hash(annotations),
      const DeepCollectionEquality().hash(logprobs));

  @override
  String toString() {
    return 'GroqContent(type: $type, text: $text, annotations: $annotations, logprobs: $logprobs)';
  }
}

/// @nodoc
abstract mixin class $GroqContentCopyWith<$Res> {
  factory $GroqContentCopyWith(
          GroqContent value, $Res Function(GroqContent) _then) =
      _$GroqContentCopyWithImpl;
  @useResult
  $Res call(
      {String type,
      String? text,
      List<dynamic>? annotations,
      dynamic logprobs});
}

/// @nodoc
class _$GroqContentCopyWithImpl<$Res> implements $GroqContentCopyWith<$Res> {
  _$GroqContentCopyWithImpl(this._self, this._then);

  final GroqContent _self;
  final $Res Function(GroqContent) _then;

  /// Create a copy of GroqContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = freezed,
    Object? annotations = freezed,
    Object? logprobs = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      annotations: freezed == annotations
          ? _self.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      logprobs: freezed == logprobs
          ? _self.logprobs
          : logprobs // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// Adds pattern-matching-related methods to [GroqContent].
extension GroqContentPatterns on GroqContent {
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
    TResult Function(_GroqContent value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqContent() when $default != null:
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
    TResult Function(_GroqContent value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqContent():
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
    TResult? Function(_GroqContent value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqContent() when $default != null:
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
    TResult Function(String type, String? text, List<dynamic>? annotations,
            dynamic logprobs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqContent() when $default != null:
        return $default(
            _that.type, _that.text, _that.annotations, _that.logprobs);
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
    TResult Function(String type, String? text, List<dynamic>? annotations,
            dynamic logprobs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqContent():
        return $default(
            _that.type, _that.text, _that.annotations, _that.logprobs);
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
    TResult? Function(String type, String? text, List<dynamic>? annotations,
            dynamic logprobs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqContent() when $default != null:
        return $default(
            _that.type, _that.text, _that.annotations, _that.logprobs);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroqContent implements GroqContent {
  const _GroqContent(
      {required this.type,
      this.text,
      final List<dynamic>? annotations,
      this.logprobs})
      : _annotations = annotations;
  factory _GroqContent.fromJson(Map<String, dynamic> json) =>
      _$GroqContentFromJson(json);

  @override
  final String type;
  @override
  final String? text;
  final List<dynamic>? _annotations;
  @override
  List<dynamic>? get annotations {
    final value = _annotations;
    if (value == null) return null;
    if (_annotations is EqualUnmodifiableListView) return _annotations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic logprobs;

  /// Create a copy of GroqContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroqContentCopyWith<_GroqContent> get copyWith =>
      __$GroqContentCopyWithImpl<_GroqContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroqContentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroqContent &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._annotations, _annotations) &&
            const DeepCollectionEquality().equals(other.logprobs, logprobs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      text,
      const DeepCollectionEquality().hash(_annotations),
      const DeepCollectionEquality().hash(logprobs));

  @override
  String toString() {
    return 'GroqContent(type: $type, text: $text, annotations: $annotations, logprobs: $logprobs)';
  }
}

/// @nodoc
abstract mixin class _$GroqContentCopyWith<$Res>
    implements $GroqContentCopyWith<$Res> {
  factory _$GroqContentCopyWith(
          _GroqContent value, $Res Function(_GroqContent) _then) =
      __$GroqContentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String type,
      String? text,
      List<dynamic>? annotations,
      dynamic logprobs});
}

/// @nodoc
class __$GroqContentCopyWithImpl<$Res> implements _$GroqContentCopyWith<$Res> {
  __$GroqContentCopyWithImpl(this._self, this._then);

  final _GroqContent _self;
  final $Res Function(_GroqContent) _then;

  /// Create a copy of GroqContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? text = freezed,
    Object? annotations = freezed,
    Object? logprobs = freezed,
  }) {
    return _then(_GroqContent(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      annotations: freezed == annotations
          ? _self._annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      logprobs: freezed == logprobs
          ? _self.logprobs
          : logprobs // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
mixin _$GroqReasoning {
  dynamic get effort;
  List<dynamic>? get summary;

  /// Create a copy of GroqReasoning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroqReasoningCopyWith<GroqReasoning> get copyWith =>
      _$GroqReasoningCopyWithImpl<GroqReasoning>(
          this as GroqReasoning, _$identity);

  /// Serializes this GroqReasoning to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroqReasoning &&
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
    return 'GroqReasoning(effort: $effort, summary: $summary)';
  }
}

/// @nodoc
abstract mixin class $GroqReasoningCopyWith<$Res> {
  factory $GroqReasoningCopyWith(
          GroqReasoning value, $Res Function(GroqReasoning) _then) =
      _$GroqReasoningCopyWithImpl;
  @useResult
  $Res call({dynamic effort, List<dynamic>? summary});
}

/// @nodoc
class _$GroqReasoningCopyWithImpl<$Res>
    implements $GroqReasoningCopyWith<$Res> {
  _$GroqReasoningCopyWithImpl(this._self, this._then);

  final GroqReasoning _self;
  final $Res Function(GroqReasoning) _then;

  /// Create a copy of GroqReasoning
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
              as List<dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [GroqReasoning].
extension GroqReasoningPatterns on GroqReasoning {
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
    TResult Function(_GroqReasoning value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqReasoning() when $default != null:
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
    TResult Function(_GroqReasoning value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqReasoning():
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
    TResult? Function(_GroqReasoning value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqReasoning() when $default != null:
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
    TResult Function(dynamic effort, List<dynamic>? summary)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqReasoning() when $default != null:
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
    TResult Function(dynamic effort, List<dynamic>? summary) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqReasoning():
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
    TResult? Function(dynamic effort, List<dynamic>? summary)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqReasoning() when $default != null:
        return $default(_that.effort, _that.summary);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroqReasoning implements GroqReasoning {
  const _GroqReasoning({this.effort, final List<dynamic>? summary})
      : _summary = summary;
  factory _GroqReasoning.fromJson(Map<String, dynamic> json) =>
      _$GroqReasoningFromJson(json);

  @override
  final dynamic effort;
  final List<dynamic>? _summary;
  @override
  List<dynamic>? get summary {
    final value = _summary;
    if (value == null) return null;
    if (_summary is EqualUnmodifiableListView) return _summary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of GroqReasoning
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroqReasoningCopyWith<_GroqReasoning> get copyWith =>
      __$GroqReasoningCopyWithImpl<_GroqReasoning>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroqReasoningToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroqReasoning &&
            const DeepCollectionEquality().equals(other.effort, effort) &&
            const DeepCollectionEquality().equals(other._summary, _summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(effort),
      const DeepCollectionEquality().hash(_summary));

  @override
  String toString() {
    return 'GroqReasoning(effort: $effort, summary: $summary)';
  }
}

/// @nodoc
abstract mixin class _$GroqReasoningCopyWith<$Res>
    implements $GroqReasoningCopyWith<$Res> {
  factory _$GroqReasoningCopyWith(
          _GroqReasoning value, $Res Function(_GroqReasoning) _then) =
      __$GroqReasoningCopyWithImpl;
  @override
  @useResult
  $Res call({dynamic effort, List<dynamic>? summary});
}

/// @nodoc
class __$GroqReasoningCopyWithImpl<$Res>
    implements _$GroqReasoningCopyWith<$Res> {
  __$GroqReasoningCopyWithImpl(this._self, this._then);

  final _GroqReasoning _self;
  final $Res Function(_GroqReasoning) _then;

  /// Create a copy of GroqReasoning
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? effort = freezed,
    Object? summary = freezed,
  }) {
    return _then(_GroqReasoning(
      effort: freezed == effort
          ? _self.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as dynamic,
      summary: freezed == summary
          ? _self._summary
          : summary // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
mixin _$GroqText {
  GroqFormat get format;

  /// Create a copy of GroqText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroqTextCopyWith<GroqText> get copyWith =>
      _$GroqTextCopyWithImpl<GroqText>(this as GroqText, _$identity);

  /// Serializes this GroqText to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroqText &&
            (identical(other.format, format) || other.format == format));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, format);

  @override
  String toString() {
    return 'GroqText(format: $format)';
  }
}

/// @nodoc
abstract mixin class $GroqTextCopyWith<$Res> {
  factory $GroqTextCopyWith(GroqText value, $Res Function(GroqText) _then) =
      _$GroqTextCopyWithImpl;
  @useResult
  $Res call({GroqFormat format});

  $GroqFormatCopyWith<$Res> get format;
}

/// @nodoc
class _$GroqTextCopyWithImpl<$Res> implements $GroqTextCopyWith<$Res> {
  _$GroqTextCopyWithImpl(this._self, this._then);

  final GroqText _self;
  final $Res Function(GroqText) _then;

  /// Create a copy of GroqText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
  }) {
    return _then(_self.copyWith(
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as GroqFormat,
    ));
  }

  /// Create a copy of GroqText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqFormatCopyWith<$Res> get format {
    return $GroqFormatCopyWith<$Res>(_self.format, (value) {
      return _then(_self.copyWith(format: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GroqText].
extension GroqTextPatterns on GroqText {
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
    TResult Function(_GroqText value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqText() when $default != null:
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
    TResult Function(_GroqText value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqText():
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
    TResult? Function(_GroqText value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqText() when $default != null:
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
    TResult Function(GroqFormat format)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqText() when $default != null:
        return $default(_that.format);
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
    TResult Function(GroqFormat format) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqText():
        return $default(_that.format);
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
    TResult? Function(GroqFormat format)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqText() when $default != null:
        return $default(_that.format);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroqText implements GroqText {
  const _GroqText({required this.format});
  factory _GroqText.fromJson(Map<String, dynamic> json) =>
      _$GroqTextFromJson(json);

  @override
  final GroqFormat format;

  /// Create a copy of GroqText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroqTextCopyWith<_GroqText> get copyWith =>
      __$GroqTextCopyWithImpl<_GroqText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroqTextToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroqText &&
            (identical(other.format, format) || other.format == format));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, format);

  @override
  String toString() {
    return 'GroqText(format: $format)';
  }
}

/// @nodoc
abstract mixin class _$GroqTextCopyWith<$Res>
    implements $GroqTextCopyWith<$Res> {
  factory _$GroqTextCopyWith(_GroqText value, $Res Function(_GroqText) _then) =
      __$GroqTextCopyWithImpl;
  @override
  @useResult
  $Res call({GroqFormat format});

  @override
  $GroqFormatCopyWith<$Res> get format;
}

/// @nodoc
class __$GroqTextCopyWithImpl<$Res> implements _$GroqTextCopyWith<$Res> {
  __$GroqTextCopyWithImpl(this._self, this._then);

  final _GroqText _self;
  final $Res Function(_GroqText) _then;

  /// Create a copy of GroqText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? format = null,
  }) {
    return _then(_GroqText(
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as GroqFormat,
    ));
  }

  /// Create a copy of GroqText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqFormatCopyWith<$Res> get format {
    return $GroqFormatCopyWith<$Res>(_self.format, (value) {
      return _then(_self.copyWith(format: value));
    });
  }
}

/// @nodoc
mixin _$GroqFormat {
  String get type;

  /// Create a copy of GroqFormat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroqFormatCopyWith<GroqFormat> get copyWith =>
      _$GroqFormatCopyWithImpl<GroqFormat>(this as GroqFormat, _$identity);

  /// Serializes this GroqFormat to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroqFormat &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'GroqFormat(type: $type)';
  }
}

/// @nodoc
abstract mixin class $GroqFormatCopyWith<$Res> {
  factory $GroqFormatCopyWith(
          GroqFormat value, $Res Function(GroqFormat) _then) =
      _$GroqFormatCopyWithImpl;
  @useResult
  $Res call({String type});
}

/// @nodoc
class _$GroqFormatCopyWithImpl<$Res> implements $GroqFormatCopyWith<$Res> {
  _$GroqFormatCopyWithImpl(this._self, this._then);

  final GroqFormat _self;
  final $Res Function(GroqFormat) _then;

  /// Create a copy of GroqFormat
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

/// Adds pattern-matching-related methods to [GroqFormat].
extension GroqFormatPatterns on GroqFormat {
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
    TResult Function(_GroqFormat value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqFormat() when $default != null:
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
    TResult Function(_GroqFormat value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqFormat():
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
    TResult? Function(_GroqFormat value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqFormat() when $default != null:
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
      case _GroqFormat() when $default != null:
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
      case _GroqFormat():
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
      case _GroqFormat() when $default != null:
        return $default(_that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroqFormat implements GroqFormat {
  const _GroqFormat({required this.type});
  factory _GroqFormat.fromJson(Map<String, dynamic> json) =>
      _$GroqFormatFromJson(json);

  @override
  final String type;

  /// Create a copy of GroqFormat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroqFormatCopyWith<_GroqFormat> get copyWith =>
      __$GroqFormatCopyWithImpl<_GroqFormat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroqFormatToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroqFormat &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'GroqFormat(type: $type)';
  }
}

/// @nodoc
abstract mixin class _$GroqFormatCopyWith<$Res>
    implements $GroqFormatCopyWith<$Res> {
  factory _$GroqFormatCopyWith(
          _GroqFormat value, $Res Function(_GroqFormat) _then) =
      __$GroqFormatCopyWithImpl;
  @override
  @useResult
  $Res call({String type});
}

/// @nodoc
class __$GroqFormatCopyWithImpl<$Res> implements _$GroqFormatCopyWith<$Res> {
  __$GroqFormatCopyWithImpl(this._self, this._then);

  final _GroqFormat _self;
  final $Res Function(_GroqFormat) _then;

  /// Create a copy of GroqFormat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
  }) {
    return _then(_GroqFormat(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$GroqUsage {
  @JsonKey(name: 'input_tokens')
  int get inputTokens;
  @JsonKey(name: 'input_tokens_details')
  GroqInputTokensDetails get inputTokensDetails;
  @JsonKey(name: 'output_tokens')
  int get outputTokens;
  @JsonKey(name: 'output_tokens_details')
  GroqOutputTokensDetails get outputTokensDetails;
  @JsonKey(name: 'total_tokens')
  int get totalTokens;

  /// Create a copy of GroqUsage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroqUsageCopyWith<GroqUsage> get copyWith =>
      _$GroqUsageCopyWithImpl<GroqUsage>(this as GroqUsage, _$identity);

  /// Serializes this GroqUsage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroqUsage &&
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
    return 'GroqUsage(inputTokens: $inputTokens, inputTokensDetails: $inputTokensDetails, outputTokens: $outputTokens, outputTokensDetails: $outputTokensDetails, totalTokens: $totalTokens)';
  }
}

/// @nodoc
abstract mixin class $GroqUsageCopyWith<$Res> {
  factory $GroqUsageCopyWith(GroqUsage value, $Res Function(GroqUsage) _then) =
      _$GroqUsageCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'input_tokens') int inputTokens,
      @JsonKey(name: 'input_tokens_details')
      GroqInputTokensDetails inputTokensDetails,
      @JsonKey(name: 'output_tokens') int outputTokens,
      @JsonKey(name: 'output_tokens_details')
      GroqOutputTokensDetails outputTokensDetails,
      @JsonKey(name: 'total_tokens') int totalTokens});

  $GroqInputTokensDetailsCopyWith<$Res> get inputTokensDetails;
  $GroqOutputTokensDetailsCopyWith<$Res> get outputTokensDetails;
}

/// @nodoc
class _$GroqUsageCopyWithImpl<$Res> implements $GroqUsageCopyWith<$Res> {
  _$GroqUsageCopyWithImpl(this._self, this._then);

  final GroqUsage _self;
  final $Res Function(GroqUsage) _then;

  /// Create a copy of GroqUsage
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
              as GroqInputTokensDetails,
      outputTokens: null == outputTokens
          ? _self.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      outputTokensDetails: null == outputTokensDetails
          ? _self.outputTokensDetails
          : outputTokensDetails // ignore: cast_nullable_to_non_nullable
              as GroqOutputTokensDetails,
      totalTokens: null == totalTokens
          ? _self.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of GroqUsage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqInputTokensDetailsCopyWith<$Res> get inputTokensDetails {
    return $GroqInputTokensDetailsCopyWith<$Res>(_self.inputTokensDetails,
        (value) {
      return _then(_self.copyWith(inputTokensDetails: value));
    });
  }

  /// Create a copy of GroqUsage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqOutputTokensDetailsCopyWith<$Res> get outputTokensDetails {
    return $GroqOutputTokensDetailsCopyWith<$Res>(_self.outputTokensDetails,
        (value) {
      return _then(_self.copyWith(outputTokensDetails: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GroqUsage].
extension GroqUsagePatterns on GroqUsage {
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
    TResult Function(_GroqUsage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqUsage() when $default != null:
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
    TResult Function(_GroqUsage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqUsage():
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
    TResult? Function(_GroqUsage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqUsage() when $default != null:
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
            GroqInputTokensDetails inputTokensDetails,
            @JsonKey(name: 'output_tokens') int outputTokens,
            @JsonKey(name: 'output_tokens_details')
            GroqOutputTokensDetails outputTokensDetails,
            @JsonKey(name: 'total_tokens') int totalTokens)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqUsage() when $default != null:
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
            GroqInputTokensDetails inputTokensDetails,
            @JsonKey(name: 'output_tokens') int outputTokens,
            @JsonKey(name: 'output_tokens_details')
            GroqOutputTokensDetails outputTokensDetails,
            @JsonKey(name: 'total_tokens') int totalTokens)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqUsage():
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
            GroqInputTokensDetails inputTokensDetails,
            @JsonKey(name: 'output_tokens') int outputTokens,
            @JsonKey(name: 'output_tokens_details')
            GroqOutputTokensDetails outputTokensDetails,
            @JsonKey(name: 'total_tokens') int totalTokens)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqUsage() when $default != null:
        return $default(_that.inputTokens, _that.inputTokensDetails,
            _that.outputTokens, _that.outputTokensDetails, _that.totalTokens);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroqUsage implements GroqUsage {
  const _GroqUsage(
      {@JsonKey(name: 'input_tokens') required this.inputTokens,
      @JsonKey(name: 'input_tokens_details') required this.inputTokensDetails,
      @JsonKey(name: 'output_tokens') required this.outputTokens,
      @JsonKey(name: 'output_tokens_details') required this.outputTokensDetails,
      @JsonKey(name: 'total_tokens') required this.totalTokens});
  factory _GroqUsage.fromJson(Map<String, dynamic> json) =>
      _$GroqUsageFromJson(json);

  @override
  @JsonKey(name: 'input_tokens')
  final int inputTokens;
  @override
  @JsonKey(name: 'input_tokens_details')
  final GroqInputTokensDetails inputTokensDetails;
  @override
  @JsonKey(name: 'output_tokens')
  final int outputTokens;
  @override
  @JsonKey(name: 'output_tokens_details')
  final GroqOutputTokensDetails outputTokensDetails;
  @override
  @JsonKey(name: 'total_tokens')
  final int totalTokens;

  /// Create a copy of GroqUsage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroqUsageCopyWith<_GroqUsage> get copyWith =>
      __$GroqUsageCopyWithImpl<_GroqUsage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroqUsageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroqUsage &&
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
    return 'GroqUsage(inputTokens: $inputTokens, inputTokensDetails: $inputTokensDetails, outputTokens: $outputTokens, outputTokensDetails: $outputTokensDetails, totalTokens: $totalTokens)';
  }
}

/// @nodoc
abstract mixin class _$GroqUsageCopyWith<$Res>
    implements $GroqUsageCopyWith<$Res> {
  factory _$GroqUsageCopyWith(
          _GroqUsage value, $Res Function(_GroqUsage) _then) =
      __$GroqUsageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'input_tokens') int inputTokens,
      @JsonKey(name: 'input_tokens_details')
      GroqInputTokensDetails inputTokensDetails,
      @JsonKey(name: 'output_tokens') int outputTokens,
      @JsonKey(name: 'output_tokens_details')
      GroqOutputTokensDetails outputTokensDetails,
      @JsonKey(name: 'total_tokens') int totalTokens});

  @override
  $GroqInputTokensDetailsCopyWith<$Res> get inputTokensDetails;
  @override
  $GroqOutputTokensDetailsCopyWith<$Res> get outputTokensDetails;
}

/// @nodoc
class __$GroqUsageCopyWithImpl<$Res> implements _$GroqUsageCopyWith<$Res> {
  __$GroqUsageCopyWithImpl(this._self, this._then);

  final _GroqUsage _self;
  final $Res Function(_GroqUsage) _then;

  /// Create a copy of GroqUsage
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
    return _then(_GroqUsage(
      inputTokens: null == inputTokens
          ? _self.inputTokens
          : inputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      inputTokensDetails: null == inputTokensDetails
          ? _self.inputTokensDetails
          : inputTokensDetails // ignore: cast_nullable_to_non_nullable
              as GroqInputTokensDetails,
      outputTokens: null == outputTokens
          ? _self.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      outputTokensDetails: null == outputTokensDetails
          ? _self.outputTokensDetails
          : outputTokensDetails // ignore: cast_nullable_to_non_nullable
              as GroqOutputTokensDetails,
      totalTokens: null == totalTokens
          ? _self.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of GroqUsage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqInputTokensDetailsCopyWith<$Res> get inputTokensDetails {
    return $GroqInputTokensDetailsCopyWith<$Res>(_self.inputTokensDetails,
        (value) {
      return _then(_self.copyWith(inputTokensDetails: value));
    });
  }

  /// Create a copy of GroqUsage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroqOutputTokensDetailsCopyWith<$Res> get outputTokensDetails {
    return $GroqOutputTokensDetailsCopyWith<$Res>(_self.outputTokensDetails,
        (value) {
      return _then(_self.copyWith(outputTokensDetails: value));
    });
  }
}

/// @nodoc
mixin _$GroqInputTokensDetails {
  @JsonKey(name: 'cached_tokens')
  int get cachedTokens;

  /// Create a copy of GroqInputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroqInputTokensDetailsCopyWith<GroqInputTokensDetails> get copyWith =>
      _$GroqInputTokensDetailsCopyWithImpl<GroqInputTokensDetails>(
          this as GroqInputTokensDetails, _$identity);

  /// Serializes this GroqInputTokensDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroqInputTokensDetails &&
            (identical(other.cachedTokens, cachedTokens) ||
                other.cachedTokens == cachedTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cachedTokens);

  @override
  String toString() {
    return 'GroqInputTokensDetails(cachedTokens: $cachedTokens)';
  }
}

/// @nodoc
abstract mixin class $GroqInputTokensDetailsCopyWith<$Res> {
  factory $GroqInputTokensDetailsCopyWith(GroqInputTokensDetails value,
          $Res Function(GroqInputTokensDetails) _then) =
      _$GroqInputTokensDetailsCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'cached_tokens') int cachedTokens});
}

/// @nodoc
class _$GroqInputTokensDetailsCopyWithImpl<$Res>
    implements $GroqInputTokensDetailsCopyWith<$Res> {
  _$GroqInputTokensDetailsCopyWithImpl(this._self, this._then);

  final GroqInputTokensDetails _self;
  final $Res Function(GroqInputTokensDetails) _then;

  /// Create a copy of GroqInputTokensDetails
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

/// Adds pattern-matching-related methods to [GroqInputTokensDetails].
extension GroqInputTokensDetailsPatterns on GroqInputTokensDetails {
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
    TResult Function(_GroqInputTokensDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqInputTokensDetails() when $default != null:
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
    TResult Function(_GroqInputTokensDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqInputTokensDetails():
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
    TResult? Function(_GroqInputTokensDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqInputTokensDetails() when $default != null:
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
      case _GroqInputTokensDetails() when $default != null:
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
      case _GroqInputTokensDetails():
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
      case _GroqInputTokensDetails() when $default != null:
        return $default(_that.cachedTokens);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroqInputTokensDetails implements GroqInputTokensDetails {
  const _GroqInputTokensDetails(
      {@JsonKey(name: 'cached_tokens') required this.cachedTokens});
  factory _GroqInputTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$GroqInputTokensDetailsFromJson(json);

  @override
  @JsonKey(name: 'cached_tokens')
  final int cachedTokens;

  /// Create a copy of GroqInputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroqInputTokensDetailsCopyWith<_GroqInputTokensDetails> get copyWith =>
      __$GroqInputTokensDetailsCopyWithImpl<_GroqInputTokensDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroqInputTokensDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroqInputTokensDetails &&
            (identical(other.cachedTokens, cachedTokens) ||
                other.cachedTokens == cachedTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cachedTokens);

  @override
  String toString() {
    return 'GroqInputTokensDetails(cachedTokens: $cachedTokens)';
  }
}

/// @nodoc
abstract mixin class _$GroqInputTokensDetailsCopyWith<$Res>
    implements $GroqInputTokensDetailsCopyWith<$Res> {
  factory _$GroqInputTokensDetailsCopyWith(_GroqInputTokensDetails value,
          $Res Function(_GroqInputTokensDetails) _then) =
      __$GroqInputTokensDetailsCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'cached_tokens') int cachedTokens});
}

/// @nodoc
class __$GroqInputTokensDetailsCopyWithImpl<$Res>
    implements _$GroqInputTokensDetailsCopyWith<$Res> {
  __$GroqInputTokensDetailsCopyWithImpl(this._self, this._then);

  final _GroqInputTokensDetails _self;
  final $Res Function(_GroqInputTokensDetails) _then;

  /// Create a copy of GroqInputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cachedTokens = null,
  }) {
    return _then(_GroqInputTokensDetails(
      cachedTokens: null == cachedTokens
          ? _self.cachedTokens
          : cachedTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$GroqOutputTokensDetails {
  @JsonKey(name: 'reasoning_tokens')
  int get reasoningTokens;

  /// Create a copy of GroqOutputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroqOutputTokensDetailsCopyWith<GroqOutputTokensDetails> get copyWith =>
      _$GroqOutputTokensDetailsCopyWithImpl<GroqOutputTokensDetails>(
          this as GroqOutputTokensDetails, _$identity);

  /// Serializes this GroqOutputTokensDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroqOutputTokensDetails &&
            (identical(other.reasoningTokens, reasoningTokens) ||
                other.reasoningTokens == reasoningTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reasoningTokens);

  @override
  String toString() {
    return 'GroqOutputTokensDetails(reasoningTokens: $reasoningTokens)';
  }
}

/// @nodoc
abstract mixin class $GroqOutputTokensDetailsCopyWith<$Res> {
  factory $GroqOutputTokensDetailsCopyWith(GroqOutputTokensDetails value,
          $Res Function(GroqOutputTokensDetails) _then) =
      _$GroqOutputTokensDetailsCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'reasoning_tokens') int reasoningTokens});
}

/// @nodoc
class _$GroqOutputTokensDetailsCopyWithImpl<$Res>
    implements $GroqOutputTokensDetailsCopyWith<$Res> {
  _$GroqOutputTokensDetailsCopyWithImpl(this._self, this._then);

  final GroqOutputTokensDetails _self;
  final $Res Function(GroqOutputTokensDetails) _then;

  /// Create a copy of GroqOutputTokensDetails
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

/// Adds pattern-matching-related methods to [GroqOutputTokensDetails].
extension GroqOutputTokensDetailsPatterns on GroqOutputTokensDetails {
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
    TResult Function(_GroqOutputTokensDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroqOutputTokensDetails() when $default != null:
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
    TResult Function(_GroqOutputTokensDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqOutputTokensDetails():
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
    TResult? Function(_GroqOutputTokensDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroqOutputTokensDetails() when $default != null:
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
      case _GroqOutputTokensDetails() when $default != null:
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
      case _GroqOutputTokensDetails():
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
      case _GroqOutputTokensDetails() when $default != null:
        return $default(_that.reasoningTokens);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroqOutputTokensDetails implements GroqOutputTokensDetails {
  const _GroqOutputTokensDetails(
      {@JsonKey(name: 'reasoning_tokens') required this.reasoningTokens});
  factory _GroqOutputTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$GroqOutputTokensDetailsFromJson(json);

  @override
  @JsonKey(name: 'reasoning_tokens')
  final int reasoningTokens;

  /// Create a copy of GroqOutputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroqOutputTokensDetailsCopyWith<_GroqOutputTokensDetails> get copyWith =>
      __$GroqOutputTokensDetailsCopyWithImpl<_GroqOutputTokensDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroqOutputTokensDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroqOutputTokensDetails &&
            (identical(other.reasoningTokens, reasoningTokens) ||
                other.reasoningTokens == reasoningTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reasoningTokens);

  @override
  String toString() {
    return 'GroqOutputTokensDetails(reasoningTokens: $reasoningTokens)';
  }
}

/// @nodoc
abstract mixin class _$GroqOutputTokensDetailsCopyWith<$Res>
    implements $GroqOutputTokensDetailsCopyWith<$Res> {
  factory _$GroqOutputTokensDetailsCopyWith(_GroqOutputTokensDetails value,
          $Res Function(_GroqOutputTokensDetails) _then) =
      __$GroqOutputTokensDetailsCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'reasoning_tokens') int reasoningTokens});
}

/// @nodoc
class __$GroqOutputTokensDetailsCopyWithImpl<$Res>
    implements _$GroqOutputTokensDetailsCopyWith<$Res> {
  __$GroqOutputTokensDetailsCopyWithImpl(this._self, this._then);

  final _GroqOutputTokensDetails _self;
  final $Res Function(_GroqOutputTokensDetails) _then;

  /// Create a copy of GroqOutputTokensDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reasoningTokens = null,
  }) {
    return _then(_GroqOutputTokensDetails(
      reasoningTokens: null == reasoningTokens
          ? _self.reasoningTokens
          : reasoningTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
