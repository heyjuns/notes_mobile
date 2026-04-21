import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_mobile/core/service_locator.dart';
import 'package:notes_mobile/features/note/presentation/controllers/notes/notes_bloc.dart';
import 'package:notes_mobile/features/note/presentation/screens/notes_screen.dart';

import 'note_routes.dart';

abstract class NoteRouter {
  static List<GoRoute> get routes => [
    GoRoute(
      path: NoteRoutes.notes.path,
      name: NoteRoutes.notes.name,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<NotesBloc>(),
        child: const NotesScreen(),
      ),
    ),
  ];
}
