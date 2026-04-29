import 'package:notes_mobile/core/usecase.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/domain/repositories/note_repository.dart';

class GetNoteByIdUseCase extends UseCase<NoteEntity, String> {
  const GetNoteByIdUseCase(this._repository);

  final NoteRepository _repository;

  @override
  BaseResponse<NoteEntity> call(String id) => _repository.getNoteById(id);
}
