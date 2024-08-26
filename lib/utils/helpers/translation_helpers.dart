import 'package:fit_forge/models/translation.dart';
import 'package:flutter/material.dart';

String getTranslationText(
  Translation text,
  BuildContext context,
) {
  Locale currentLocale = Localizations.localeOf(context);

  switch (currentLocale.languageCode) {
    case 'pl':
      return text.pl;
    case 'en':
    default:
      return text.en;
  }
}
