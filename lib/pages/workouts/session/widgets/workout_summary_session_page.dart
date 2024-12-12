import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/pages/workouts/session/cubit/workout_session_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuple/tuple.dart';

@RoutePage()
class WorkoutSummarySessionPage extends StatelessWidget {
  const WorkoutSummarySessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final unitSystem =
        context.select((SettingsCubit b) => b.state.userProfile!.unitSystem);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).workoutSummary,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          TextButton(
            onPressed: () => null,
            child: Text(
              S.of(context).share,
              style: GoogleFonts.roboto(
                color: whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
      body: BlocSelector<WorkoutSessionCubit, WorkoutSessionState,
          Tuple2<Session?, bool>>(
        selector: (state) => Tuple2(
          state.session,
          state.isLoading,
        ),
        builder: (context, tuple) {
          if (tuple.item2 == true || tuple.item1 == null) {
            return const Center(
              child: CustomLoadingIndicator(),
            );
          }
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.flagCheckered,
                            size: 128,
                            color: midNightBlue,
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            formatWeightInRightUnit(
                                unitSystem: unitSystem,
                                weight: tuple.item1!.totalWeightLifted),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            S.of(context).liftedDescription,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 1,
                        width: 300,
                        color: whiteColor,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Icon(
                                FontAwesomeIcons.weightHanging,
                                color: orangeColor,
                              ),
                              const SizedBox(height: 4),
                              Text(S.of(context).exercise),
                              const SizedBox(height: 2),
                              Text(tuple.item1!.totalExercises.toString()),
                            ],
                          ),
                          // const Spacer(),
                          // Column(
                          //   children: [
                          //     const Icon(
                          //       FontAwesomeIcons.trophy,
                          //       color: greenButton,
                          //     ),
                          //     const SizedBox(height: 4),
                          //     Text(S.of(context).newRecord),
                          //     const SizedBox(height: 2),
                          //     Text(tuple.item1!.exercisesWith1RM.toString()),
                          //   ],
                          // ),
                          // const Spacer(),
                          const SizedBox(width: 64),
                          Column(
                            children: [
                              const Icon(
                                FontAwesomeIcons.solidClock,
                                color: seedBlue,
                              ),
                              const SizedBox(height: 4),
                              Text(S.of(context).duration),
                              const SizedBox(height: 2),
                              Text(tuple.item1!.totalDuration.toString()),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Text(
                        S.of(context).congratulation,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 20),
                      const Icon(
                        FontAwesomeIcons.handsClapping,
                        color: orangeColor,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => context
                              .read<WorkoutSessionCubit>()
                              .deleteWorkout(),
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(midNightBlue),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          icon: const Icon(
                            FontAwesomeIcons.trash,
                            color: whiteColor,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => context
                                .read<WorkoutSessionCubit>()
                                .saveWorkout(),
                            style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll(midNightBlue),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                S.of(context).save.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
