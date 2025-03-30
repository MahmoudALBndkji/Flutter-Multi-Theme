import 'package:flutter/material.dart';
import 'package:flutter_theme_app/core/config/theme/app_colors.dart';

class AppShadows {
  /// [ Private Constructor ]
  /// For Prevent Make Instance From This Class Like Abstract Class But This Way Is More Standard
  const AppShadows._();

  static BoxShadow shadow1 = BoxShadow(
    offset: const Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
    color: AppColors.shadow1Color.withOpacity(.5),
  );
}
