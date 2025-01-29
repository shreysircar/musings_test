/*import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode>{
ThemeCubit(): super(ThemeMode.system);

void updateTheme(ThemeMode themeMode)=>emit(themeMode);


  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {

    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
  
    throw UnimplementedError();
  }

  
}*/
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    // Deserialize ThemeMode from stored JSON
    final themeString = json['theme'] as String?;
    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // Serialize ThemeMode to JSON
    String themeString;
    switch (state) {
      case ThemeMode.light:
        themeString = 'light';
        break;
      case ThemeMode.dark:
        themeString = 'dark';
        break;
      case ThemeMode.system:
      // ignore: unreachable_switch_default
      default:
        themeString = 'system';
        break;
    }
    return {'theme': themeString};
  }
}
