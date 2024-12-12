import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/pages/progress/cubit/progress_cubit.dart';
import 'package:fit_forge/pages/progress/widgets/exercise_history_item.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/formation/formation.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ActivityDetailPage extends StatelessWidget {
  final Session session;
  final List<ExerciseInfo> exercises;

  const ActivityDetailPage({
    super.key,
    required this.session,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    bool isLight = isLightTheme(context);
    final unitSystem =
        context.select((SettingsCubit b) => b.state.userProfile!.unitSystem);

    return BlocBuilder<ProgressCubit, ProgressState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: isLight
                ? lightColorScheme.onPrimary
                : darkColorScheme.background,
            iconTheme: IconThemeData(
              color: isLight ? defaultFontsColor : whiteColor,
            ),
            title: Text(
              DateFormat('dd-MM-yyyy').format(session.startTime!),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: state.isLoading
              ? const Center(
                  child: CustomLoadingIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      color: midNightBlue,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              '${formatHour(session.startTime)} - ${formatHour(session.endTime)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(color: whiteColor),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.clipboardCheck,
                                      color: greenButton,
                                      size: 20,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      S.of(context).executedExercises,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(color: whiteColor),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      session.totalExercises.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: whiteColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.weightHanging,
                                      color: orangeColor,
                                      size: 20,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      S.of(context).weight,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(color: whiteColor),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      formatWeightInRightUnit(
                                          unitSystem: unitSystem,
                                          weight: session.totalWeightLifted),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: whiteColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.solidClock,
                                      color: seedBlue,
                                      size: 20,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      S.of(context).duration,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(color: whiteColor),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      session.totalDuration.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: whiteColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    if (exercises.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(S.of(context).emptyExercisesList),
                      )
                    else
                      Expanded(
                        child: ListView.builder(
                          itemCount: exercises.length,
                          itemBuilder: ((context, index) {
                            final exercise = exercises[index];
                            return ExerciseHistoryItem(
                              session: session,
                              exerciseInfo: exercise,
                            );
                          }),
                        ),
                      ),
                  ],
                ),
        );
      },
    );
  }
}
