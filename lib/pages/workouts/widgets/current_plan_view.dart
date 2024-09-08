import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/workouts/cubit/workouts_cubit.dart';
import 'package:fit_forge/pages/workouts/widgets/workout_utils.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentPlanView extends StatelessWidget {
  const CurrentPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        if (state.currentPlan != null) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: seedBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          state.currentPlan!.planName,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: whiteColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${state.currentPlan?.planType[0].toUpperCase()}${state.currentPlan?.planType.substring(1)} ${state.currentPlan?.numberOfDays} ${S.of(context).days}',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                    MenuAnchor(
                      builder: (context, controller, child) {
                        return IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: whiteColor,
                            size: 26,
                          ),
                          onPressed: () {
                            if (controller.isOpen) {
                              controller.close();
                            } else {
                              controller.open();
                            }
                          },
                        );
                      },
                      menuChildren: [
                        MenuItemButton(
                          child: Text(
                            S.of(context).addDay,
                            style: GoogleFonts.roboto(
                              color: defaultFontsColor,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            context
                                .read<WorkoutsCubit>()
                                .addNewDay(state.currentPlan);
                          },
                        ),
                        MenuItemButton(
                          child: Text(
                            S.of(context).edit,
                            style: GoogleFonts.roboto(
                              color: defaultFontsColor,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          onPressed: () {
                            openBottomSheet(
                              context,
                              false,
                              editingPlan: state.currentPlan,
                            );
                          },
                        ),
                        MenuItemButton(
                          child: Text(
                            S.of(context).delete,
                            style: GoogleFonts.roboto(
                              color: defaultFontsColor,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          onPressed: () {
                            context
                                .read<WorkoutsCubit>()
                                .deletePlan(state.currentPlan!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: state.currentPlan!.days != null
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemCount: state.currentPlan?.days!.length,
                        itemBuilder: (context, index) {
                          final day = state.currentPlan!.days![index];

                          return Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 240, 240, 240),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: seedBlue,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  width: 70,
                                  height: 60,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(
                                            Icons.directions_run,
                                            size: 16,
                                            color: whiteColor,
                                          ),
                                          Text(
                                            getExercisesCount(day),
                                            style: GoogleFonts.roboto(
                                              color: whiteColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(
                                            Icons.access_time,
                                            size: 16,
                                            color: whiteColor,
                                          ),
                                          Text(
                                            getTotalExercisesDuration(day),
                                            style: GoogleFonts.roboto(
                                              color: whiteColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      day.dayTitle ??
                                          '${S.of(context).day} ${day.dayNumber}',
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      S.of(context).lastPerformed,
                                      style: GoogleFonts.roboto(
                                        color: lightFontColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    MenuAnchor(
                                      builder: (context, controller, child) {
                                        return IconButton(
                                          icon: const Icon(
                                            Icons.more_horiz,
                                            size: 20,
                                            color: defaultFontsColor,
                                          ),
                                          onPressed: () {
                                            if (controller.isOpen) {
                                              controller.close();
                                            } else {
                                              controller.open();
                                            }
                                          },
                                        );
                                      },
                                      menuChildren: [
                                        MenuItemButton(
                                          child: Text(
                                            S.of(context).renameDay,
                                            style: GoogleFonts.roboto(
                                              color: defaultFontsColor,
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                          onPressed: () {
                                            showRenameDialog(context,
                                                state.currentPlan?.planId, day);
                                          },
                                        ),
                                        MenuItemButton(
                                          child: Text(
                                            S.of(context).delete,
                                            style: GoogleFonts.roboto(
                                              color: defaultFontsColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                          onPressed: () {
                                            context
                                                .read<WorkoutsCubit>()
                                                .deleteDay(
                                                  state.currentPlan,
                                                  day,
                                                );
                                          },
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: defaultFontsColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          '${S.of(context).planIsEmpty}\n${S.of(context).addDayInfo}',
                          style: GoogleFonts.roboto(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
              ),
            ],
          );
        }

        return Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              '${S.of(context).emptyCurrentPlan}: ${S.of(context).myPlansHeader}',
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
