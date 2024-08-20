

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double width() => MediaQuery.of(this).size.width;

  double height() => MediaQuery.of(this).size.height;

  TextTheme get textT => Theme.of(this).textTheme;
  ColorScheme get colorS => Theme.of(this).colorScheme;
}

extension NumExtension on double {
  SizedBox toSpaceX() => SizedBox(width: this,);
  SizedBox toSpaceY() => SizedBox(height: this,);
}

extension TextExtension on TextStyle {
  TextStyle setColor(Color color) => copyWith(color: color);
}