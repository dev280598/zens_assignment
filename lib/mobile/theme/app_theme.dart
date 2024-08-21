import 'package:flutter/material.dart';
import 'package:zens_assignment/mobile/theme/theme_component.dart';

class AppTheme {
  static const _colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF29b363),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF2c7edb),
    onSecondary: Color(0xFFFFFFFF),
    background: Color(0xFFFDFBFF),
    onBackground: Color(0xFF1B1B1D),
    surface: Color(0xFFFDFBFF),
    onSurface: Color(0xFF1B1B1D),
    outline: Color(0xFF74777F),
    error: Color(0xFFBA1B1B),
    onError: Color(0xFFFFFFFF),
  );

  static ThemeData get light {
    final theme = ThemeData(
      colorScheme: _colorScheme,
      useMaterial3: true,
    );
    return theme.copyWith(
        textTheme: AppTextStyle.theme(theme).textThemeData,
        filledButtonTheme: AppButtonStyle.buttonTheme);
  }
}
