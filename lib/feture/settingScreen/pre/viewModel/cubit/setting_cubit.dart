import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minmal_note_app/core/sharedPreferences/cacheHelper.dart';
import 'package:minmal_note_app/core/theme/theme.dart';
import 'package:minmal_note_app/main.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState());

  changeThemeMode() async {
    await DarkModeService.changeDarkMode();
    emit(ThemeSettingChangedState());
  }
}
