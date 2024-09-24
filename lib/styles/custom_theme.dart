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
      titleTextStyle: customTextThemeLight.titleLarge,
      backgroundColor: lightColorScheme.primary,
      iconTheme: IconThemeData(color: lightColorScheme.onPrimary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightColorScheme.surface,
      selectedItemColor: lightColorScheme.primary,
      unselectedItemColor: lightColorScheme.onSurface,
      selectedLabelStyle: customTextThemeLight.titleSmall,
    ),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: lightColorScheme.primary),
  );

  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    textTheme: customTextThemeDark,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: customTextThemeDark.titleLarge,
      backgroundColor: darkColorScheme.background,
      iconTheme: IconThemeData(color: darkColorScheme.onSurface),
      elevation: 1,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColorScheme.background,
      selectedItemColor: darkColorScheme.surfaceTint,
      unselectedItemColor: darkColorScheme.onSurface,
      selectedLabelStyle: customTextThemeDark.titleSmall,
      showUnselectedLabels: false,
    ),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: darkColorScheme.primary),
  );
}
