import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:notes_mobile/features/auth/presentation/params/sign_up_params.dart';

import '../../presentation/params/sign_in_params.dart';

abstract class AuthRepository {
  BaseResponse<UserEntity> signIn(SignInParams params);
  BaseResponse<UserEntity> signUp(SignUpParams params);
  BaseResponse<void> signOut();
  Stream<UserEntity?> getCurrentUser();
}
