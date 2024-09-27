import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final customTextThemeLight = TextTheme(
  /// MyPlans, Current - Top Navigation, Label-BottomNavigation
  titleSmall: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),
  // titleMedium: GoogleFonts.montserrat(
  //   fontSize: 20,
  // ),

  /// Title Of Pages
  titleLarge: GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: lightColorScheme.onPrimary,
  ),

  ///  Text Floating Label (Auth-password,login), Plan Name(When edit)
  labelSmall: GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  ),

  /// Input Text (Auth-password,login), FormErrorText, Plan Name(When edit), , value of cm/kg in profile choose unit system
  labelMedium: GoogleFonts.roboto(
    fontSize: 14,
  ),

  // labelLarge: GoogleFonts.roboto(
  //   fontSize: 18,
  // ),

  /// Kind of Plan e.g. 'Bulking 1 Day(s), Day Name 'Day 1', 'Email' (Settings)
  headlineSmall: GoogleFonts.roboto(
    fontSize: 14,
  ),

  /// Setting headers 'Basic Info', scanQr header in Descrption
  headlineMedium: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),

  /// Plan Name in Card, 'Edit Plan', 'Confirm Delete'
  headlineLarge: GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  ),

  /// Buttons Set, Active, Confirm, Cancel, Edit, Delete (Menu Dialog), email value in Settings 'test@o2.pl'
  displaySmall: GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: lightColorScheme.primary,
  ),

  /// Button e.g. 'Add exercise', 'Create your Own Workout Plan'
  displayMedium: GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: lightColorScheme.primary,
  ),

  /// Auth Button, LogOut
  displayLarge: GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: lightColorScheme.onPrimary,
  ),

  /// Text about 'Don't have an Account ?...', label for '3x6 reps', 'dumbbell', text number of Exercises and allDuration
  bodySmall: GoogleFonts.roboto(
    fontSize: 12,
  ),

  /// Content of Dialog Box, e.g. Delete., Title of 'Chest' in BodyParts
  bodyMedium: GoogleFonts.openSans(
    fontSize: 14,
  ),

  /// Text when planIsEmpty or page not displaying list
  bodyLarge: GoogleFonts.openSans(
    fontSize: 20,
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
  /// MyPlans, Current - Top Navigation, Label-BottomNavigation
  titleSmall: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),
  // titleMedium: GoogleFonts.montserrat(
  //   fontSize: 20,
  // ),

  /// Title Of Pages
  titleLarge: GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: darkColorScheme.onSurface,
  ),

  ///  Text Floating Label (Auth-password,login), Plan Name(When edit)
  labelSmall: GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  ),

  /// Input Text (Auth-password,login), FormErrorText, Plan Name(When edit), , value of cm/kg in profile choose unit system
  labelMedium: GoogleFonts.roboto(
    fontSize: 14,
  ),

  // labelLarge: GoogleFonts.roboto(
  //   fontSize: 18,
  // ),

  /// Kind of Plan e.g. 'Bulking 1 Day(s), Day Name 'Day 1', 'Email' (Settings)
  headlineSmall: GoogleFonts.roboto(
    fontSize: 14,
  ),

  /// Setting headers 'Basic Info', scanQr header in Descrption
  headlineMedium: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),

  /// Plan Name in Card, 'Edit Plan', 'Confirm Delete'
  headlineLarge: GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  ),

  /// Buttons Set, Active, Confirm, Cancel, Edit, Delete (Menu Dialog), email value in Settings 'test@o2.pl'
  displaySmall: GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: darkColorScheme.surfaceTint,
  ),

  /// Button e.g. 'Add exercise', 'Create your Own Workout Plan'
  displayMedium: GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: darkColorScheme.primary,
  ),

  /// Auth Button, LogOut
  displayLarge: GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: darkColorScheme.onSurface,
  ),

  /// Text about 'Don't have an Account ?...', label for '3x6 reps', 'dumbbell', text number of Exercises and allDuration
  bodySmall: GoogleFonts.roboto(
    fontSize: 12,
  ),

  /// Content of Dialog Box, e.g. Delete., Title of 'Chest' in BodyParts
  bodyMedium: GoogleFonts.openSans(
    fontSize: 14,
  ),

  /// Text when planIsEmpty or page not displaying list
  bodyLarge: GoogleFonts.openSans(
    fontSize: 20,
  ),
);
