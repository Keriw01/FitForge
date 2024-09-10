import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_forge/base_cubit/base_cubit.dart';
import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/models/day_exercise.dart';
import 'package:fit_forge/models/exercises.dart';
import 'package:fit_forge/models/plan_day.dart';
import 'package:fit_forge/pages/exercises/cubit/exercises_cubit.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/pages/workouts/cubit/workouts_cubit.dart';
import 'package:fit_forge/repositories/firestore_workouts_repository.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/utils/helpers/translation_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'day_state.dart';
part 'day_cubit.g.dart';

class DayCubit extends BaseCubit<DayState> {
  late final FirestoreWorkoutsRepository firestoreWorkoutsRepository =
      FirestoreWorkoutsRepository();
  late final WorkoutsCubit _workoutsCubit;
  late final ExercisesCubit _exercisesCubit;
  late final SettingsCubit _settingsCubit;

  DayCubit(AppRouter appRouter, BuildContext context)
      : _workoutsCubit = context.read<WorkoutsCubit>(),
        _exercisesCubit = context.read<ExercisesCubit>(),
        _settingsCubit = context.read<SettingsCubit>(),
        super(
          appRouter,
          DayState(),
        );

  void navigateToDayPage(PlanDay planDay) {
    emit(state.copyWith(
      isLoading: true,
      planDay: planDay,
    ));

    List<Exercises>? filteredExercises = getFilteredExercises(planDay);

    emit(state.copyWith(
      isLoading: false,
      exercisesOfDay: filteredExercises,
    ));

    appRouter.push(const DayRoute());
  }

  List<Exercises>? getFilteredExercises(PlanDay? planDay) {
    final exercises = _exercisesCubit.state.exercises;

    return planDay?.dayExercises
        ?.map((planExercise) {
          return exercises?.firstWhere(
              (exercise) => exercise.exerciseId == planExercise.exerciseRefId);
        })
        .whereType<Exercises>()
        .toList();
  }

  void navigateToDayAddExercisePage() {
    emit(state.copyWith(
      selectedListExercises: [],
      filteredExercisesForAdding: [],
    ));

    List<Exercises>? exercisesToExclude = state.exercisesOfDay;
    List<Exercises>? exercises = _exercisesCubit.state.exercises;

    if (exercisesToExclude == null || exercisesToExclude.isEmpty) {
      emit(state.copyWith(filteredExercisesForAdding: exercises));
      appRouter.push(const DayAddExerciseRoute());
      return;
    }

    List<Exercises> filteredExercises = exercises?.where((exercise) {
          return !exercisesToExclude
              .any((exclude) => exclude.exerciseId == exercise.exerciseId);
        }).toList() ??
        [];

    emit(state.copyWith(filteredExercisesForAdding: filteredExercises));

    appRouter.push(const DayAddExerciseRoute());
  }

  void toggleExerciseSelection(Exercises exerciseInfo) {
    List<DayExercise> updatedSelectedListExercises = [
      ...state.selectedListExercises ?? []
    ];

    final int existingIndex = updatedSelectedListExercises.indexWhere(
      (selectedExercise) =>
          selectedExercise.exerciseRefId == exerciseInfo.exerciseId,
    );

    if (existingIndex != -1) {
      // Remove exercise if already selected
      updatedSelectedListExercises.removeAt(existingIndex);
    } else {
      // Add exercise if not selected
      DayExercise newDayExercise = DayExercise(
        exerciseRefId: exerciseInfo.exerciseId,
        numberOfSets: _settingsCubit.state.userProfile!.defaultSets,
        numberOfReps: _settingsCubit.state.userProfile!.defaultReps,
      );

      updatedSelectedListExercises.add(newDayExercise);
    }

    emit(state.copyWith(selectedListExercises: updatedSelectedListExercises));
  }

  bool isExerciseSelected(Exercises? exercisesInfo) {
    return state.selectedListExercises?.any(
          (selectedExercise) =>
              selectedExercise.exerciseRefId == exercisesInfo?.exerciseId,
        ) ??
        false;
  }

  Future<void> addSelectedExercises() async {
    try {
      emit(state.copyWith(
        isLoading: true,
        firestoreResponseMessage: FirestoreResponseMessage.none,
      ));

      User? user = FirebaseAuth.instance.currentUser;
      String? planId = _workoutsCubit.state.currentPlan?.planId;
      await firestoreWorkoutsRepository.addNewExerciseToDay(
        user?.uid,
        planId,
        state.planDay,
        state.selectedListExercises,
      );

      List<DayExercise> updatedExercisesOfPlanDay = [
        ...state.planDay?.dayExercises ?? [],
        ...state.selectedListExercises ?? []
      ];

      PlanDay? updatedPlanDay =
          state.planDay?.copyWith(dayExercises: updatedExercisesOfPlanDay);

      List<Exercises>? filteredExercises = getFilteredExercises(updatedPlanDay);

      _workoutsCubit.updatedPlanDayAfterAdd(planId, updatedPlanDay);

      emit(state.copyWith(
        isLoading: false,
        planDay: updatedPlanDay,
        selectedListExercises: [],
        exercisesOfDay: filteredExercises,
      ));

      appRouter.maybePop();
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
        isLoading: false,
        selectedListExercises: [],
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
        isLoading: false,
        selectedListExercises: [],
      ));
    }
  }

  void searchExercises(
    BuildContext context,
    String query,
  ) {
    List<Exercises>? exercises = _exercisesCubit.state.exercises;

    // Filter exercises that are not in exercisesOfDay
    List<Exercises>? filteredExercises = exercises?.where((exercise) {
      return state.exercisesOfDay?.any((planExercise) =>
              planExercise.exerciseId == exercise.exerciseId) ==
          false;
    }).toList();

    if (query.isEmpty) {
      emit(state.copyWith(filteredExercisesForAdding: filteredExercises));
    } else {
      filteredExercises = filteredExercises
          ?.where((exerciseInfo) =>
              getTranslationText(exerciseInfo.exercise.title, context)
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();

      emit(state.copyWith(filteredExercisesForAdding: filteredExercises));
    }
  }

  void clearState() {
    emit(DayState());
  }
}
