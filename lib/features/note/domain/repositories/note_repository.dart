import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/presentation/controllers/params/create_note_params.dart';

abstract class NoteRepository {
  BaseResponse<List<NoteEntity>> getNotes({required String userId});

  BaseResponse<NoteEntity> getNoteById({required String id});

  BaseResponse<NoteEntity> createNote({required CreateNoteParams params});

  BaseResponse<NoteEntity> updateNote({required NoteEntity note});

  BaseResponse<void> deleteNote({required String id});
}
