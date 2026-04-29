import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_mobile/core/error/exceptions/remote_exception.dart';
import 'package:notes_mobile/features/note/data/models/note_model.dart';
import 'package:notes_mobile/features/note/presentation/controllers/params/create_note_params.dart';
import 'package:notes_mobile/features/note/presentation/controllers/params/update_note_params.dart';

import '../../domain/datasources/note_remote_datasource.dart';

class NoteRemoteDatasourceImpl implements NoteRemoteDatasource {
  NoteRemoteDatasourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _notes =>
      _firestore.collection('notes');

  @override
  Future<List<NoteModel>> getNotes(String userId) async {
    final snapshot = await _notes
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs.map(NoteModel.fromFirestore).toList();
  }

  @override
  Future<NoteModel> getNoteById(String id) async {
    final doc = await _notes.doc(id).get();
    if (!doc.exists) throw const NotFoundException(message: 'Note not found');
    return NoteModel.fromFirestore(doc);
  }

  @override
  Future<NoteModel> createNote(CreateNoteParams params) async {
    final ref = _notes.doc();
    final model = NoteModel(
      id: ref.id,
      userId: params.userId,
      title: params.title,
      content: params.content,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await ref.set(model.toFirestore());
    return model;
  }

  @override
  Future<NoteModel> updateNote(UpdateNoteParams params) async {
    final noteRef = _notes.doc(params.id);
    final noteDoc = await noteRef.get();
    if (!noteDoc.exists) {
      throw const NotFoundException(message: 'Note not found');
    }
    final existingNote = NoteModel.fromFirestore(noteDoc);
    final updatedNote = existingNote.copyWith(
      title: params.title,
      content: params.content,
      updatedAt: DateTime.now(),
    );
    await noteRef.update(updatedNote.toFirestore());
    return updatedNote;
  }

  @override
  Future<void> deleteNote(String id) => _notes.doc(id).delete();
}
