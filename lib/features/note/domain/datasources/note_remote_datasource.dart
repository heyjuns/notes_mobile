import '../../data/models/note_model.dart';

abstract class NoteRemoteDatasource {
  Future<List<NoteModel>> getNotes({required String userId});
  Future<NoteModel> getNoteById({required String id});
  Future<NoteModel> createNote({required NoteModel note});
  Future<NoteModel> updateNote({required NoteModel note});
  Future<void> deleteNote({required String id});
}
