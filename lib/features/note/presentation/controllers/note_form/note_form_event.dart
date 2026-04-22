part of 'note_form_bloc.dart';

@freezed
abstract class NoteFormEvent with _$NoteFormEvent {
  const factory NoteFormEvent.createNote({
    required String userId,
    required String title,
    required String content,
  }) = _CreateNote;

  const factory NoteFormEvent.updateNote({
    required NoteEntity note,
    required String title,
    required String content,
  }) = _UpdateNote;
}
