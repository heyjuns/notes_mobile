import 'package:notes_mobile/core/usecase.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/note/domain/repositories/note_repository.dart';

class DeleteNoteUseCase extends UseCase<void, String> {
  const DeleteNoteUseCase(this._repository);

  final NoteRepository _repository;

  @override
  BaseResponse<void> call(String id) => _repository.deleteNote(id);
}
