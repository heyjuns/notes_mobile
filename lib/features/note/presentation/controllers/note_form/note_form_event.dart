part of 'note_form_bloc.dart';

@freezed
abstract class NoteFormEvent with _$NoteFormEvent {
  const factory NoteFormEvent.createNote({required CreateNoteParams params}) =
      _CreateNote;

  const factory NoteFormEvent.updateNote({
    required NoteEntity note,
    required String title,
    required String content,
  }) = _UpdateNote;
}
