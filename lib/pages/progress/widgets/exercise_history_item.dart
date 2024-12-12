import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/models/session_exercise.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseHistoryItem extends StatelessWidget {
  final ExerciseInfo exerciseInfo;
  final Session session;

  const ExerciseHistoryItem({
    super.key,
    required this.exerciseInfo,
    required this.session,
  });

  @override
  Widget build(BuildContext context) {
    final unitSystem =
        context.select((SettingsCubit b) => b.state.userProfile!.unitSystem);

    SessionExercise sessionExercises = session.sessionExercises!.firstWhere(
        (sessionExercise) =>
            sessionExercise.exerciseRefId == exerciseInfo.exerciseId);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: CachedNetworkImage(
            width: 100,
            height: 100,
            fit: BoxFit.fill,
            imageUrl: exerciseInfo.exercise.thumbnailUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const CustomLoadingIndicator(
              width: 20,
              height: 20,
              strokeWidth: 2,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
      title: Text(
        getTranslationText(context, exerciseInfo.exercise.title),
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < sessionExercises.exercisesSets!.length; i++)
            Text(
                '${S.of(context).userSet} $i: ${formatWeightInRightUnit(unitSystem: unitSystem, weight: sessionExercises.exercisesSets?[i].weight.toString() ?? '0')} x ${sessionExercises.exercisesSets?[i].reps}'),
        ],
      ),
    );
  }
}
