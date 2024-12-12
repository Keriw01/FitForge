import 'dart:math';

import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/translation.dart';
import 'package:flutter/material.dart';

bool isLightTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}

String getTranslationText(
  BuildContext context,
  Translation text,
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

String getTranslationTopGoal(
  BuildContext context,
  TopGoal planType,
) {
  switch (planType) {
    case TopGoal.maintaining:
      return S.of(context).maintaining;

    case TopGoal.bulking:
      return S.of(context).bulking;

    case TopGoal.cutting:
      return S.of(context).cutting;

    default:
      return S.of(context).noData;
  }
}

String getTranslationWorkoutLevel(
  BuildContext context,
  WorkoutLevel difficultyLevel,
) {
  switch (difficultyLevel) {
    case WorkoutLevel.beginner:
      return S.of(context).begginer;

    case WorkoutLevel.intermediate:
      return S.of(context).intermediate;

    case WorkoutLevel.advanced:
      return S.of(context).advanced;

    default:
      return S.of(context).noData;
  }
}

String getTranslationGender(
  BuildContext context,
  Gender gender,
) {
  switch (gender) {
    case Gender.male:
      return S.of(context).male;

    case Gender.female:
      return S.of(context).female;

    default:
      return S.of(context).noData;
  }
}

String getFirestoreResponseError(
  BuildContext context,
  FirestoreResponseMessage firestoreResponseMessage,
) {
  switch (firestoreResponseMessage) {
    case FirestoreResponseMessage.documentIdNotExist:
      return S.of(context).documentIdNotExist;

    case FirestoreResponseMessage.firestoreException:
      return S.of(context).firestoreException;

    case FirestoreResponseMessage.defaultError:
      return S.of(context).defaultError;

    default:
      return S.of(context).defaultError;
  }
}

String? getQrScanError(
  BuildContext context,
  QrScanErrorMessage qrScanErrorMessage,
) {
  switch (qrScanErrorMessage) {
    case QrScanErrorMessage.none:
      return null;

    case QrScanErrorMessage.invalidBarcode:
      return S.of(context).invalidBarcode;

    case QrScanErrorMessage.qrCodeNotFound:
      return S.of(context).qrCodeNotFound;

    case QrScanErrorMessage.cameraAccessDenied:
      return S.of(context).cameraAccessDenied;

    case QrScanErrorMessage.cameraAccessLimited:
      return S.of(context).cameraAccessLimited;

    default:
      return S.of(context).defaultError;
  }
}

List<String> convertMapToList(
  Map<String, Translation> map,
  BuildContext context,
) {
  return map.values.map((translation) {
    return getTranslationText(context, translation);
  }).toList();
}

String calculateBMI(
  BuildContext context,
  double? weight,
  String? height,
) {
  if (weight != null && height != null && height != "0") {
    double bmi = weight / pow(double.parse(height) / 100, 2);

    return double.parse(bmi.toStringAsFixed(2)).toString();
  } else {
    return S.of(context).noData;
  }
}

String formatWeightInRightUnit({
  required String unitSystem,
  required String weight,
  bool displayUnit = true,
}) {
  final weightInKg = double.tryParse(weight);

  if (weightInKg == null) {
    return displayUnit ? '$weight kg' : weight;
  }

  if (unitSystem == 'inch/lb') {
    final weightInLb = weightInKg * 2.20462;

    return displayUnit
        ? '${weightInLb.toStringAsFixed(1)} lb'
        : weightInLb.toStringAsFixed(1);
  }

  return displayUnit ? '$weight kg' : weight;
}

String displayWeightUnit({
  required String unitSystem,
}) {
  return unitSystem == 'inch/lb' ? 'lb' : 'kg';
}

String formatHeightInRightUnit({
  required String unitSystem,
  required String height,
  bool displayUnit = true,
}) {
  final heightInCmParsed = double.tryParse(height);
  if (heightInCmParsed == null) {
    return displayUnit ? '$height cm' : height;
  }

  if (unitSystem == 'inch/lb') {
    final heightInInches = heightInCmParsed / 2.54;
    return displayUnit
        ? '${heightInInches.toStringAsFixed(1)} inch'
        : heightInInches.toStringAsFixed(1);
  }

  return displayUnit
      ? '${heightInCmParsed.toStringAsFixed(1)} cm'
      : heightInCmParsed.toStringAsFixed(1);
}

String displayHeightUnit({
  required String unitSystem,
}) {
  return unitSystem == 'inch/lb' ? 'inch' : 'cm';
}
