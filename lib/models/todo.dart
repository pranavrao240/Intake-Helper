import 'package:freezed_annotation/freezed_annotation.dart';
import 'nutrition_model.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class Todo with _$Todo {
  factory Todo({
    @JsonKey(name: '_id') String? id,
    required Nutrition nutrition,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
