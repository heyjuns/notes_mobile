import 'package:fpdart/fpdart.dart';
import 'package:notes_mobile/core/error/mappers/firebase_exception_mapper.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/note/data/models/note_model.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/domain/repositories/note_repository.dart';

import '../../domain/datasources/note_remote_datasource.dart';

class NoteRepositoryImpl implements NoteRepository {
  const NoteRepositoryImpl(this._datasource);

  final NoteRemoteDatasource _datasource;

  @override
  BaseResponse<List<NoteEntity>> getNotes({required String userId}) async {
    try {
      final models = await _datasource.getNotes(userId: userId);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }

  @override
  BaseResponse<NoteEntity> getNoteById({required String id}) async {
    try {
      final model = await _datasource.getNoteById(id: id);
      return Right(model.toEntity());
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }

  @override
  BaseResponse<NoteEntity> createNote({required NoteEntity note}) async {
    try {
      final model = await _datasource.createNote(
        note: NoteModel.fromEntity(note),
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }

  @override
  BaseResponse<NoteEntity> updateNote({required NoteEntity note}) async {
    try {
      final model = await _datasource.updateNote(
        note: NoteModel.fromEntity(note),
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }

  @override
  BaseResponse<void> deleteNote({required String id}) async {
    try {
      await _datasource.deleteNote(id: id);
      return const Right(null);
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }
}
