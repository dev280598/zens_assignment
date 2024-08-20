part of 'theme_component.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static FilledButtonThemeData get buttonTheme {
    return FilledButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
    );
  }
}
