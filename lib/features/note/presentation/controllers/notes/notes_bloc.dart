import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/domain/usecases/delete_note_usecase.dart';
import 'package:notes_mobile/features/note/domain/usecases/get_notes_usecase.dart';

import '../../../../../core/error/failures/failure.dart';

part 'notes_event.dart';
part 'notes_state.dart';
part 'notes_bloc.freezed.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final GetNotesUseCase getNotesUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;

  final List<NoteEntity> dummy = List.generate(5, (index) => NoteEntity.init());

  NotesBloc({
    required this.getNotesUseCase,
    required this.deleteNoteUseCase,
  }) : super(NotesState.initial()) {
    on<_Started>((event, emit) async {
      emit(NotesState.loading(notes: dummy));
      final result = await getNotesUseCase.call(event.userId);
      result.fold(
        (l) => emit(NotesState.failed(error: l)),
        (r) => emit(NotesState.loaded(notes: r)),
      );
    });

    on<_DeleteNote>((event, emit) async {
      final currentNotes = state.maybeWhen(
        loaded: (notes) => notes,
        orElse: () => <NoteEntity>[],
      );
      final result = await deleteNoteUseCase.call(
        DeleteNoteParams(id: event.noteId),
      );
      result.fold(
        (l) => emit(NotesState.failed(error: l)),
        (_) => emit(
          NotesState.loaded(
            notes: currentNotes.where((n) => n.id != event.noteId).toList(),
          ),
        ),
      );
    });
  }
}
