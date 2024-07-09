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

  /// `Internal Credentials`
  String get badAuthorization {
    return Intl.message(
      'Internal Credentials',
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
