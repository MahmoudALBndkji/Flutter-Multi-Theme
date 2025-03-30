import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme_app/core/config/theme/cubit/theme_cubit.dart';
import 'package:flutter_theme_app/core/config/theme/cubit/theme_state.dart';
import 'package:flutter_theme_app/core/config/theme/extensions/custom_colors_extension.dart';

extension ContextExt on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  CustomColors get customColors => Theme.of(this).customColors;

  ThemeState get currentThemeState => read<ThemeCubit>().state;
}
