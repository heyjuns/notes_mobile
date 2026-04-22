import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:notes_mobile/app_router.dart';
import 'package:notes_mobile/features/auth/presentation/controllers/authentication/authentication_bloc.dart';
import 'package:notes_mobile/features/auth/router/auth_routes.dart';
import 'package:notes_mobile/features/note/router/note_routes.dart';

class AppShell extends HookWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = useBloc<AuthenticationBloc>();

    useEffect(() {
      authenticationBloc.add(AuthenticationEvent.started());
      return null;
    }, []);

    useBlocListener(authenticationBloc, (bloc, current, context) {
      current.whenOrNull(
        authenticated: (_) =>
            navigatorKey.currentContext?.go(NoteRoutes.notes.path),
        unauthenticated: () =>
            navigatorKey.currentContext?.go(AuthRoutes.login.path),
      );
    });
    return child;
  }
}
