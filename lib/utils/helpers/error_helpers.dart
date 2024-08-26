import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:flutter/material.dart';

String? getResponseError(
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
