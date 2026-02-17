import "package:flutter/material.dart";

extension ScreenSizeExtension on BuildContext {
  // Screen height
  double get screenHeight => MediaQuery.sizeOf(this).height;

  // Screen width
  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isLargeScreen => screenWidth > 600;

  bool get isLandscape => MediaQuery.orientationOf(this) == Orientation.landscape;

  // Scales a font size proportionally to the screen width
  // so that text appears responsive on different device sizes
  double scaleText(double fontSize) => fontSize * (screenWidth / 375);
}
