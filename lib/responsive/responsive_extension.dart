import 'package:ecommerce_app/responsive/layout_dimensions.dart';
import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  DeviceType get deviceType {
    final w = screenWidth;
    if (w < LayoutDimensions.mobile) return DeviceType.mobile;
    if (w < LayoutDimensions.desktop) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;

  T responsive<T>({required T mobile, T? tablet, T? desktop}) {
    switch (deviceType) {
      case DeviceType.desktop: return desktop ?? tablet ?? mobile;
      case DeviceType.tablet: return tablet ?? mobile;
      case DeviceType.mobile: return mobile;
    }
  }
}