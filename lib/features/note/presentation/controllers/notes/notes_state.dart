part of 'notes_bloc.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState.initial() = _Initial;
  const factory NotesState.loading({required List<NoteEntity> notes}) =
      _Loading;
  const factory NotesState.loaded({required List<NoteEntity> notes}) = _Loaded;
  const factory NotesState.failed({required Failure error}) = _Failed;
}
