import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/core/storage/storage_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPreferencesService prefs;

  ThemeCubit(this.prefs)
      : super(prefs.getBool(key: StorageKeys.isDarkMode) == true
            ? ThemeMode.dark
            : ThemeMode.light);

  void toggleTheme() {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(newMode);
  
    prefs.saveData(key: StorageKeys.isDarkMode, value: newMode == ThemeMode.dark);
  }
}