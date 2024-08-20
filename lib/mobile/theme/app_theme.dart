
import 'package:flutter/material.dart';
import 'package:zens_assignment/mobile/theme/theme_component.dart';

class AppTheme {
  static ThemeData get light {
    final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      useMaterial3: true,
    );
    return theme.copyWith(
        textTheme: AppTextStyle.theme(theme).textThemeData,
      filledButtonTheme: AppButtonStyle.buttonTheme
    );
  }
}