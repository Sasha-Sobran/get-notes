import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendik/cubit/auth/auth_cubit.dart';
import 'package:frontendik/modules/home_module/cubit.dart';
import 'package:frontendik/modules/home_module/views/notes.dart';
import 'package:frontendik/modules/home_module/widgets/add_note_dialog.dart';

class Home extends StatelessWidget {
  static const String path = '/home';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..init(context),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (homeContext, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    homeContext.read<AuthCubit>().logout();
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (dialogContext) => BlocProvider.value(
                    value: homeContext.read<HomeCubit>(),
                    child: AddNoteDialog(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            body: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your notes:'),
                  Expanded(child: Notes()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
