import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:flutter/material.dart';

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
