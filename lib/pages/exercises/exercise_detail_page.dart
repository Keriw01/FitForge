import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/exercise.dart';
import 'package:fit_forge/utils/get_translation_text.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ExerciseDetailPage extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailPage({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).exerciseDetailPageTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(getTranslationText(exercise.title, context)),
              Text(S.of(context).targetMuscleGroup),
              Row(
                children: [
                  Text("${getTranslationText(exercise.mainBodyPart, context)}")
                ],
              ),
              Text(S.of(context).availableEquipment),
              Row(
                children: [Text("")],
              ),
              Text(S.of(context).description),
              Text(getTranslationText(exercise.description, context)),
            ],
          ),
        ),
      ),
    );
  }
}
