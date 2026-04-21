import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_mobile/core/error/exceptions/remote_exception.dart';
import 'package:notes_mobile/features/note/data/models/note_model.dart';

import '../../domain/datasources/note_remote_datasource.dart';

class NoteRemoteDatasourceImpl implements NoteRemoteDatasource {
  NoteRemoteDatasourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _notes =>
      _firestore.collection('notes');

  @override
  Future<List<NoteModel>> getNotes({required String userId}) async {
    final snapshot = await _notes
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs.map(NoteModel.fromFirestore).toList();
  }

  @override
  Future<NoteModel> getNoteById({required String id}) async {
    final doc = await _notes.doc(id).get();
    if (!doc.exists) throw const NotFoundException(message: 'Note not found');
    return NoteModel.fromFirestore(doc);
  }

  @override
  Future<NoteModel> createNote({required NoteModel note}) async {
    final ref = _notes.doc();
    final model = NoteModel(
      id: ref.id,
      userId: note.userId,
      title: note.title,
      content: note.content,
      createdAt: note.createdAt,
      updatedAt: note.updatedAt,
    );
    await ref.set(model.toFirestore());
    return model;
  }

  @override
  Future<NoteModel> updateNote({required NoteModel note}) async {
    await _notes.doc(note.id).update(note.toFirestore());
    return note;
  }

  @override
  Future<void> deleteNote({required String id}) => _notes.doc(id).delete();
}
