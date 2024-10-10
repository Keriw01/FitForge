import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/day_exercise.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/pages/workouts/session/cubit/workout_session_cubit.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          exerciseInfo.exercise.title,
          context,
        ),
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${dayExercise.numberOfSets} x ${dayExercise.numberOfReps} ${S.of(context).reps}',
      ),
      trailing:
          BlocSelector<WorkoutSessionCubit, WorkoutSessionState, Session?>(
        selector: (state) {
          return state.session;
        },
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
    );
  }
}
