part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.loaded({required UserEntity user}) = _Loaded;
  const factory LoginState.failed({required Failure error}) = _Failed;
}
