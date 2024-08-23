// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get loginPageTitle {
    return Intl.message(
      'Login',
      name: 'loginPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Don''t have an Account ?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'\'t have an Account ?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// ` Sign Up`
  String get signUp {
    return Intl.message(
      ' Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerPageTitle {
    return Intl.message(
      'Register',
      name: 'registerPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get signUpButton {
    return Intl.message(
      'Register',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Already have an Account ?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an Account ?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// ` Sign In`
  String get signIn {
    return Intl.message(
      ' Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid e-mail`
  String get enterValidEmail {
    return Intl.message(
      'Enter valid e-mail',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter e-mail`
  String get enterEmail {
    return Intl.message(
      'Enter e-mail',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get requiredPassword {
    return Intl.message(
      'Password is required',
      name: 'requiredPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must contains minimum 8 characters`
  String get enterValidPassword {
    return Intl.message(
      'Password must contains minimum 8 characters',
      name: 'enterValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get defaultError {
    return Intl.message(
      'Error',
      name: 'defaultError',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get networkRequestFailed {
    return Intl.message(
      'No internet connection',
      name: 'networkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get badAuthorization {
    return Intl.message(
      'Invalid email or password',
      name: 'badAuthorization',
      desc: '',
      args: [],
    );
  }

  /// `User already exist`
  String get userAlreadyExist {
    return Intl.message(
      'User already exist',
      name: 'userAlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `User already LogIn`
  String get userAlreadyLogIn {
    return Intl.message(
      'User already LogIn',
      name: 'userAlreadyLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google canceled`
  String get googleLoginCanceled {
    return Intl.message(
      'Login with Google canceled',
      name: 'googleLoginCanceled',
      desc: '',
      args: [],
    );
  }

  /// `Login with GitHub canceled`
  String get gitHubLoginCanceled {
    return Intl.message(
      'Login with GitHub canceled',
      name: 'gitHubLoginCanceled',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email Format`
  String get invalidEmailFormat {
    return Intl.message(
      'Invalid Email Format',
      name: 'invalidEmailFormat',
      desc: '',
      args: [],
    );
  }

  /// `Empty field`
  String get inputEmpty {
    return Intl.message(
      'Empty field',
      name: 'inputEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email address`
  String get notValidEmail {
    return Intl.message(
      'Incorrect email address',
      name: 'notValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `The password must be at least 8 characters long and contain one letter, a number and a special character`
  String get weakPassword {
    return Intl.message(
      'The password must be at least 8 characters long and contain one letter, a number and a special character',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `The password is too short, at least 8 characters`
  String get shortPassword {
    return Intl.message(
      'The password is too short, at least 8 characters',
      name: 'shortPassword',
      desc: '',
      args: [],
    );
  }

  /// `Workout`
  String get workoutsLabel {
    return Intl.message(
      'Workout',
      name: 'workoutsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Exercises`
  String get exercisesLabel {
    return Intl.message(
      'Exercises',
      name: 'exercisesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get statisticsLabel {
    return Intl.message(
      'Progress',
      name: 'statisticsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Scan QR`
  String get scanQrLabel {
    return Intl.message(
      'Scan QR',
      name: 'scanQrLabel',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logOut {
    return Intl.message(
      'Logout',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Basic information`
  String get basicInformation {
    return Intl.message(
      'Basic information',
      name: 'basicInformation',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get usernameLabel {
    return Intl.message(
      'Username',
      name: 'usernameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message(
      'Email',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get genderLabel {
    return Intl.message(
      'Gender',
      name: 'genderLabel',
      desc: '',
      args: [],
    );
  }

  /// `Birth Date`
  String get birthDateLabel {
    return Intl.message(
      'Birth Date',
      name: 'birthDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Basic Gym Location`
  String get basicGymLocationLabel {
    return Intl.message(
      'Basic Gym Location',
      name: 'basicGymLocationLabel',
      desc: '',
      args: [],
    );
  }

  /// `Current Workout Level`
  String get currentWorkoutLevelLabel {
    return Intl.message(
      'Current Workout Level',
      name: 'currentWorkoutLevelLabel',
      desc: '',
      args: [],
    );
  }

  /// `Top Goal`
  String get topGoalLabel {
    return Intl.message(
      'Top Goal',
      name: 'topGoalLabel',
      desc: '',
      args: [],
    );
  }

  /// `Profile View Mode`
  String get profileViewMode {
    return Intl.message(
      'Profile View Mode',
      name: 'profileViewMode',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Unit System`
  String get unitSystem {
    return Intl.message(
      'Unit System',
      name: 'unitSystem',
      desc: '',
      args: [],
    );
  }

  /// `Default Reps`
  String get defaultReps {
    return Intl.message(
      'Default Reps',
      name: 'defaultReps',
      desc: '',
      args: [],
    );
  }

  /// `Default Sets`
  String get defaultsSets {
    return Intl.message(
      'Default Sets',
      name: 'defaultsSets',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Google Fit`
  String get connectWithGoogleFit {
    return Intl.message(
      'Connect with Google Fit',
      name: 'connectWithGoogleFit',
      desc: '',
      args: [],
    );
  }

  /// `Cloud Database Error`
  String get firestoreException {
    return Intl.message(
      'Cloud Database Error',
      name: 'firestoreException',
      desc: '',
      args: [],
    );
  }

  /// `Document Id Not Exist`
  String get documentIdNotExist {
    return Intl.message(
      'Document Id Not Exist',
      name: 'documentIdNotExist',
      desc: '',
      args: [],
    );
  }

  /// `no data`
  String get noData {
    return Intl.message(
      'no data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Edit Username`
  String get editUsernameLabel {
    return Intl.message(
      'Edit Username',
      name: 'editUsernameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Username`
  String get enterNewUsername {
    return Intl.message(
      'Enter New Username',
      name: 'enterNewUsername',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Choose Gender`
  String get editGenderLabel {
    return Intl.message(
      'Choose Gender',
      name: 'editGenderLabel',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Enter birth date`
  String get enterBirthDate {
    return Intl.message(
      'Enter birth date',
      name: 'enterBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `Choose your workout level`
  String get editCurrentWorkoutLevel {
    return Intl.message(
      'Choose your workout level',
      name: 'editCurrentWorkoutLevel',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get begginer {
    return Intl.message(
      'Beginner',
      name: 'begginer',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get intermediate {
    return Intl.message(
      'Intermediate',
      name: 'intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message(
      'Advanced',
      name: 'advanced',
      desc: '',
      args: [],
    );
  }

  /// `Choose your top goal`
  String get editTopGoal {
    return Intl.message(
      'Choose your top goal',
      name: 'editTopGoal',
      desc: '',
      args: [],
    );
  }

  /// `Maintaining`
  String get maintaining {
    return Intl.message(
      'Maintaining',
      name: 'maintaining',
      desc: '',
      args: [],
    );
  }

  /// `Staying healthy and having good cardiovascular health`
  String get maintainingDescription {
    return Intl.message(
      'Staying healthy and having good cardiovascular health',
      name: 'maintainingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Bulking`
  String get bulking {
    return Intl.message(
      'Bulking',
      name: 'bulking',
      desc: '',
      args: [],
    );
  }

  /// `Focus on gaining muscle size and building strength`
  String get bulkingDescription {
    return Intl.message(
      'Focus on gaining muscle size and building strength',
      name: 'bulkingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cutting`
  String get cutting {
    return Intl.message(
      'Cutting',
      name: 'cutting',
      desc: '',
      args: [],
    );
  }

  /// `Focus on losing body fat or lose weight in general`
  String get cuttingDescription {
    return Intl.message(
      'Focus on losing body fat or lose weight in general',
      name: 'cuttingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Choose unit system`
  String get editUnitSystem {
    return Intl.message(
      'Choose unit system',
      name: 'editUnitSystem',
      desc: '',
      args: [],
    );
  }

  /// `Set default sets`
  String get editDefaultSets {
    return Intl.message(
      'Set default sets',
      name: 'editDefaultSets',
      desc: '',
      args: [],
    );
  }

  /// `Set default reps`
  String get editDefaultReps {
    return Intl.message(
      'Set default reps',
      name: 'editDefaultReps',
      desc: '',
      args: [],
    );
  }

  /// `Connect`
  String get connect {
    return Intl.message(
      'Connect',
      name: 'connect',
      desc: '',
      args: [],
    );
  }

  /// `Body Parts`
  String get bodyPartsPageTitle {
    return Intl.message(
      'Body Parts',
      name: 'bodyPartsPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Triceps`
  String get triceps {
    return Intl.message(
      'Triceps',
      name: 'triceps',
      desc: '',
      args: [],
    );
  }

  /// `Chest`
  String get chest {
    return Intl.message(
      'Chest',
      name: 'chest',
      desc: '',
      args: [],
    );
  }

  /// `Shoulders`
  String get shoulders {
    return Intl.message(
      'Shoulders',
      name: 'shoulders',
      desc: '',
      args: [],
    );
  }

  /// `Biceps`
  String get biceps {
    return Intl.message(
      'Biceps',
      name: 'biceps',
      desc: '',
      args: [],
    );
  }

  /// `Core`
  String get core {
    return Intl.message(
      'Core',
      name: 'core',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Forearms`
  String get forearms {
    return Intl.message(
      'Forearms',
      name: 'forearms',
      desc: '',
      args: [],
    );
  }

  /// `Upper Legs`
  String get upperLegs {
    return Intl.message(
      'Upper Legs',
      name: 'upperLegs',
      desc: '',
      args: [],
    );
  }

  /// `Glutes`
  String get glutes {
    return Intl.message(
      'Glutes',
      name: 'glutes',
      desc: '',
      args: [],
    );
  }

  /// `Cardio`
  String get cardio {
    return Intl.message(
      'Cardio',
      name: 'cardio',
      desc: '',
      args: [],
    );
  }

  /// `Lower Legs`
  String get lowerLegs {
    return Intl.message(
      'Lower Legs',
      name: 'lowerLegs',
      desc: '',
      args: [],
    );
  }

  /// `Show All`
  String get showAll {
    return Intl.message(
      'Show All',
      name: 'showAll',
      desc: '',
      args: [],
    );
  }

  /// `Exercises`
  String get exercisesPageTitle {
    return Intl.message(
      'Exercises',
      name: 'exercisesPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `No exercises found.`
  String get noExercisesFound {
    return Intl.message(
      'No exercises found.',
      name: 'noExercisesFound',
      desc: '',
      args: [],
    );
  }

  /// `Exercise Detail`
  String get exerciseDetailPageTitle {
    return Intl.message(
      'Exercise Detail',
      name: 'exerciseDetailPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Target Muscle Group`
  String get targetMuscleGroup {
    return Intl.message(
      'Target Muscle Group',
      name: 'targetMuscleGroup',
      desc: '',
      args: [],
    );
  }

  /// `Available Equipment`
  String get availableEquipment {
    return Intl.message(
      'Available Equipment',
      name: 'availableEquipment',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
