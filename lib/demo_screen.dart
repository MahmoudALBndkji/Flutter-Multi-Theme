import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme_app/core/config/theme/app_text_styles.dart';
import 'package:flutter_theme_app/core/config/theme/cubit/theme_cubit.dart';
import 'package:flutter_theme_app/core/config/theme/extensions/theme_extensions.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Demo Screen",
                style: AppTextStyles.mRegular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Enabled button"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text("disabled button"),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(hintText: 'hint'),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(hintText: 'hint'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.read<ThemeCubit>().updateTheme(
                      context.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                    ),
                child: const Text("Toggle Theme"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
