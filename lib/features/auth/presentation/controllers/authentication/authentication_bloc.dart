import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_mobile/features/auth/domain/usecases/usecases.dart';

import '../../../domain/entities/user_entity.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetCurrentUserUseCase getCurrentUserUseCase;

  AuthenticationBloc({required this.getCurrentUserUseCase})
    : super(const AuthenticationState.initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationState.loading());
    await emit.forEach<UserEntity?>(
      getCurrentUserUseCase.call(),
      onData: (user) {
        print('user bloc $user');
        return user != null
            ? AuthenticationState.authenticated(user)
            : const AuthenticationState.unauthenticated();
      },
      onError: (_, _) => const AuthenticationState.unauthenticated(),
    );
  }
}
