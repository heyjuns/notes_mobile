import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:notes_mobile/core/error/failures/failure.dart';
import 'package:notes_mobile/features/auth/presentation/controllers/authentication/authentication_bloc.dart';
import 'package:notes_mobile/features/note/domain/entities/note_entity.dart';
import 'package:notes_mobile/features/note/presentation/controllers/note_form/note_form_bloc.dart';

class NoteFormScreen extends HookWidget {
  final NoteEntity? note;

  const NoteFormScreen({super.key, this.note});

  bool get _isEditing => note != null;

  @override
  Widget build(BuildContext context) {
    final noteFormBloc = useBloc<NoteFormBloc>();
    final titleController = useTextEditingController(text: note?.title ?? '');
    final contentController = useTextEditingController(
      text: note?.content ?? '',
    );

    useBlocListener(noteFormBloc, (bloc, current, context) {
      current.whenOrNull(
        success: (_) {
          showFToast(
            context: context,
            title: Text('Success ${_isEditing ? 'edit' : 'create'} a note'),
          );
          context.pop();
        },
        failed: (error) {
          final String errorMessage = error.maybeWhen(
            cache: (message) => message,
            network: (message) => message,
            notFound: (message) => message,
            remote: (message, statusCode) => message,
            orElse: () => '',
          );
          return showFToast(context: context, title: Text(errorMessage));
        },
      );
    });

    return FScaffold(
      header: FHeader(title: Text(_isEditing ? 'Edit Note' : 'New Note')),
      child: Column(
        spacing: 12,
        children: [
          FTextField(
            label: const Text('Title'),
            hint: 'Note title...',
            control: FTextFieldControl.managed(controller: titleController),
          ),
          FTextField(
            label: const Text('Content'),
            hint: 'Write something...',
            maxLines: 8,
            control: FTextFieldControl.managed(controller: contentController),
          ),
          const SizedBox(height: 8),
          BlocBuilder<NoteFormBloc, NoteFormState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return FButton(
                onPress: isLoading
                    ? null
                    : () => _onSubmit(
                        context,
                        noteFormBloc,
                        titleController.text,
                        contentController.text,
                      ),
                child: isLoading
                    ? const FCircularProgress()
                    : Text(_isEditing ? 'Save' : 'Create'),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onSubmit(
    BuildContext context,
    NoteFormBloc bloc,
    String title,
    String content,
  ) {
    if (title.trim().isEmpty) {
      showFToast(context: context, title: const Text('Title is required'));
      return;
    }

    if (_isEditing) {
      bloc.add(
        NoteFormEvent.updateNote(
          note: note!,
          title: title.trim(),
          content: content.trim(),
        ),
      );
    } else {
      final userId =
          context.read<AuthenticationBloc>().state.whenOrNull(
            authenticated: (user) => user.uid,
          ) ??
          '';
      bloc.add(
        NoteFormEvent.createNote(
          userId: userId,
          title: title.trim(),
          content: content.trim(),
        ),
      );
    }
  }
}
