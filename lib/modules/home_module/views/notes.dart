import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendik/modules/home_module/cubit.dart';
import 'package:frontendik/modules/home_module/widgets/note_card.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView(
          children: [
            ...state.notes.map((note) => NoteCard(note: note)),
          ],
        );
      },
    );
  }
}
