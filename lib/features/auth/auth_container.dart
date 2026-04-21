import 'package:notes_mobile/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:notes_mobile/features/auth/domain/repositories/auth_repository.dart';

import '../../core/service_locator.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/datasources/auth_remote_datasource.dart';
import 'domain/usecases/usecases.dart';

void initAuthInjection() {
  // Usecases
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Datasource
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl(), sl()),
  );
}
