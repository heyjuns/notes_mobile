import 'package:notes_mobile/core/usecase.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:notes_mobile/features/auth/domain/repositories/auth_repository.dart';

import '../../presentation/params/sign_in_params.dart';

class SignInUseCase extends UseCase<UserEntity, SignInParams> {
  const SignInUseCase(this._repository);

  final AuthRepository _repository;

  @override
  BaseResponse<UserEntity> call(SignInParams params) =>
      _repository.signIn(params);
}
