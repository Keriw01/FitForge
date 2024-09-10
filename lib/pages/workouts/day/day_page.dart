import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/workouts/day/cubit/day_cubit.dart';
import 'package:fit_forge/pages/workouts/day/widgets/day_exercise_item.dart';
import 'package:fit_forge/pages/workouts/widgets/workout_utils.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class DayPage extends StatelessWidget {
  const DayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayCubit, DayState>(
      builder: (context, state) {
        final day = state.planDay;

        if (state.isLoading) {
          return const Scaffold(
            body: Center(
              child: CustomLoadingIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${state.planDay!.dayTitle} - ${getTotalExercisesDuration(state.planDay!)} min',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              TextButton(
                onPressed: () => null,
                child: Text(
                  S.of(context).edit,
                  style: GoogleFonts.roboto(
                      color: whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: day!.dayExercises == null || day.dayExercises!.isEmpty
                    ? Center(
                        child: Text(
                          S.of(context).noExercisesInDay,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        itemCount: state.planDay?.dayExercises?.length,
                        itemBuilder: (context, index) {
                          final dayExercise =
                              state.planDay?.dayExercises?[index];
                          final exerciseInfo = state.exercisesOfDay?[index];
                          return Column(
                            children: [
                              DayExerciseItem(
                                exerciseInfo: exerciseInfo!,
                                dayExercise: dayExercise!,
                              ),
                              const Divider(height: 1),
                            ],
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () => context
                          .read<DayCubit>()
                          .navigateToDayAddExercisePage(),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      )),
                      child: Text(
                        S.of(context).addExercise,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => null,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(greenButton),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          )),
                      child: Text(
                        S.of(context).startWorkout,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: whiteColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
