import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/presentation/controllers/notes/notes_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotesScreen extends HookWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesBloc = useBloc<NotesBloc>();
    useEffect(() {
      notesBloc.add(NotesEvent.started('qAdlzRhLAsRSPDp0Ecw2gkqSV3G3'));
      return null;
    }, []);

    return FScaffold(
      header: FHeader(
        title: Text("Notes"),
        suffixes: [
          FButton.icon(onPress: () {}, child: Icon(Icons.add)),
          FButton.icon(onPress: () {}, child: Icon(Icons.logout)),
        ],
      ),
      child: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: (notes) =>
                Skeletonizer(enabled: true, child: _Items(notes: notes)),
            loaded: (notes) => _Items(notes: notes),
            failed: (error) => Text(error.toString()),
            orElse: () => SizedBox(),
          );
        },
      ),
    );
  }
}

class _Items extends StatelessWidget {
  final List<NoteEntity> notes;
  const _Items({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Icon(
              Icons.description,
              size: 32,
              color: context.theme.colors.barrier,
            ),
            Text(
              "Note is empty",
              textAlign: .center,
              style: context.theme.typography.xs.copyWith(
                color: context.theme.colors.primary,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.separated(
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = notes[index];
        return FTile(
          title: Text(item.title),
          subtitle: Text(item.content),
          suffix: Text(
            item.updatedAt.toString(),
            style: context.theme.typography.xs.copyWith(
              color: context.theme.colors.secondaryForeground,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: notes.length,
    );
  }
}
