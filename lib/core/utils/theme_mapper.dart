import 'package:flutter/material.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/dark/theme_data_dark_blue.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/dark/theme_data_dark_green.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/dark/theme_data_dark_purple.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/dark/theme_data_dark_red.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/dark/theme_data_dark_yellow.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/light/theme_data_light_blue.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/light/theme_data_light_green.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/light/theme_data_light_purple.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/light/theme_data_light_red.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/light/theme_data_light_yellow.dart';
import 'package:flutter_theme_app/core/enum/theme_name.dart';

Map<ThemeNames, AppTheme> themeMapper = {
  ThemeNames.red: AppTheme(
    light: getLightRedTheme(),
    dark: getDarkRedTheme(),
    name: ThemeNames.red,
  ),
  ThemeNames.green: AppTheme(
    light: getLightGreenTheme(),
    dark: getDarkGreenTheme(),
    name: ThemeNames.green,
  ),
  ThemeNames.blue: AppTheme(
    light: getLightBlueTheme(),
    dark: getDarkBlueTheme(),
    name: ThemeNames.blue,
  ),
  ThemeNames.yellow: AppTheme(
    light: getLightYellowTheme(),
    dark: getDarkYellowTheme(),
    name: ThemeNames.yellow,
  ),
  ThemeNames.purple: AppTheme(
    light: getLightPurpleTheme(),
    dark: getDarkPurpleTheme(),
    name: ThemeNames.purple,
  ),
};

class AppTheme {
  final ThemeData _light;
  final ThemeData _dark;
  final ThemeNames _name;
  ThemeMode _currentMode;

  AppTheme({
    required ThemeData light,
    required ThemeData dark,
    required ThemeNames name,
    ThemeMode currentMode = ThemeMode.light,
  })  : _light = light,
        _dark = dark,
        _name = name,
        _currentMode = currentMode;

  ThemeData get theme => _currentMode == ThemeMode.light ? _light : _dark;

  set currentMode(ThemeMode newMode) => _currentMode = newMode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': _name.name,
      'mode': (_currentMode == ThemeMode.light) ? 'light' : 'dark',
    };
  }

  factory AppTheme.fromMap(Map<String, dynamic> map) {
    String name = map['name'];
    ThemeNames nameEnum = ThemeNames.values.firstWhere(
      (value) => value.name == name,
      orElse: () => ThemeNames.green,
    );
    String savedMode = map['mode'];
    AppTheme requiredAppTheme = themeMapper[nameEnum]!;
    if (savedMode == 'dark') {
      requiredAppTheme = requiredAppTheme.copyWith(ThemeMode.dark);
    }
    return requiredAppTheme;
  }

  AppTheme copyWith(ThemeMode newMode) {
    return AppTheme(
      light: _light,
      dark: _dark,
      name: _name,
      currentMode: newMode,
    );
  }
}
