import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_entity.freezed.dart';

@freezed
abstract class NoteEntity with _$NoteEntity {
  const factory NoteEntity({
    required String id,
    required String userId,
    required String title,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _NoteEntity;
}
