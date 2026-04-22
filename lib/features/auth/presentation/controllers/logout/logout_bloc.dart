import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_mobile/core/error/failures/failure.dart';
import 'package:notes_mobile/features/auth/domain/usecases/usecases.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final SignOutUseCase signOutUseCase;
  LogoutBloc({required this.signOutUseCase})
    : super(const LogoutState.initial()) {
    on<_Started>((event, emit) async {
      emit(LogoutState.loading());
      final result = await signOutUseCase.call(unit);
      result.fold(
        (l) => emit(LogoutState.failed(error: l)),
        (r) => emit(LogoutState.loaded()),
      );
    });
  }
}
