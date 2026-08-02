import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/core/storage/storage_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  final SharedPreferencesService prefs;

  LocaleCubit(this.prefs)
      : super(Locale(prefs.getString(key: StorageKeys.languageCode) ?? 'en'));

  void changeLocale(Locale locale) {
    emit(locale);
    prefs.saveData(key: StorageKeys.languageCode, value: locale.languageCode);
  }
}