import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AvailableEquipmentList extends StatelessWidget {
  final List<String> availableEquipmentList;

  const AvailableEquipmentList({
    super.key,
    required this.availableEquipmentList,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: availableEquipmentList.map((muscleGroup) {
        return Container(
          padding: const EdgeInsets.all(5),
          color: seedBlue,
          child: Text(
            muscleGroup,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        );
      }).toList(),
    );
  }
}
