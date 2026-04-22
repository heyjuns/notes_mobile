import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:notes_mobile/core/service_locator.dart';
import 'package:notes_mobile/features/auth/presentation/controllers/authentication/authentication_bloc.dart';

import 'app_router.dart';
import 'app_shell.dart';
import 'bootstrap_app.dart';

void main() async {
  await bootstrapApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FThemes.neutral.light;
    return BlocProvider(
      create: (context) => sl<AuthenticationBloc>(),
      child: MaterialApp.router(
        theme: theme.toApproximateMaterialTheme(),
        title: 'Notes App',
        routerConfig: appRouter,
        builder: (context, child) => FTheme(
          data: theme,
          child: FToaster(
            style: FToasterStyleDelta.delta(toastAlignment: .bottomCenter),
            child: AppShell(child: child!),
          ),
        ),
      ),
    );
  }
}
