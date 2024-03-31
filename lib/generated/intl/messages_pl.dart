// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Masz już konto ?"),
        "badAuthorization":
            MessageLookupByLibrary.simpleMessage("Nie poprawne dane"),
        "defaultError": MessageLookupByLibrary.simpleMessage("Błąd"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Nie masz konta ?"),
        "enterEmail": MessageLookupByLibrary.simpleMessage("Wpisz swój e-mail"),
        "enterPassword":
            MessageLookupByLibrary.simpleMessage("Wpisz swoje hasło"),
        "enterValidEmail": MessageLookupByLibrary.simpleMessage(
            "Wprowadź poprawny adres e-mail"),
        "enterValidPassword": MessageLookupByLibrary.simpleMessage(
            "Hasło musi mieć co najmniej 8 znaków"),
        "inputEmpty": MessageLookupByLibrary.simpleMessage("Puste pole"),
        "invalidEmailFormat":
            MessageLookupByLibrary.simpleMessage("Nie prawidłowy adres emial"),
        "loginButton": MessageLookupByLibrary.simpleMessage("Zaloguj"),
        "loginPageTitle": MessageLookupByLibrary.simpleMessage("Logowanie"),
        "notValidEmail":
            MessageLookupByLibrary.simpleMessage("Niepoprawny adres email"),
        "or": MessageLookupByLibrary.simpleMessage("LUB"),
        "registerPageTitle":
            MessageLookupByLibrary.simpleMessage("Rejestracja"),
        "requiredPassword":
            MessageLookupByLibrary.simpleMessage("Hasło jest wymagane"),
        "shortPassword": MessageLookupByLibrary.simpleMessage(
            "Hasło jest za krótkie minimum 8 znaków"),
        "signIn": MessageLookupByLibrary.simpleMessage(" Zaloguj się"),
        "signUp": MessageLookupByLibrary.simpleMessage(" Zarejestruj się"),
        "signUpButton": MessageLookupByLibrary.simpleMessage("Zarejestruj"),
        "userAlreadyExist":
            MessageLookupByLibrary.simpleMessage("Użytkownik już istnieje"),
        "userAlreadyLogIn":
            MessageLookupByLibrary.simpleMessage("Użytkownik już zalogowany"),
        "weakPassword": MessageLookupByLibrary.simpleMessage(
            "Hasło musi mieć co najmniej 8 znaków, zawierać jedną literę, cyfrę oraz znak specjalny")
      };
}
