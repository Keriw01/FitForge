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
