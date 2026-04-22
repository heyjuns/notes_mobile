import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:notes_mobile/core/error/failures/failure.dart';
import 'package:notes_mobile/features/auth/presentation/params/sign_up_params.dart';

import '../controllers/register/register_bloc.dart';

class RegisterScreen extends HookWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = useBloc<RegisterBloc>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    useBlocListener(loginBloc, (bloc, current, context) {
      current.whenOrNull(
        registerSuccess: (user) =>
            showFToast(context: context, title: Text('Register Success')),
        failed: (error) {
          final String errorMessage = error.maybeWhen(
            cache: (message) => message,
            network: (message) => message,
            notFound: (message) => message,
            remote: (message, statusCode) => message,
            orElse: () => '',
          );
          return showFToast(context: context, title: Text(errorMessage));
        },
      );
    });

    return FScaffold(
      header: FHeader(title: Text('Register')),
      child: Column(
        spacing: 8,
        children: [
          FTextField(
            enabled: true,
            label: const Text('Name'),
            hint: 'John Doe',
            error: null,
            control: FTextFieldControl.managed(controller: nameController),
          ),
          FTextField(
            enabled: true,
            label: const Text('Email'),
            hint: 'John@doe.com',
            error: null,
            control: FTextFieldControl.managed(controller: emailController),
          ),
          FTextField.password(
            enabled: true,
            label: const Text('Password'),
            hint: 'Enter password',
            error: null,
            control: FTextFieldControl.managed(controller: passwordController),
          ),

          SizedBox(height: 16),
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return FButton(
                onPress: () {
                  loginBloc.add(
                    RegisterEvent.started(
                      params: SignUpParams(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    ),
                  );
                },
                child: isLoading ? FCircularProgress() : Text('Register'),
              );
            },
          ),
        ],
      ),
    );
  }
}
