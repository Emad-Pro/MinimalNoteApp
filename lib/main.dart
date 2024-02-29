import 'package:flutter/material.dart';

import 'package:minmal_note_app/core/sharedPreferences/cacheHelper.dart';
import 'package:minmal_note_app/core/theme/theme.dart';
import 'package:minmal_note_app/feture/mainViewBody.dart';
import 'package:minmal_note_app/feture/noteScreen/data/repository/noteDataBaseIsarRepoistory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDataBaseIsarRepoistoryImp().initialize();
  await CacheHelper.init();
  await DarkModeService.settingDarkModeInit();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MainViewBody();
  }
}
