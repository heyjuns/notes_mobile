import 'package:notes_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:notes_mobile/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  const GetCurrentUserUseCase(this._repository);

  final AuthRepository _repository;

  Stream<UserEntity?> call() => _repository.getCurrentUser();
}
