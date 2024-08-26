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
  headlineLarge: GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: defaultFontsColor,
  ),

  /// Basic Info In Settings
  headlineMedium: GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: midNightBlue,
  ),

  /// Small label
  headlineSmall: GoogleFonts.openSans(
    fontSize: 12,
    color: lightFontColor,
  ),

  /// Titles Of Pages
  titleLarge: GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: whiteColor,
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
  bodyLarge: GoogleFonts.roboto(
    fontSize: 13,
    color: defaultFontsColor,
  ),

  /// Labels in Settings, radio title
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
  labelSmall: GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: whiteColor,
  ),
);

///
///
///
///
/// DARK THEME
///
/// |
/// |
/// |
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

  /// Plan Name, header of settings
  headlineLarge: GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: whiteColor,
  ),

  /// Basic Info In Settings
  headlineMedium: GoogleFonts.openSans(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: whiteColor,
  ),

  /// Small label
  headlineSmall: GoogleFonts.openSans(
    fontSize: 12,
    color: babyBlue,
  ),

  /// Titles Of Pages
  titleLarge: GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 24,
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
  bodyLarge: GoogleFonts.roboto(
    fontSize: 13,
    color: whiteColor,
  ),

  /// Labels in Settings, radio title
  bodyMedium: GoogleFonts.openSans(
    fontSize: 14,
    color: whiteColor,
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
  labelSmall: GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: defaultFontsColor,
  ),
);
