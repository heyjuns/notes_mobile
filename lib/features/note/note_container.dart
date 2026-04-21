import 'package:notes_mobile/features/note/presentation/controllers/notes/notes_bloc.dart';

import '../../core/service_locator.dart';
import 'data/datasources/note_remote_datasource_impl.dart';
import 'data/repositories/note_repository_impl.dart';
import 'domain/datasources/note_remote_datasource.dart';
import 'domain/repositories/note_repository.dart';
import 'domain/usecases/create_note_usecase.dart';
import 'domain/usecases/delete_note_usecase.dart';
import 'domain/usecases/get_note_by_id_usecase.dart';
import 'domain/usecases/get_notes_usecase.dart';
import 'domain/usecases/update_note_usecase.dart';

void initNoteInjection() {
  sl.registerFactory(() => NotesBloc(getNotesUseCase: sl()));

  // Usecases
  sl.registerLazySingleton(() => GetNotesUseCase(sl()));
  sl.registerLazySingleton(() => GetNoteByIdUseCase(sl()));
  sl.registerLazySingleton(() => CreateNoteUseCase(sl()));
  sl.registerLazySingleton(() => UpdateNoteUseCase(sl()));
  sl.registerLazySingleton(() => DeleteNoteUseCase(sl()));

  // Repository
  sl.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl(sl()));

  // Datasource
  sl.registerLazySingleton<NoteRemoteDatasource>(
    () => NoteRemoteDatasourceImpl(sl()),
  );
}
