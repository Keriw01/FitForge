import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/plan.dart';
import 'package:fit_forge/models/plan_day.dart';
import 'package:fit_forge/pages/workouts/cubit/workouts_cubit.dart';
import 'package:fit_forge/pages/workouts/widgets/bottom_sheet_content.dart';
import 'package:fit_forge/utils/forms/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void openBottomSheet(
  BuildContext context,
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
    },
  );
}

void showRenameDialog(
  BuildContext context,
  String? planId,
  PlanDay day,
) {
  final cubit = context.read<WorkoutsCubit>();
  cubit.setDayTitle(day.dayTitle);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocSelector<WorkoutsCubit, WorkoutsState, DayTitle>(
        selector: (state) {
          return state.dayTitle;
        },
        builder: (context, dayTitle) {
          return AlertDialog(
            title: Text(
              S.of(context).renameDay,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            content: TextFormField(
              initialValue: dayTitle.value,
              onChanged: (value) => cubit.setDayTitle(value),
              decoration: InputDecoration(
                labelText: S.of(context).dayTitle,
                labelStyle: Theme.of(context).textTheme.labelMedium,
                floatingLabelStyle: Theme.of(context).textTheme.labelSmall,
                errorText:
                    dayTitle.isNotValid ? S.of(context).dayTitleRequired : null,
                contentPadding: EdgeInsets.zero,
              ),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            actions: [
              Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      S.of(context).cancel,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      if (cubit.state.dayTitle.isValid) {
                        context
                            .read<WorkoutsCubit>()
                            .saveRenamedDay(planId, day);
                      }
                    },
                    child: Text(
                      S.of(context).save,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}

void confirmDelete(
  BuildContext context,
  Plan plan,
  String deleteConfirmationMessage,
  VoidCallback onDelete,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          S.of(context).confirmDelete,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        content: Text(
          deleteConfirmationMessage,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  S.of(context).cancel,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              TextButton(
                onPressed: onDelete,
                child: Text(
                  S.of(context).delete,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

String getExercisesCount(PlanDay planDay) {
  int exercisesCount = 0;
  if (planDay.dayExercises != null) {
    exercisesCount = planDay.dayExercises!.length;
  }
  return exercisesCount.toString();
}
