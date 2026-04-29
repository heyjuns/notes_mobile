import 'package:notes_mobile/features/auth/presentation/params/sign_in_params.dart';
import 'package:notes_mobile/features/auth/presentation/params/sign_up_params.dart';

import '../../data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> signIn(SignInParams params);
  Future<UserModel> signUp(SignUpParams params);
  Future<void> signOut();
  Stream<UserModel?> getCurrentUser();
}
