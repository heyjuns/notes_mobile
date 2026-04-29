import 'package:notes_mobile/features/note/presentation/controllers/params/create_note_params.dart';

import '../../data/models/note_model.dart';

abstract class NoteRemoteDatasource {
  Future<List<NoteModel>> getNotes({required String userId});
  Future<NoteModel> getNoteById({required String id});
  Future<NoteModel> createNote({required CreateNoteParams params});
  Future<NoteModel> updateNote({required NoteModel note});
  Future<void> deleteNote({required String id});
}
