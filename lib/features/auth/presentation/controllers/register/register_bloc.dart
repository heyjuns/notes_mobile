import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_mobile/core/error/failures/failure.dart';
import 'package:notes_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:notes_mobile/features/auth/domain/usecases/usecases.dart';
import 'package:notes_mobile/features/auth/presentation/params/sign_up_params.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SignUpUseCase signUpUseCase;
  RegisterBloc({required this.signUpUseCase})
    : super(const RegisterState.initial()) {
    on<_Started>((event, emit) async {
      emit(RegisterState.loading());
      final result = await signUpUseCase.call(event.params);

      result.fold(
        (l) => emit(RegisterState.failed(error: l)),
        (r) => emit(RegisterState.registerSuccess(user: r)),
      );
    });
  }
}
