part of 'notes_bloc.dart';

@freezed
abstract class NotesEvent with _$NotesEvent {
  const factory NotesEvent.started(String userId) = _Started;
}
