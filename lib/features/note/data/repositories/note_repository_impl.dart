import 'package:fpdart/fpdart.dart';
import 'package:notes_mobile/core/error/mappers/firebase_exception_mapper.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/domain/repositories/note_repository.dart';
import 'package:notes_mobile/features/note/presentation/controllers/params/create_note_params.dart';
import 'package:notes_mobile/features/note/presentation/controllers/params/update_note_params.dart';

import '../../domain/datasources/note_remote_datasource.dart';

class NoteRepositoryImpl implements NoteRepository {
  const NoteRepositoryImpl(this._datasource);

  final NoteRemoteDatasource _datasource;

  @override
  BaseResponse<List<NoteEntity>> getNotes(String userId) async {
    try {
      final models = await _datasource.getNotes(userId);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }

  @override
  BaseResponse<NoteEntity> getNoteById(String id) async {
    try {
      final model = await _datasource.getNoteById(id);
      return Right(model.toEntity());
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }

  @override
  BaseResponse<NoteEntity> createNote(CreateNoteParams params) async {
    try {
      final model = await _datasource.createNote(params);
      return Right(model.toEntity());
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }

  @override
  BaseResponse<NoteEntity> updateNote(UpdateNoteParams params) async {
    try {
      final model = await _datasource.updateNote(params);
      return Right(model.toEntity());
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }

  @override
  BaseResponse<void> deleteNote(String id) async {
    try {
      await _datasource.deleteNote(id);
      return const Right(null);
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }
}
