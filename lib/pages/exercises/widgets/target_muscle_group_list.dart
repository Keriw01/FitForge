import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';

class TargetMuscleGroupList extends StatelessWidget {
  final String mainBodyPart;
  final List<String> targetMuscleGroupList;

  const TargetMuscleGroupList({
    super.key,
    required this.targetMuscleGroupList,
    required this.mainBodyPart,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: targetMuscleGroupList.map((muscleGroup) {
        return Container(
          padding: const EdgeInsets.all(5),
          color: seedBlue,
          child: Text(
            muscleGroup,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: whiteColor),
          ),
        );
      }).toList(),
    );
  }
}
