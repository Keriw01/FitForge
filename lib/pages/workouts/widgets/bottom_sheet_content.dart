import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/workouts/cubit/workouts_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
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
    bool isLight = isLightTheme(context);

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
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Text(
                    isCreatingPlan
                        ? S.of(context).createWorkoutPlanHeader
                        : S.of(context).editPlan,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: isLight ? defaultFontsColor : null),
                  ),
                  TextButton(
                    onPressed: () => isCreatingPlan
                        ? cubit.addNewPlan()
                        : cubit.saveEditedPlan(planId),
                    child: Text(
                      isCreatingPlan
                          ? S.of(context).confirm
                          : S.of(context).save,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ],
              ),
              TextFormField(
                initialValue: state.planName.value,
                onChanged: (value) => cubit.setPlanName(value),
                decoration: InputDecoration(
                  labelText: S.of(context).planName,
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.labelSmall,
                  errorText: state.planName.isNotValid
                      ? S.of(context).planNameRequired
                      : null,
                  contentPadding: EdgeInsets.zero,
                ),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).selectPlanType,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ToggleButtons(
                isSelected: TopGoal.values
                    .map((type) => state.selectedPlanType == type.name)
                    .toList(),
                onPressed: (index) {
                  cubit.setPlanType(
                    getTranslationTopGoal(context, TopGoal.values[index]),
                  );
                },
                constraints: const BoxConstraints(
                  minHeight: 0,
                  minWidth: 0,
                ),
                children: TopGoal.values.map((type) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      getTranslationTopGoal(context, type),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  );
                }).toList(),
              ),
              Text(
                S.of(context).selectDifficultyLevel,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Wrap(
                children: WorkoutLevel.values.map((level) {
                  return ToggleButtons(
                    isSelected: [state.selectedDifficultyLevel == level.name],
                    onPressed: (_) {
                      cubit.setDifficultyLevel(
                        getTranslationWorkoutLevel(context, level),
                      );
                    },
                    constraints: const BoxConstraints(
                      minHeight: 0,
                      minWidth: 0,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          getTranslationWorkoutLevel(context, level),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              isCreatingPlan
                  ? Text(
                      S.of(context).selectNumberOfDays,
                      style: Theme.of(context).textTheme.labelMedium,
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
                      textStyle: Theme.of(context).textTheme.labelMedium,
                      selectedTextStyle: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isLight ? seedBlue : whiteColor),
                    )
                  : const SizedBox(),
              TextFormField(
                initialValue: state.planDescription.value,
                onChanged: (value) => cubit.setPlanDescription(value),
                decoration: InputDecoration(
                  labelText: S.of(context).planDescription,
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.labelSmall,
                  errorText: state.planDescription.isNotValid
                      ? S.of(context).planDescriptionRequired
                      : null,
                  contentPadding: EdgeInsets.zero,
                ),
                maxLines: 3,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 10)
            ],
          ),
        );
      },
    );
  }
}
