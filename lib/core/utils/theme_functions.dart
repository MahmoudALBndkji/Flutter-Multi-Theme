import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme_app/core/enum/theme_name.dart';
import 'package:flutter_theme_app/core/utils/theme_mapper.dart';
import 'package:flutter_theme_app/core/config/theme/cubit/theme_cubit.dart';
import 'package:flutter_theme_app/core/config/theme/extensions/theme_extensions.dart';

toggleMode(BuildContext context) {
  final isDark = context.isDarkMode;
  final currentThemeState = context.currentThemeState;
  AppTheme toBeReturnedState;
  if (isDark) {
    toBeReturnedState = currentThemeState.copyWith(ThemeMode.light);
    currentThemeState.currentMode = ThemeMode.light;
  } else {
    toBeReturnedState = currentThemeState.copyWith(ThemeMode.dark);
    currentThemeState.currentMode = ThemeMode.dark;
  }
  context.read<ThemeCubit>().updateTheme(toBeReturnedState);
}

toggleTheme(BuildContext context, ThemeNames themeName) {
  final isDark = context.isDarkMode;
  AppTheme toBeReturnedState = themeMapper[themeName]!;
  if (isDark) {
    toBeReturnedState = toBeReturnedState.copyWith(ThemeMode.dark);
  }
  context.read<ThemeCubit>().updateTheme(toBeReturnedState);
}
