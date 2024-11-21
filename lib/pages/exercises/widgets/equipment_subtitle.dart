import 'package:fit_forge/models/translation.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:flutter/material.dart';

class EquipmentSubtitle extends StatelessWidget {
  final Map<String, Translation> equipment;

  const EquipmentSubtitle({
    super.key,
    required this.equipment,
  });

  @override
  Widget build(BuildContext context) {
    final allTranslations = equipment.entries.map((entry) {
      final translation = entry.value;
      return getTranslationText(context, translation);
    }).join(', ');

    return Text(
      allTranslations,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
