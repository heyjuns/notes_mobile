import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes_mobile/features/auth/presentation/controllers/login/login_bloc.dart';
import 'package:notes_mobile/features/auth/presentation/params/sign_in_params.dart';
import 'package:notes_mobile/features/auth/router/auth_routes.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = useBloc<LoginBloc>();
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    useBlocListener(loginBloc, (bloc, current, context) {
      current.whenOrNull(
        failed: (error) =>
            showFToast(context: context, title: Text(error.toString())),
      );
    });

    return FScaffold(
      header: FHeader(title: Text('Login')),
      child: Column(
        spacing: 8,
        children: [
          FTextField(
            enabled: true,
            label: const Text('Email'),
            hint: 'John Doe',
            error: null,
            control: FTextFieldControl.managed(controller: usernameController),
          ),
          FTextField.password(
            enabled: true,
            label: const Text('Password'),
            hint: 'Enter password...',
            error: null,
            control: FTextFieldControl.managed(controller: passwordController),
          ),
          SizedBox(height: 16),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return FButton(
                onPress: () {
                  loginBloc.add(
                    LoginEvent.started(
                      params: SignInParams(
                        email: usernameController.text,
                        password: passwordController.text,
                      ),
                    ),
                  );
                },
                child: isLoading ? FCircularProgress() : Text('Login'),
              );
            },
          ),
          FButton(
            variant: .ghost,
            onPress: () => context.pushNamed(AuthRoutes.register.name),
            child: Text(
              "Don't have an account? Create Now",
              style: context.theme.typography.xs.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}
