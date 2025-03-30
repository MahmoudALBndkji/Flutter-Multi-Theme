import 'package:flutter/material.dart';
import 'package:flutter_theme_app/core/config/theme/extensions/custom_colors_extension.dart';

extension ContextExt on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  CustomColors get customColors => Theme.of(this).customColors;
}
