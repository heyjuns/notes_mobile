import 'package:fpdart/fpdart.dart';
import 'package:notes_mobile/core/error/mappers/firebase_exception_mapper.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:notes_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:notes_mobile/features/auth/presentation/params/sign_in_params.dart';
import 'package:notes_mobile/features/auth/presentation/params/sign_up_params.dart';

import '../../domain/datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._datasource);

  final AuthRemoteDatasource _datasource;

  @override
  BaseResponse<UserEntity> signIn(SignInParams params) async {
    try {
      final model = await _datasource.signIn(
        email: params.email,
        password: params.password,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }

  @override
  BaseResponse<UserEntity> signUp(SignUpParams params) async {
    try {
      await _datasource.signUp(
        email: params.email,
        password: params.password,
        name: params.name,
      );
      return signIn(
        SignInParams(email: params.email, password: params.password),
      );
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }

  @override
  BaseResponse<void> signOut() async {
    try {
      await _datasource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(FirebaseExceptionMapper.map(e).toFailure());
    }
  }

  @override
  Stream<UserEntity?> getCurrentUser() =>
      _datasource.getCurrentUser().map((model) => model?.toEntity());
}
