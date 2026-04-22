import 'dart:async';

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
  StreamSubscription<UserEntity?>? _subscription;

  AuthenticationBloc({
    required this.getCurrentUserUseCase
  })
      : super(const AuthenticationState.initial()) {
    on<_Started>(_onStarted);
    on<_UserChanged>(_onUserChanged);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationState.loading());

    await _subscription?.cancel();

    _subscription = getCurrentUserUseCase.call().listen(
      (user) => add(_UserChanged(user)),
      onError: (error, stackTrace) {
        add(const _UserChanged(null));
      },
    );
  }

  void _onUserChanged(
    _UserChanged event,
    Emitter<AuthenticationState> emit,
  ) {
    final user = event.user;

    if (user != null) {
      emit(AuthenticationState.authenticated(user));
    } else {
      emit(const AuthenticationState.unauthenticated());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}