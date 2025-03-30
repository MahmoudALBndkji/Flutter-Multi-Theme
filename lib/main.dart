import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme_app/core/config/theme/cubit/theme_cubit.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/dark/theme_data_dark_blue.dart';
import 'package:flutter_theme_app/core/config/theme/theme-data/light/theme_data_light_green.dart';
import 'package:flutter_theme_app/demo_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, newMode) {
          return MaterialApp(
            title: 'Flutter Theme',
            // theme: getLightTheme(),
            // darkTheme: getDarkTheme(),
            themeMode: newMode,
            home: const DemoScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
