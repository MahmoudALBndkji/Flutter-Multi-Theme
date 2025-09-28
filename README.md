# Flutter Multi-Theme
![Flutter Multi-Theme](https://miro.medium.com/1*IFjU3tO9zcRP4-lsQpCt8A.png)

This repository serves as a comprehensive example of how to implement a dynamic, multi-theme system in a Flutter application. It demonstrates switching between different color palettes (Green, Red, Blue) and their corresponding light and dark modes, with theme persistence across app restarts.

## Features

- **Multiple Color Themes:** Supports distinct color schemes (Green, Red, Blue).
- **Light & Dark Mode:** Each color theme has a light and a dark variant.
- **State Management with BLoC:** Utilizes `flutter_bloc` for robust and predictable theme state management.
- **Theme Persistence:** Leverages `hydrated_bloc` to automatically save the user's selected theme and restore it on subsequent app launches.
- **Clean Architecture:** Theme logic is decoupled from the UI, organized into dedicated configuration files.
- **Custom Theme Extensions:** Uses `ThemeExtension` to define and access custom colors not available in the standard `ThemeData`.

## How It Works

The theme management system is built around `flutter_bloc` and `hydrated_bloc`.

1.  **State Management (`ThemeCubit`):**
    -   `lib/core/config/theme/cubit/theme_cubit.dart` extends `HydratedCubit`. This allows it to automatically persist its state.
    -   It manages the `ThemeState`, which is a sealed class representing all possible theme combinations (e.g., `ThemeGreenLightState`, `ThemeRedDarkState`).
    -   The `fromJson` and `toJson` methods handle the serialization of the theme state, enabling persistence.

2.  **Theme Definitions:**
    -   The `lib/core/config/theme/theme-data/` directory contains `ThemeData` definitions for each theme variant (e.g., `theme_data_light_green.dart`, `theme_data_dark_blue.dart`).
    -   Each `ThemeData` file configures colors, text styles, and widget themes like `ElevatedButtonThemeData` and `InputDecorationTheme`.
    -   Base colors and fonts are centralized in `app_colors.dart` and `app_fonts.dart`.

3.  **Applying the Theme:**
    -   In `main.dart`, the `MaterialApp` is wrapped in a `BlocProvider` that creates the `ThemeCubit`.
    -   A `BlocBuilder` listens to state changes from the `ThemeCubit` and rebuilds the `MaterialApp` with the new `themeData` from the current state.

4.  **Switching Themes:**
    -   The `DemoScreen` (`lib/demo_screen.dart`) contains buttons that trigger theme changes.
    -   Utility functions in `lib/core/utils/theme_functions.dart` (`toggleMode` and `toggleTheme`) are called to update the `ThemeCubit`'s state. These functions read the current theme context to determine the next logical state.
    -   For example, `toggleMode` switches between the light and dark version of the *current* color theme. `toggleTheme` switches to a different color theme while preserving the current light/dark mode.

5.  **Custom Colors:**
    -   `lib/core/config/theme/extensions/custom_colors_extension.dart` defines a `CustomColors` class and an extension on `ThemeData`.
    -   This allows you to access custom, theme-specific colors cleanly from the build context, like `context.customColors.secondaryColor`.

## Getting Started

To run this project locally, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/mahmoudalbndkji/flutter-multi-theme.git
    cd flutter-multi-theme
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    ```bash
    flutter run
    ```

## Key Dependencies

-   [**flutter_bloc**](https://pub.dev/packages/flutter_bloc): For state management using the BLoC pattern.
-   [**hydrated_bloc**](https://pub.dev/packages/hydrated_bloc): An extension of `flutter_bloc` for persisting state locally.
-   [**path_provider**](https://pub.dev/packages/path_provider): Used by `hydrated_bloc` to find a suitable location on the filesystem for storing data.