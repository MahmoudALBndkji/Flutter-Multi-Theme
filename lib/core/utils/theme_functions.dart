import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme_app/core/config/theme/cubit/theme_cubit.dart';
import 'package:flutter_theme_app/core/config/theme/cubit/theme_state.dart';
import 'package:flutter_theme_app/core/config/theme/extensions/theme_extensions.dart';
import 'package:flutter_theme_app/core/enum/theme_name.dart';

toggleMode(BuildContext context) {
  final isDark = context.isDarkMode;
  final currentThemeState = context.currentThemeState;

  if (isDark) {
    switch (currentThemeState) {
      case ThemeGreenDarkState():
        context.read<ThemeCubit>().updateTheme(ThemeGreenLightState());
        break;
      case ThemeRedDarkState():
        context.read<ThemeCubit>().updateTheme(ThemeRedLightState());
        break;
      default:
        context.read<ThemeCubit>().updateTheme(ThemeBlueLightState());
    }
  } else {
    switch (currentThemeState) {
      case ThemeGreenLightState():
        context.read<ThemeCubit>().updateTheme(ThemeGreenDarkState());
        break;
      case ThemeRedLightState():
        context.read<ThemeCubit>().updateTheme(ThemeRedDarkState());
        break;
      default:
        context.read<ThemeCubit>().updateTheme(ThemeBlueDarkState());
    }
  }
}

toggleTheme(BuildContext context, ThemeNameEnum themeName) {
  final isDark = context.isDarkMode;

  if (!isDark) {
    switch (themeName) {
      case ThemeNameEnum.green:
        context.read<ThemeCubit>().updateTheme(ThemeGreenLightState());
        break;
      case ThemeNameEnum.red:
        context.read<ThemeCubit>().updateTheme(ThemeRedLightState());
        break;
      default:
        context.read<ThemeCubit>().updateTheme(ThemeBlueLightState());
    }
  } else {
    switch (themeName) {
      case ThemeNameEnum.green:
        context.read<ThemeCubit>().updateTheme(ThemeGreenDarkState());
        break;
      case ThemeNameEnum.red:
        context.read<ThemeCubit>().updateTheme(ThemeRedDarkState());
        break;
      default:
        context.read<ThemeCubit>().updateTheme(ThemeBlueDarkState());
    }
  }
}
