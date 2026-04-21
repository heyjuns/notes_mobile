import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_mobile/core/error/failures/failure.dart';
import 'package:notes_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:notes_mobile/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:notes_mobile/features/auth/presentation/params/sign_in_params.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInUseCase signInUseCase;
  LoginBloc({required this.signInUseCase}) : super(const LoginState.initial()) {
    on<_Started>((event, emit) async {
      emit(LoginState.loading());
      final result = await signInUseCase.call(event.params);
      result.fold((l) => emit(LoginState.failed(error: l)), (r) {
        emit(LoginState.loaded(user: r));
      });
    });
  }
}
