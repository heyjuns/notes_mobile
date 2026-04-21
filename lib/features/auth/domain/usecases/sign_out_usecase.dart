import 'package:fpdart/fpdart.dart';
import 'package:notes_mobile/core/usecase.dart';
import 'package:notes_mobile/core/utils/typedefs/base_response.dart';
import 'package:notes_mobile/features/auth/domain/repositories/auth_repository.dart';

class SignOutUseCase extends UseCase<void, Unit> {
  const SignOutUseCase(this._repository);

  final AuthRepository _repository;

  @override
  BaseResponse<void> call(Unit params) => _repository.signOut();
}
