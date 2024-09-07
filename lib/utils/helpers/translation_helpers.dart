import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
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

String? getTranslationPlanTypes(
  PlanTypes planType,
  BuildContext context,
) {
  switch (planType) {
    case PlanTypes.maintaining:
      return S.of(context).maintaining;

    case PlanTypes.bulking:
      return S.of(context).bulking;

    case PlanTypes.cutting:
      return S.of(context).cutting;

    default:
      return null;
  }
}

String? getTranslationDifficultLevel(
  DifficultyLevels difficultyLevel,
  BuildContext context,
) {
  switch (difficultyLevel) {
    case DifficultyLevels.beginner:
      return S.of(context).begginer;

    case DifficultyLevels.intermediate:
      return S.of(context).intermediate;

    case DifficultyLevels.advanced:
      return S.of(context).advanced;

    default:
      return null;
  }
}
