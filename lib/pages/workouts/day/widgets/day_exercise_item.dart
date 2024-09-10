import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/day_exercise.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/utils/helpers/translation_helpers.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DayExerciseItem extends StatelessWidget {
  final ExerciseInfo exerciseInfo;
  final DayExercise dayExercise;

  const DayExerciseItem({
    super.key,
    required this.exerciseInfo,
    required this.dayExercise,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
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
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getTranslationText(
                  exerciseInfo.exercise.title,
                  context,
                ),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                '${dayExercise.numberOfSets} x ${dayExercise.numberOfReps} ${S.of(context).reps}',
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () => context.router
                .push(ExerciseDetailRoute(exerciseInfo: exerciseInfo)),
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
