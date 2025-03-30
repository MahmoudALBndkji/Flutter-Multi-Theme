import 'package:flutter/material.dart';
import 'package:flutter_theme_app/core/config/theme/app_colors.dart';
import 'package:flutter_theme_app/core/config/theme/app_fonts.dart';
import 'package:flutter_theme_app/core/config/theme/app_text_styles.dart';

ThemeData getDarkBlueTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundDarkBlue,
    brightness: Brightness.dark,
    fontFamily: AppFonts.manrope,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryDarkBlue300,
      brightness: Brightness.dark,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: AppColors.grey0,
          displayColor: AppColors.grey0,
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDarkBlue300,
        foregroundColor: AppColors.grey0,
        disabledBackgroundColor: AppColors.grey800,
        disabledForegroundColor: AppColors.grey400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: AppTextStyles.mSemiBold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.grey100,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.grey100,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryDarkBlue200,
        ),
      ),
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return const Color.fromARGB(255, 7, 32, 55);
        }
        return AppColors.grey800;
      }),
      filled: true,
      hintStyle: AppTextStyles.mRegular.copyWith(color: AppColors.grey400),
    ),
  );
}
