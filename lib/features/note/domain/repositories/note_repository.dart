import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/presentation/controllers/params/create_note_params.dart';
import 'package:notes_mobile/features/note/presentation/controllers/params/update_note_params.dart';

abstract class NoteRepository {
  BaseResponse<List<NoteEntity>> getNotes(String userId);

  BaseResponse<NoteEntity> getNoteById(String id);

  BaseResponse<NoteEntity> createNote(CreateNoteParams params);

  BaseResponse<NoteEntity> updateNote(UpdateNoteParams params);

  BaseResponse<void> deleteNote(String id);
}
