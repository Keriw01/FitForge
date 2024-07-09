import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final customTextThemeLight = TextTheme(
  ///
  displayLarge: null,

  /// Other Form Field Label
  displayMedium: null,

  /// Text Under Login / Signup Button
  displaySmall: GoogleFonts.roboto(
    fontSize: 12,
    color: defaultFontsColor,
  ),

  /// Plan Name
  headlineLarge: null,

  /// Basic Info In Settings
  headlineMedium: null,

  /// Filter Main Text
  headlineSmall: null,

  /// Titles Of Pages
  titleLarge: GoogleFonts.openSans(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: defaultFontsColor,
  ),

  /// Titles Of Each Deep Screen "Day 1"
  titleMedium: null,

  /// Bottom Navigation Text / Button In Filters (selectedLabelStyle)
  titleSmall: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: lightColorScheme.primary,
  ),

  /// Bottom Navigation Text / Button In Filters (unselectedLabelStyle)

  /// Description of Exercises
  bodyLarge: null,

  /// Authentication Form Field
  bodyMedium: GoogleFonts.roboto(
    fontSize: 14,
    color: defaultFontsColor,
  ),

  /// Other Form Field
  bodySmall: null,

  /// Authentication Buttons
  labelLarge: GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: whiteColor,
  ),

  /// Medium Buttons
  labelMedium: null,

  /// Small Button
  labelSmall: null,
);

final customTextThemeDark = TextTheme(
  ///
  displayLarge: null,

  /// Other Form Field Label
  displayMedium: null,

  /// Text Under Login / Signup Button
  displaySmall: GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: whiteColor,
  ),

  /// Plan Name
  headlineLarge: null,

  /// Basic Info In Settings
  headlineMedium: null,

  /// Filter Main Text
  headlineSmall: null,

  /// Titles Of Pages
  titleLarge: GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    fontSize: 34,
    color: whiteColor,
  ),

  /// Titles Of Each Deep Screen "Day 1"
  titleMedium: null,

  /// Bottom Navigation Text / Button In Filters
  titleSmall: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: darkColorScheme.primary,
  ),

  /// Description of Exercises
  bodyLarge: null,

  /// Authentication Form Field
  bodyMedium: GoogleFonts.openSans(
    fontSize: 14,
    color: defaultFontsColor,
  ),

  /// Other Form Field
  bodySmall: null,

  /// Authentication Buttons
  labelLarge: GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: whiteColor,
  ),

  /// Medium Buttons
  labelMedium: null,

  /// Small Button
  labelSmall: null,
);
