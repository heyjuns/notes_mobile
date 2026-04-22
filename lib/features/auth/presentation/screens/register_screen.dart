import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:notes_mobile/core/error/failures/failure.dart';
import 'package:notes_mobile/features/auth/presentation/params/sign_up_params.dart';

import '../controllers/register/register_bloc.dart';

class RegisterScreen extends HookWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerBloc = useBloc<RegisterBloc>();
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameError = useState<String?>(null);
    final emailError = useState<String?>(null);
    final passwordError = useState<String?>(null);

    useEffect(() {
      void clearName() => nameError.value = null;
      void clearEmail() => emailError.value = null;
      void clearPassword() => passwordError.value = null;
      nameController.addListener(clearName);
      emailController.addListener(clearEmail);
      passwordController.addListener(clearPassword);
      return () {
        nameController.removeListener(clearName);
        emailController.removeListener(clearEmail);
        passwordController.removeListener(clearPassword);
      };
    }, []);

    useBlocListener(registerBloc, (bloc, current, context) {
      current.whenOrNull(
        registerSuccess: (_) =>
            showFToast(context: context, title: const Text('Account created!')),
        failed: (error) {
          final message = error.maybeWhen(
            remote: (m, _) => m,
            network: (m) => m,
            notFound: (m) => m,
            unauthorized: () => 'Unauthorized',
            orElse: () => 'Something went wrong',
          );
          showFToast(context: context, title: Text(message));
        },
      );
    });

    void validate() {
      var valid = true;

      final name = nameController.text.trim();
      if (name.isEmpty) {
        nameError.value = 'Name is required';
        valid = false;
      } else if (name.length < 2) {
        nameError.value = 'Name min 2 characters';
        valid = false;
      } else {
        nameError.value = null;
      }

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

      registerBloc.add(
        RegisterEvent.started(
          params: SignUpParams(
            name: name,
            email: email,
            password: password,
          ),
        ),
      );
    }

    return FScaffold(
      header: FHeader(title: const Text('Register')),
      child: Column(
        spacing: 8,
        children: [
          FTextField(
            label: const Text('Name'),
            hint: 'John Doe',
            error: nameError.value != null ? Text(nameError.value!) : null,
            control: FTextFieldControl.managed(controller: nameController),
          ),
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
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return FButton(
                onPress: isLoading ? null : validate,
                child: isLoading
                    ? const FCircularProgress()
                    : const Text('Register'),
              );
            },
          ),
          FButton(
            variant: .ghost,
            onPress: () => context.pop(),
            child: Text(
              'Already have an account? Login',
              style: context.theme.typography.xs,
            ),
          ),
        ],
      ),
    );
  }
}
