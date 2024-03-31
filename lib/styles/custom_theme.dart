import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/styles/custom_text_theme.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return _lightTheme;
  }

  static ThemeData get darkTheme {
    return _darkTheme;
  }

  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    textTheme: customTextThemeLight,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: customTextThemeLight.headlineLarge,
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    textTheme: customTextThemeDark,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: customTextThemeDark.headlineLarge,
    ),
  );
}
