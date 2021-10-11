// ignore_for_file: invalid_annotation_target, implementation_imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:kt_dart/src/collection/kt_iterable.dart';

import 'package:ddd_study/domain/core/value_objects.dart';
import 'package:ddd_study/domain/notes/note.dart';
import 'package:ddd_study/domain/notes/todo_item.dart';
import 'package:ddd_study/domain/notes/value_objects.dart';

part 'note_dtos.freezed.dart';
part 'note_dtos.g.dart';

@freezed
abstract class NoteDto implements _$NoteDto {
  const NoteDto._();

  @JsonSerializable(explicitToJson: true)
  factory NoteDto({
    @JsonKey(ignore: true) String? id,
    required String body,
    required int color,
    required List<TodoItemDto> todos,
    @ServerTimesTampConverter() required FieldValue serverTimeStamp,
  }) = _NoteDto;

  factory NoteDto.fromDomain(Note note) {
    return NoteDto(
      id: note.id.getOrCrash(),
      body: note.body.getOrCrash(),
      color: note.color.getOrCrash().value,
      todos: note.todos
          .getOrCrash()
          .map((todoItem) => TodoItemDto.fromDomain(todoItem))
          .asList(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id!),
      body: NoteBody(body),
      color: NoteColor(Color(color)),
      todos: List3(todos.map((dto) => dto.toDomain()).toImmutableList()),
    );
  }

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  factory NoteDto.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    return NoteDto.fromJson(doc.data()!).copyWith(id: doc.id);
  }
}

class ServerTimesTampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimesTampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}

@freezed
class TodoItemDto with _$TodoItemDto {
  // HACK [KEEP IN RADAR]: store id inside firestore document
  const factory TodoItemDto({
    required String id,
    required String name,
    required bool done,
  }) = _TodoItemDto;

  const TodoItemDto._();

  factory TodoItemDto.fromDomain(TodoItem todoItem) {
    return TodoItemDto(
      id: todoItem.id.getOrCrash(),
      name: todoItem.name.getOrCrash(),
      done: todoItem.done,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      id: UniqueId.fromUniqueString(id),
      name: TodoName(name),
      done: done,
    );
  }

  factory TodoItemDto.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDtoFromJson(json);
}
