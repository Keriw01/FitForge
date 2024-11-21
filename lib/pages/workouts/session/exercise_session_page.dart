import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/day_exercise.dart';
import 'package:fit_forge/models/exercise.dart';
import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/models/session_exercise.dart';
import 'package:fit_forge/pages/workouts/session/cubit/workout_session_cubit.dart';
import 'package:fit_forge/pages/workouts/session/widgets/workout_session_floating.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class ExerciseSessionPage extends StatefulWidget {
  final Exercise exercise;
  final DayExercise dayExercise;

  const ExerciseSessionPage({
    super.key,
    required this.exercise,
    required this.dayExercise,
  });

  @override
  State<ExerciseSessionPage> createState() => _ExerciseSessionPageState();
}

class _ExerciseSessionPageState extends State<ExerciseSessionPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.exercise.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        showLiveFullscreenButton: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslationText(context, widget.exercise.title),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocSelector<WorkoutSessionCubit, WorkoutSessionState,
          Tuple4<Session?, SessionExercise?, DayExercise?, int>>(
        selector: (state) {
          return Tuple4(
            state.session,
            state.sessionExerciseInProgress,
            state.dayExercise,
            state.countSets,
          );
        },
        builder: (context, tuple) {
          return Stack(
            children: [
              SingleChildScrollView(
                reverse: true,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        YoutubePlayer(
                          controller: _controller,
                          bottomActions: const [
                            CurrentPosition(),
                            SizedBox(width: 10),
                            ProgressBar(isExpanded: true),
                            SizedBox(width: 10),
                            RemainingDuration(),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text('1RM: '),
                            Text(
                              widget.dayExercise.best1RM?.toString() ?? 'N/A',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                S.of(context).sets,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                S.of(context).weight,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                S.of(context).reps,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(width: 60),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Column(
                          children: List.generate(
                            tuple.item3!.numberOfSets,
                            (index) {
                              bool setExists = index <
                                  (tuple.item2?.exercisesSets?.length ?? 0);
                              return Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${index + 1}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: TextField(
                                      onChanged: (value) {
                                        context
                                            .read<WorkoutSessionCubit>()
                                            .updateWeight(
                                                double.tryParse(value) ?? 0.0);
                                      },
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9\.]'),
                                        ),
                                      ],
                                      enabled: index == tuple.item4,
                                      decoration: InputDecoration(
                                        hintText: setExists
                                            ? tuple.item2?.exercisesSets![index]
                                                .weight
                                                .toString()
                                            : 'kg',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: TextField(
                                      onChanged: (value) {
                                        context
                                            .read<WorkoutSessionCubit>()
                                            .updateReps(
                                                int.tryParse(value) ?? 0);
                                      },
                                      keyboardType: TextInputType.number,
                                      enabled: index == tuple.item4,
                                      decoration: InputDecoration(
                                        hintText: setExists
                                            ? tuple.item2?.exercisesSets![index]
                                                .reps
                                                .toString()
                                            : 'reps',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(width: 32),
                                  Icon(
                                    index < tuple.item4
                                        ? Icons.check_circle
                                        : Icons.circle_outlined,
                                    color: index < tuple.item4
                                        ? seedBlue
                                        : lightFontColor,
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    const Spacer(),
                    ElevatedButton(
                      onPressed: context.read<WorkoutSessionCubit>().logSet,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          tuple.item4 <= widget.dayExercise.numberOfSets
                              ? midNightBlue
                              : Colors.grey,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          S.of(context).logSet,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const WorkoutSessionFloating(isSmall: false, bottomPostion: 70),
            ],
          );
        },
      ),
    );
  }
}
