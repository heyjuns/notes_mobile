import '../../core/service_locator.dart';
import 'data/datasources/auth_remote_datasource_impl.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/datasources/auth_remote_datasource.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/usecases.dart';
import 'presentation/controllers/login/login_bloc.dart';
import 'presentation/controllers/register/register_bloc.dart';

void initAuthInjection() {
  sl.registerFactory(() => LoginBloc(signInUseCase: sl()));
  sl.registerFactory(() => RegisterBloc(signUpUseCase: sl()));

  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl(), sl()),
  );
}
