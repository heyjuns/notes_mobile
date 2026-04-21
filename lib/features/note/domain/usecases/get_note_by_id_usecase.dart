import 'package:notes_mobile/core/usecase.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/domain/repositories/note_repository.dart';

class GetNoteByIdUseCase extends UseCase<NoteEntity, GetNoteByIdParams> {
  const GetNoteByIdUseCase(this._repository);

  final NoteRepository _repository;

  @override
  BaseResponse<NoteEntity> call(GetNoteByIdParams params) =>
      _repository.getNoteById(id: params.id);
}

class GetNoteByIdParams {
  const GetNoteByIdParams({required this.id});

  final String id;
}
