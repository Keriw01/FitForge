import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/plan.dart';
import 'package:fit_forge/models/plan_day.dart';
import 'package:fit_forge/pages/workouts/cubit/workouts_cubit.dart';
import 'package:fit_forge/pages/workouts/widgets/bottom_sheet_content.dart';
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

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.of(context).renameDay),
        content: TextFormField(
          initialValue: cubit.state.dayTitle.value,
          onChanged: (value) => cubit.setDayTitle(value),
          decoration: InputDecoration(
            labelText: S.of(context).dayTitle,
            labelStyle: Theme.of(context).textTheme.headlineMedium,
            errorText: cubit.state.dayTitle.isNotValid
                ? S.of(context).dayTitleRequired
                : null,
            contentPadding: EdgeInsets.zero,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              context.read<WorkoutsCubit>().saveRenamedDay(planId, day);
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).save),
          ),
        ],
      );
    },
  );
}

String getTotalExercisesDuration(PlanDay planDay) {
  int totalDuration = 0;
  if (planDay.dayExercises != null) {
    for (var exercise in planDay.dayExercises!) {
      totalDuration += exercise.duration ?? 0;
    }
  }
  return totalDuration.toString();
}

String getExercisesCount(PlanDay planDay) {
  int exercisesCount = 0;
  if (planDay.dayExercises != null) {
    exercisesCount = planDay.dayExercises!.length;
  }
  return exercisesCount.toString();
}
