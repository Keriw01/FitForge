import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/plan.dart';
import 'package:fit_forge/pages/workouts/cubit/workouts_cubit.dart';
import 'package:fit_forge/pages/workouts/widgets/bottom_sheet_content.dart';
import 'package:fit_forge/pages/workouts/widgets/workout_utils.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPlansView extends StatefulWidget {
  const MyPlansView({super.key});

  @override
  State<MyPlansView> createState() => _MyPlansViewState();
}

class _MyPlansViewState extends State<MyPlansView> {
  void _openBottomSheet(
    bool forCreatingPlan, {
    Plan? editingPlan,
  }) {
    if (!forCreatingPlan && editingPlan != null) {
      context.read<WorkoutsCubit>().loadPlanForEditing(editingPlan);
    }

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              left: 10,
              top: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: BottomSheetContent(
              isCreatingPlan: forCreatingPlan,
              planId: editingPlan?.planId,
            ),
          );
        });
  }

  void _showPlanOptions(Plan plan) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    plan.planName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                ListTile(
                  title: Text(
                    S.of(context).edit,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: orangeColor),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _openBottomSheet(false, editingPlan: plan);
                  },
                ),
                ListTile(
                  title: Text(
                    S.of(context).delete,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: redColor),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    confirmDelete(
                      context,
                      plan,
                      S.of(context).deletePlanConfirmation,
                      () {
                        context.read<WorkoutsCubit>().deletePlan(plan);
                      },
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    S.of(context).cancel,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        Widget content;

        if (state.userPlans != null && state.userPlans!.isNotEmpty) {
          content = ListView.builder(
            itemCount: state.userPlans?.length,
            itemBuilder: (context, index) {
              Color containerColor = planColors[index % planColors.length];
              bool isCurrentPlan =
                  state.userPlans?[index].planId == state.currentPlan?.planId;

              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          state.userPlans![index].planName,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: whiteColor),
                        ),
                        Text(
                          '${state.userPlans![index].planType[0].toUpperCase()}${state.userPlans![index].planType.substring(1)} ${state.userPlans![index].numberOfDays} ${S.of(context).days}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: whiteColor),
                        ),
                        // TODO Display actual last activity data
                        Text(
                          '${S.of(context).lastActivity}empty data',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: whiteColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          color: whiteColor,
                          alignment: Alignment.topRight,
                          onPressed: () =>
                              _showPlanOptions(state.userPlans![index]),
                          icon: const Icon(Icons.more_horiz),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () => context
                              .read<WorkoutsCubit>()
                              .setCurrentPlan(state.userPlans![index]),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              isCurrentPlan ? whiteColor : Colors.transparent,
                            ),
                            elevation: MaterialStateProperty.all(0),
                            side: isCurrentPlan
                                ? null
                                : MaterialStateProperty.all(
                                    const BorderSide(
                                        color: whiteColor, width: 2),
                                  ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            minimumSize: MaterialStateProperty.all(
                              const Size(70, 25),
                            ),
                          ),
                          child: Text(
                            isCurrentPlan
                                ? S.of(context).active
                                : S.of(context).set,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  color: !isCurrentPlan ? whiteColor : seedBlue,
                                ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        } else {
          content = Center(
            child: Text(
              S.of(context).emptyPlans,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }

        return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            content,
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () => _openBottomSheet(true),
                child: Text(
                  S.of(context).createYourOwnWorkoutPlanButton,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
