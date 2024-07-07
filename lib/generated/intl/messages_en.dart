// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already have an Account ?"),
        "badAuthorization":
            MessageLookupByLibrary.simpleMessage("Internal Credentials"),
        "defaultError": MessageLookupByLibrary.simpleMessage("Error"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Don\'\'t have an Account ?"),
        "enterEmail": MessageLookupByLibrary.simpleMessage("Enter e-mail"),
        "enterPassword":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "enterValidEmail":
            MessageLookupByLibrary.simpleMessage("Enter valid e-mail"),
        "enterValidPassword": MessageLookupByLibrary.simpleMessage(
            "Password must contains minimum 8 characters"),
        "gitHubLoginCanceled":
            MessageLookupByLibrary.simpleMessage("Login with GitHub canceled"),
        "googleLoginCanceled":
            MessageLookupByLibrary.simpleMessage("Login with Google canceled"),
        "inputEmpty": MessageLookupByLibrary.simpleMessage("Empty field"),
        "invalidEmailFormat":
            MessageLookupByLibrary.simpleMessage("Invalid Email Format"),
        "loginButton": MessageLookupByLibrary.simpleMessage("Login"),
        "loginPageTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "notValidEmail":
            MessageLookupByLibrary.simpleMessage("Incorrect email address"),
        "or": MessageLookupByLibrary.simpleMessage("OR"),
        "registerPageTitle": MessageLookupByLibrary.simpleMessage("Register"),
        "requiredPassword":
            MessageLookupByLibrary.simpleMessage("Password is required"),
        "shortPassword": MessageLookupByLibrary.simpleMessage(
            "The password is too short, at least 8 characters"),
        "signIn": MessageLookupByLibrary.simpleMessage(" Sign In"),
        "signUp": MessageLookupByLibrary.simpleMessage(" Sign Up"),
        "signUpButton": MessageLookupByLibrary.simpleMessage("Register"),
        "userAlreadyExist":
            MessageLookupByLibrary.simpleMessage("User already exist"),
        "userAlreadyLogIn":
            MessageLookupByLibrary.simpleMessage("User already LogIn"),
        "weakPassword": MessageLookupByLibrary.simpleMessage(
            "The password must be at least 8 characters long and contain one letter, a number and a special character")
      };
}
