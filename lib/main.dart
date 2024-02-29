import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:minmal_note_app/feture/data/repository/noteDataBaseIsarRepoistory.dart';

import 'package:minmal_note_app/feture/pre/view/notesScreen.dart';
import 'package:minmal_note_app/feture/pre/viewModel/cubit/note_cubit.dart';
import 'package:minmal_note_app/feture/pre/viewModel/cubit/note_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDataBaseIsarRepoistoryImp().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NoteCubit(NoteDataBaseIsarRepoistoryImp())
              ..getDataFromDatabase())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Builder(builder: (context) {
            return NotesScreen();
          })),
    );
  }
}
