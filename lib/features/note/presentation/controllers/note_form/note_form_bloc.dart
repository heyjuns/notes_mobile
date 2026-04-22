import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/domain/usecases/create_note_usecase.dart';
import 'package:notes_mobile/features/note/domain/usecases/update_note_usecase.dart';

import '../../../../../core/error/failures/failure.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final CreateNoteUseCase createNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;

  NoteFormBloc({
    required this.createNoteUseCase,
    required this.updateNoteUseCase,
  }) : super(const NoteFormState.initial()) {
    on<_CreateNote>((event, emit) async {
      emit(const NoteFormState.loading());
      final note = NoteEntity(
        id: '',
        userId: event.userId,
        title: event.title,
        content: event.content,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      final result = await createNoteUseCase.call(CreateNoteParams(note: note));
      result.fold(
        (l) => emit(NoteFormState.failed(error: l)),
        (r) => emit(NoteFormState.success(r)),
      );
    });

    on<_UpdateNote>((event, emit) async {
      emit(const NoteFormState.loading());
      final updated = event.note.copyWith(
        title: event.title,
        content: event.content,
        updatedAt: DateTime.now(),
      );
      final result = await updateNoteUseCase.call(UpdateNoteParams(note: updated));
      result.fold(
        (l) => emit(NoteFormState.failed(error: l)),
        (r) => emit(NoteFormState.success(r)),
      );
    });
  }
}
