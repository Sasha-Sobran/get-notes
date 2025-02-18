import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendik/api/notes_api.dart';
import 'package:frontendik/cubit/auth/auth_cubit.dart';
import 'package:frontendik/models/note/note.dart';
import 'package:go_router/go_router.dart';

class HomeState {
  final bool isLoading;
  final List<Note> notes;

  HomeState({this.isLoading = false, this.notes = const []});

  HomeState copyWith({bool? isLoading, List<Note>? notes}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      notes: notes ?? this.notes,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void init(BuildContext context) async {
    await _fetchNotes(context);
  }

  Future<void> _fetchNotes(BuildContext context) async {
    final authCubit = context.read<AuthCubit>();

    final notes = await NoteApi.fetchNotes(authCubit.state.token);

    emit(state.copyWith(notes: notes));
  }

  Future<void> createNote(
      BuildContext context, String title, String description) async {
    final authCubit = context.read<AuthCubit>();

    await NoteApi.createNote(
      title,
      description,
      authCubit.state.token,
    );

    if (context.mounted) {
      context.pop();
      await _fetchNotes(context);
    }
  }

  Future<void> deleteNote(BuildContext context, int id) async {
    final authCubit = context.read<AuthCubit>();

    await NoteApi.deleteNote(
      id,
      authCubit.state.token,
    );

    if (context.mounted) {
      await _fetchNotes(context);
    }
  }
}
