import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, arguments: arguments, predicate);
  }

  void pop({bool rootNavigator = false}) =>
      Navigator.of(this, rootNavigator: rootNavigator).pop();

  bool canPop({bool rootNavigator = false}) =>
      Navigator.of(this, rootNavigator: rootNavigator).canPop();
}

extension AppContextX on BuildContext {
  Brightness get brightness => Theme.of(this).brightness;
  bool get isDark => brightness == Brightness.dark;
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;
}

// String
extension StringExtention on String? {
  bool isNullOrEmpty() => this == null || this!.trim().isEmpty;
}

// List
extension ListExtention<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

// Map
extension MapExtention<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
