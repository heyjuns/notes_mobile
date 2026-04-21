import 'package:go_router/go_router.dart';
import 'package:notes_mobile/features/auth/presentation/screens/login_screen.dart';

import 'auth_routes.dart';

abstract class AuthRouter {
  static List<GoRoute> get routes => [
    GoRoute(
      path: AuthRoutes.login.path,
      name: AuthRoutes.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
  ];
}
