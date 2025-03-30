import 'package:flutter_theme_app/core/enum/theme_name.dart';
import 'package:flutter_theme_app/core/utils/theme_mapper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<AppTheme> {
  ThemeCubit() : super(themeMapper[ThemeNames.green]!);

  void updateTheme(AppTheme newState) => emit(newState);

  @override
  AppTheme? fromJson(Map<String, dynamic> json) => AppTheme.fromMap(json);

  @override
  Map<String, dynamic>? toJson(AppTheme state) => state.toMap();
}
