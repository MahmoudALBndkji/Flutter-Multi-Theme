import 'package:flutter/material.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/theme_data_dark.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/theme_data_light.dart';
import 'package:flutter_theme_app/demo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Theme',
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.dark,
      home: const DemoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
