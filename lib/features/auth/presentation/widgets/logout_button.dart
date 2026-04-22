import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:notes_mobile/core/service_locator.dart';
import 'package:notes_mobile/features/auth/presentation/controllers/logout/logout_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LogoutBloc>(),
      child: BlocBuilder<LogoutBloc, LogoutState>(
        builder: (context, state) {
          return FButton.icon(
            onPress: () {
              context.read<LogoutBloc>().add(LogoutEvent.started());
            },
            child: Icon(Icons.logout),
          );
        },
      ),
    );
  }
}
