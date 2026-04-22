import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_mobile/core/service_locator.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/presentation/controllers/note_form/note_form_bloc.dart';
import 'package:notes_mobile/features/note/presentation/controllers/notes/notes_bloc.dart';
import 'package:notes_mobile/features/note/presentation/screens/note_form_screen.dart';
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
    GoRoute(
      path: NoteRoutes.noteForm.path,
      name: NoteRoutes.noteForm.name,
      builder: (context, state) {
        final note = state.extra as NoteEntity?;
        return BlocProvider(
          create: (context) => sl<NoteFormBloc>(),
          child: NoteFormScreen(note: note),
        );
      },
    ),
  ];
}
