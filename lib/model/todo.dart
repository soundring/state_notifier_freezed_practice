import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    String id, // uuidで割りつける予定
    String title,
    @Default(false) bool completed,
  }) = TodoData;
}
