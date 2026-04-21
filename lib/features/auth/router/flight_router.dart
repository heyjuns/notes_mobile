import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_mobile/core/service_locator.dart';

import '../presentation/controllers/login/login_bloc.dart';
import '../presentation/controllers/register/register_bloc.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/register_screen.dart';
import 'auth_routes.dart';

abstract class AuthRouter {
  static List<GoRoute> get routes => [
    GoRoute(
      path: AuthRoutes.login.path,
      name: AuthRoutes.login.name,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<LoginBloc>(),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: AuthRoutes.register.path,
      name: AuthRoutes.register.name,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<RegisterBloc>(),
        child: const RegisterScreen(),
      ),
    ),
  ];
}
