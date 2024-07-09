import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/styles/custom_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightColorScheme.surface,
      selectedItemColor: lightColorScheme.primary,
      unselectedItemColor: lightColorScheme.onSurface,
      selectedLabelStyle: customTextThemeLight.titleSmall,
      unselectedLabelStyle: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: lightColorScheme.onSurface,
      ),
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    textTheme: customTextThemeDark,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: customTextThemeDark.titleLarge,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColorScheme.surface,
      selectedItemColor: darkColorScheme.primary,
      unselectedItemColor: darkColorScheme.onSurface,
      selectedLabelStyle: customTextThemeDark.titleSmall,
      unselectedLabelStyle: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: darkColorScheme.onSurface,
      ),
    ),
  );
}
