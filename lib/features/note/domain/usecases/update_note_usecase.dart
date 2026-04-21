import 'package:notes_mobile/core/usecase.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/domain/repositories/note_repository.dart';

class UpdateNoteUseCase extends UseCase<NoteEntity, UpdateNoteParams> {
  const UpdateNoteUseCase(this._repository);

  final NoteRepository _repository;

  @override
  BaseResponse<NoteEntity> call(UpdateNoteParams params) =>
      _repository.updateNote(note: params.note);
}

class UpdateNoteParams {
  const UpdateNoteParams({required this.note});

  final NoteEntity note;
}
