import 'theme_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeGreenLightState());

  void updateTheme(ThemeState newState) => emit(newState);

  final String _jsonKey = 'themeMode';

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    final savedMode = json[_jsonKey];
    switch (savedMode) {
      case 'lightGreen':
        return ThemeGreenLightState();
      case 'lightRed':
        return ThemeRedLightState();
      case 'lightBlue':
        return ThemeBlueLightState();
      case 'darkGreen':
        return ThemeGreenDarkState();
      case 'darkRed':
        return ThemeRedDarkState();
      case 'darkBlue':
        return ThemeBlueDarkState();
      default:
        return ThemeGreenLightState();
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    switch (state.runtimeType) {
      case const (ThemeGreenLightState):
        return {_jsonKey: 'lightGreen'};
      case const (ThemeRedLightState):
        return {_jsonKey: 'lightRed'};
      case const (ThemeBlueLightState):
        return {_jsonKey: 'lightBlue'};
      case const (ThemeGreenDarkState):
        return {_jsonKey: 'darkGreen'};
      case const (ThemeRedDarkState):
        return {_jsonKey: 'darkRed'};
      case const (ThemeBlueDarkState):
        return {_jsonKey: 'darkBlue'};
      default:
        return {_jsonKey: 'lightGreen'};
    }
  }
}
