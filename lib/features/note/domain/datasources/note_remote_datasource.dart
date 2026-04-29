import 'package:notes_mobile/features/note/presentation/controllers/params/create_note_params.dart';
import 'package:notes_mobile/features/note/presentation/controllers/params/update_note_params.dart';

import '../../data/models/note_model.dart';

abstract class NoteRemoteDatasource {
  Future<List<NoteModel>> getNotes(String userId);
  Future<NoteModel> getNoteById(String id);
  Future<NoteModel> createNote(CreateNoteParams params);
  Future<NoteModel> updateNote(UpdateNoteParams params);
  Future<void> deleteNote(String id);
}
