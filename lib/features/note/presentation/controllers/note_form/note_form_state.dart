part of 'note_form_bloc.dart';

@freezed
class NoteFormState with _$NoteFormState {
  const factory NoteFormState.initial() = _Initial;
  const factory NoteFormState.loading() = _Loading;
  const factory NoteFormState.success(NoteEntity note) = _Success;
  const factory NoteFormState.failed({required Failure error}) = _Failed;
}
