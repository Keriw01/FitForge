import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/workouts/cubit/workouts_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

class BottomSheetContent extends StatelessWidget {
  final bool isCreatingPlan;
  final String? planId;

  const BottomSheetContent({
    super.key,
    required this.isCreatingPlan,
    required this.planId,
  });

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;

    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        final cubit = context.read<WorkoutsCubit>();

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => cubit.clearForm(),
                    child: Text(
                      isCreatingPlan
                          ? S.of(context).cancel
                          : S.of(context).discard,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: isLight ? midNightBlue : whiteColor),
                    ),
                  ),
                  Text(
                    isCreatingPlan
                        ? S.of(context).createWorkoutPlanHeader
                        : S.of(context).editPlan,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  TextButton(
                    onPressed: () => isCreatingPlan
                        ? cubit.addNewPlan()
                        : cubit.saveEditedPlan(planId),
                    child: Text(
                      isCreatingPlan
                          ? S.of(context).confirm
                          : S.of(context).save,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: isLight ? midNightBlue : whiteColor),
                    ),
                  ),
                ],
              ),
              TextFormField(
                initialValue: state.planName.value,
                onChanged: (value) => cubit.setPlanName(value),
                decoration: InputDecoration(
                  labelText: S.of(context).planName,
                  labelStyle: Theme.of(context).textTheme.headlineMedium,
                  errorText: state.planName.isNotValid
                      ? S.of(context).planNameRequired
                      : null,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).selectPlanType,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ToggleButtons(
                isSelected: PlanTypes.values
                    .map((type) => state.selectedPlanType == type.name)
                    .toList(),
                onPressed: (index) {
                  cubit.setPlanType(PlanTypes.values[index].name);
                },
                constraints: const BoxConstraints(
                  minHeight: 0,
                  minWidth: 0,
                ),
                children: PlanTypes.values.map((type) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(type.name),
                  );
                }).toList(),
              ),
              Text(
                S.of(context).selectDifficultyLevel,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ToggleButtons(
                isSelected: DifficultyLevels.values
                    .map((level) => state.selectedDifficultyLevel == level.name)
                    .toList(),
                onPressed: (index) {
                  cubit.setDifficultyLevel(DifficultyLevels.values[index].name);
                },
                constraints: const BoxConstraints(
                  minHeight: 0,
                  minWidth: 0,
                ),
                children: DifficultyLevels.values.map((level) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(level.name),
                  );
                }).toList(),
              ),
              isCreatingPlan
                  ? Text(
                      S.of(context).selectNumberOfDays,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  : const SizedBox(),
              isCreatingPlan ? const SizedBox(height: 10) : const SizedBox(),
              isCreatingPlan
                  ? NumberPicker(
                      itemCount: 2,
                      itemHeight: 25,
                      minValue: 1,
                      maxValue: 8,
                      value: state.numberOfDays,
                      onChanged: (value) => cubit.setNumberOfDays(value),
                      textStyle: const TextStyle(fontSize: 12),
                      selectedTextStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isLight ? midNightBlue : whiteColor),
                    )
                  : const SizedBox(),
              TextFormField(
                initialValue: state.planDescription.value,
                onChanged: (value) => cubit.setPlanDescription(value),
                decoration: InputDecoration(
                  labelText: S.of(context).planDescription,
                  labelStyle: Theme.of(context).textTheme.headlineMedium,
                  errorText: state.planDescription.isNotValid
                      ? S.of(context).planDescriptionRequired
                      : null,
                  contentPadding: EdgeInsets.zero,
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10)
            ],
          ),
        );
      },
    );
  }
}