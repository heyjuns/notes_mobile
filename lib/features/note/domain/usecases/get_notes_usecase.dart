import 'package:notes_mobile/core/usecase.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/domain/repositories/note_repository.dart';

class GetNotesUseCase extends UseCase<List<NoteEntity>, GetNotesParams> {
  const GetNotesUseCase(this._repository);

  final NoteRepository _repository;

  @override
  BaseResponse<List<NoteEntity>> call(GetNotesParams params) =>
      _repository.getNotes(userId: params.userId);
}

class GetNotesParams {
  const GetNotesParams({required this.userId});

  final String userId;
}
