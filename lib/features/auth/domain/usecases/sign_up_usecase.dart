import 'package:notes_mobile/core/usecase.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:notes_mobile/features/auth/domain/repositories/auth_repository.dart';

import '../../presentation/params/sign_up_params.dart';

class SignUpUseCase extends UseCase<UserEntity, SignUpParams> {
  const SignUpUseCase(this._repository);

  final AuthRepository _repository;

  @override
  BaseResponse<UserEntity> call(SignUpParams params) =>
      _repository.signUp(params);
}
