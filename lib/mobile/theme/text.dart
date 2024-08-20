part of 'theme_component.dart';

/// Class manager the text style of application
class AppTextStyle {
  ThemeData _theme;

  factory AppTextStyle.of(BuildContext context) {
    return AppTextStyle._(Theme.of(context));
  }

  factory AppTextStyle.theme(ThemeData theme) {
    return AppTextStyle._(theme);
  }


  ColorScheme get _appColors => _theme.colorScheme;

  late TextTheme textThemeData;

  late Color textColor = _appColors.onSurface;


  AppTextStyle._(this._theme) {
    final textTheme = _theme.textTheme;
    textThemeData = _theme.textTheme.copyWith(
      displayLarge: GoogleFonts.lato(
        textStyle: textTheme.displayLarge,
        color: _appColors.onSurface,
      ),
      displayMedium: GoogleFonts.lato(
        textStyle: textTheme.displayMedium,
        color: _appColors.onSurface,
      ),
      displaySmall: GoogleFonts.lato(
        textStyle: textTheme.displaySmall,
        color: _appColors.onSurface,
      ),
      headlineLarge: GoogleFonts.lato(
        textStyle: textTheme.headlineLarge,
        color: _appColors.onSurface,
      ),
      headlineMedium: GoogleFonts.lato(
        textStyle: textTheme.headlineMedium,
        color: _appColors.onSurface,
      ),
      headlineSmall: GoogleFonts.lato(
        textStyle: textTheme.headlineSmall,
        color: _appColors.onSurface,
      ),
      titleLarge: GoogleFonts.lato(
        textStyle: textTheme.titleLarge,
        color: _appColors.onSurface,
      ),
      titleMedium: GoogleFonts.lato(
        textStyle: textTheme.titleMedium,
        color: _appColors.onSurface,
      ),
      titleSmall: GoogleFonts.lato(
        textStyle: textTheme.titleSmall,
        color: _appColors.onSurface,
      ),
      bodyLarge: GoogleFonts.lato(
        textStyle: textTheme.bodyLarge,
        color: _appColors.onSurface,
      ),
      bodyMedium: GoogleFonts.lato(
        textStyle: textTheme.bodyMedium,
        color: _appColors.onSurface,
      ),
      bodySmall: GoogleFonts.lato(
        textStyle: textTheme.bodySmall,
        color: _appColors.onSurface,
      ),
      labelLarge: GoogleFonts.lato(
        textStyle: textTheme.labelLarge,
        color: _appColors.onSurface,
      ),
      labelMedium: GoogleFonts.lato(
        textStyle: textTheme.labelMedium,
        color: _appColors.onSurface,
      ),
      labelSmall: GoogleFonts.lato(
        textStyle: textTheme.labelSmall,
        color: _appColors.onSurface,
      ),
    );
  }


  ///============== Text decoration ==============

  
}

