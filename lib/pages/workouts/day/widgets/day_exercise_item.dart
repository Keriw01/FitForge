import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/day_exercise.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/pages/workouts/day/cubit/day_cubit.dart';
import 'package:fit_forge/pages/workouts/session/cubit/workout_session_cubit.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final isEditing = context.watch<DayCubit>().state.isEditing;

    print(exerciseInfo);
    print(dayExercise);
    return ListTile(
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
        getTranslationText(
          context,
          exerciseInfo.exercise.title,
        ),
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${dayExercise.numberOfSets} x ${dayExercise.numberOfReps} ${S.of(context).reps}',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocSelector<WorkoutSessionCubit, WorkoutSessionState, Session?>(
            selector: (state) => state.session,
            builder: (context, session) {
              return IconButton(
                onPressed: () => session == null
                    ? context.router
                        .push(ExerciseDetailRoute(exerciseInfo: exerciseInfo))
                    : context
                        .read<WorkoutSessionCubit>()
                        .navigateToSessionDayExercise(
                          exerciseInfo.exercise,
                          dayExercise,
                        ),
                icon: const Icon(Icons.arrow_forward_ios),
              );
            },
          ),
          isEditing
              ? IconButton(
                  onPressed: () => context
                      .read<DayCubit>()
                      .deleteExerciseFromDay(dayExercise),
                  icon: const Icon(Icons.delete, color: Colors.red),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
