import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minmal_note_app/core/theme/theme.dart';
import 'package:minmal_note_app/feture/noteScreen/data/repository/noteDataBaseIsarRepoistory.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/view/notesPage.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/viewModel/cubit/note_cubit.dart';

import 'settingScreen/pre/viewModel/cubit/setting_cubit.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NoteCubit(
              NoteDataBaseIsarRepoistoryImp(),
            )..getDataFromDatabase(),
          ),
          BlocProvider(
            create: (contexta) => SettingCubit(),
          )
        ],
        child: Builder(builder: (context) {
          return BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              return MaterialApp(
                themeMode: DarkModeService.darkModeValue
                    ? ThemeMode.dark
                    : ThemeMode.light,
                theme: DarkModeService().lightMode,
                darkTheme: DarkModeService().darkMode,
                title: 'Flutter Demo',
                home: NotesPage(),
              );
            },
          );
        }));
  }
}
