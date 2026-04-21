import 'package:notes_mobile/core/usecase.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/domain/repositories/note_repository.dart';

class CreateNoteUseCase extends UseCase<NoteEntity, CreateNoteParams> {
  const CreateNoteUseCase(this._repository);

  final NoteRepository _repository;

  @override
  BaseResponse<NoteEntity> call(CreateNoteParams params) =>
      _repository.createNote(note: params.note);
}

class CreateNoteParams {
  const CreateNoteParams({required this.note});

  final NoteEntity note;
}
