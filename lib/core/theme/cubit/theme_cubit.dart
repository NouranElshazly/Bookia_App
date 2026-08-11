import 'package:bloc/bloc.dart';
import 'package:bookia/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  ThemeData currentTheme = AppTheme.lightTheme;
  void changeTheme() {
    if (currentTheme == AppTheme.lightTheme) {
      currentTheme = AppTheme.darkTheme;
    } else {
      currentTheme = AppTheme.lightTheme;
    }
    emit(ChangedState(theme: currentTheme));
  }
}
