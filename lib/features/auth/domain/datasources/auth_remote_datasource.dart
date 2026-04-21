import '../../data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> signIn({required String email, required String password});
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<void> signOut();
  Stream<UserModel?> getCurrentUser();
}
