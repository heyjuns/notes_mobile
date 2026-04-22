import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:notes_mobile/core/error/failures/failure.dart';
import 'package:notes_mobile/features/auth/presentation/controllers/login/login_bloc.dart';
import 'package:notes_mobile/features/auth/presentation/params/sign_in_params.dart';
import 'package:notes_mobile/features/auth/router/auth_routes.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = useBloc<LoginBloc>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final emailError = useState<String?>(null);
    final passwordError = useState<String?>(null);

    useEffect(() {
      void clearEmail() => emailError.value = null;
      void clearPassword() => passwordError.value = null;
      emailController.addListener(clearEmail);
      passwordController.addListener(clearPassword);
      return () {
        emailController.removeListener(clearEmail);
        passwordController.removeListener(clearPassword);
      };
    }, []);

    useBlocListener(loginBloc, (bloc, current, context) {
      current.whenOrNull(
        failed: (error) {
          final message = error.maybeWhen(
            remote: (m, _) => m,
            network: (m) => m,
            notFound: (m) => m,
            unauthorized: () => 'Invalid email or password',
            orElse: () => 'Something went wrong',
          );
          showFToast(context: context, title: Text(message));
        },
      );
    });

    void validate() {
      var valid = true;

      final email = emailController.text.trim();
      if (email.isEmpty) {
        emailError.value = 'Email is required';
        valid = false;
      } else if (!email.contains('@') || !email.contains('.')) {
        emailError.value = 'Invalid email format';
        valid = false;
      } else {
        emailError.value = null;
      }

      final password = passwordController.text;
      if (password.isEmpty) {
        passwordError.value = 'Password is required';
        valid = false;
      } else if (password.length < 6) {
        passwordError.value = 'Password min 6 characters';
        valid = false;
      } else {
        passwordError.value = null;
      }

      if (!valid) return;

      loginBloc.add(
        LoginEvent.started(
          params: SignInParams(email: email, password: password),
        ),
      );
    }

    return FScaffold(
      header: FHeader(title: const Text('Login')),
      child: Column(
        spacing: 8,
        children: [
          FTextField(
            label: const Text('Email'),
            hint: 'john@example.com',
            keyboardType: TextInputType.emailAddress,
            error: emailError.value != null ? Text(emailError.value!) : null,
            control: FTextFieldControl.managed(controller: emailController),
          ),
          FTextField.password(
            label: const Text('Password'),
            hint: 'Min 6 characters',
            error: passwordError.value != null ? Text(passwordError.value!) : null,
            control: FTextFieldControl.managed(controller: passwordController),
          ),
          const SizedBox(height: 8),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return FButton(
                onPress: isLoading ? null : validate,
                child: isLoading ? const FCircularProgress() : const Text('Login'),
              );
            },
          ),
          FButton(
            variant: .ghost,
            onPress: () => context.pushNamed(AuthRoutes.register.name),
            child: Text(
              "Don't have an account? Create Now",
              style: context.theme.typography.xs,
            ),
          ),
        ],
      ),
    );
  }
}
