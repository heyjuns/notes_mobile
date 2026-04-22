import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:notes_mobile/core/service_locator.dart';
import 'package:notes_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:notes_mobile/features/auth/presentation/controllers/authentication/authentication_bloc.dart';
import 'package:notes_mobile/features/auth/presentation/controllers/logout/logout_bloc.dart';
import 'package:notes_mobile/features/auth/presentation/widgets/logout_button.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/presentation/controllers/notes/notes_bloc.dart';
import 'package:notes_mobile/features/note/router/note_routes.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotesScreen extends HookWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesBloc = useBloc<NotesBloc>();
    final authBloc = context.read<AuthenticationBloc>();

    final userId =
        authBloc.state.whenOrNull(authenticated: (user) => user.uid) ?? '';

    useEffect(() {
      notesBloc.add(NotesEvent.started(userId));
      return null;
    }, []);

    return FScaffold(
      header: FHeader(
        title: BlocSelector<AuthenticationBloc, AuthenticationState, String>(
          selector: (state) {
            return state.whenOrNull(authenticated: (user) => user.name) ?? '';
          },
          builder: (context, state) {
            return Text('Hi, $state');
          },
        ),
        suffixes: [
          FButton.icon(
            onPress: () async {
              await context.push(NoteRoutes.noteForm.path);
              notesBloc.add(NotesEvent.started(userId));
            },
            child: const Icon(Icons.add),
          ),
          const LogoutButton(),
        ],
      ),
      child: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: (notes) => Skeletonizer(
              enabled: true,
              child: _Items(notes: notes, notesBloc: notesBloc, userId: userId),
            ),
            loaded: (notes) =>
                _Items(notes: notes, notesBloc: notesBloc, userId: userId),
            failed: (error) => Center(child: Text(error.toString())),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}

class _Items extends StatelessWidget {
  final List<NoteEntity> notes;
  final NotesBloc notesBloc;
  final String userId;

  const _Items({
    required this.notes,
    required this.notesBloc,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.description,
              size: 32,
              color: context.theme.colors.barrier,
            ),
            Text(
              'No notes yet',
              textAlign: TextAlign.center,
              style: context.theme.typography.xs.copyWith(
                color: context.theme.colors.primary,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => notesBloc.add(NotesEvent.started(userId)),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: notes.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = notes[index];
          return Dismissible(
            key: ValueKey(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: context.theme.colors.destructive,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) => notesBloc.add(
              NotesEvent.deleteNote(noteId: item.id, userId: userId),
            ),
            child: GestureDetector(
              onTap: () async {
                await context.push(NoteRoutes.noteForm.path, extra: item);
                notesBloc.add(NotesEvent.started(userId));
              },
              child: FTile(
                title: Text(item.title),
                subtitle: Text(
                  item.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                suffix: Text(
                  _formatDate(item.updatedAt),
                  style: context.theme.typography.xs.copyWith(
                    color: context.theme.colors.secondaryForeground,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
