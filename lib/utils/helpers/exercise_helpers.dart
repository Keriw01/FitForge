import 'package:fit_forge/models/translation.dart';
import 'package:fit_forge/utils/helpers/translation_helpers.dart';
import 'package:flutter/material.dart';

List<String> convertMapToList(
  Map<String, Translation> map,
  BuildContext context,
) {
  return map.values.map((translation) {
    return getTranslationText(translation, context);
  }).toList();
}
