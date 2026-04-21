import 'package:notes_mobile/core/usecase.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/note/domain/repositories/note_repository.dart';

class DeleteNoteUseCase extends UseCase<void, DeleteNoteParams> {
  const DeleteNoteUseCase(this._repository);

  final NoteRepository _repository;

  @override
  BaseResponse<void> call(DeleteNoteParams params) =>
      _repository.deleteNote(id: params.id);
}

class DeleteNoteParams {
  const DeleteNoteParams({required this.id});

  final String id;
}
