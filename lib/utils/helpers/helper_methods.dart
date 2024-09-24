import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/translation.dart';
import 'package:flutter/material.dart';

bool isLightTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}

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

String? getFirestoreResponseError(
  FirestoreResponseMessage firestoreResponseMessage,
  BuildContext context,
) {
  switch (firestoreResponseMessage) {
    case FirestoreResponseMessage.none:
      return null;

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
  QrScanErrorMessage qrScanErrorMessage,
  BuildContext context,
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
    return getTranslationText(translation, context);
  }).toList();
}
