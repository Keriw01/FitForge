import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_forge/base_cubit/base_cubit.dart';
import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/models/day_exercise.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/models/plan_day.dart';
import 'package:fit_forge/pages/exercises/cubit/exercises_cubit.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/pages/workouts/cubit/workouts_cubit.dart';
import 'package:fit_forge/repositories/firestore_workouts_repository.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
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

    List<ExerciseInfo>? filteredExercises = getFilteredExercises(planDay);

    emit(state.copyWith(
      isLoading: false,
      exercisesOfDay: filteredExercises,
    ));

    appRouter.push(const DayRoute());
  }

  List<ExerciseInfo>? getFilteredExercises(PlanDay? planDay) {
    final exercises = _exercisesCubit.state.exercises;

    return planDay?.dayExercises
        ?.map((planExercise) {
          return exercises?.firstWhere(
              (exercise) => exercise.exerciseId == planExercise.exerciseRefId);
        })
        .whereType<ExerciseInfo>()
        .toList();
  }

  void navigateToDayAddExercisePage() {
    emit(state.copyWith(
      selectedListExercises: [],
      filteredExercisesForAdding: [],
    ));

    List<ExerciseInfo>? exercisesToExclude = state.exercisesOfDay;
    List<ExerciseInfo>? exercises = _exercisesCubit.state.exercises;

    if (exercisesToExclude == null || exercisesToExclude.isEmpty) {
      emit(state.copyWith(filteredExercisesForAdding: exercises));
      appRouter.push(const DayAddExerciseRoute());
      return;
    }

    List<ExerciseInfo> filteredExercises = exercises?.where((exercise) {
          return !exercisesToExclude
              .any((exclude) => exclude.exerciseId == exercise.exerciseId);
        }).toList() ??
        [];

    emit(state.copyWith(filteredExercisesForAdding: filteredExercises));

    appRouter.push(const DayAddExerciseRoute());
  }

  void toggleExerciseSelection(ExerciseInfo exerciseInfo) {
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

  bool isExerciseSelected(ExerciseInfo? exercisesInfo) {
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
        state.planDay?.dayId,
        state.selectedListExercises,
      );

      List<DayExercise> updatedExercisesOfPlanDay = [
        ...state.planDay?.dayExercises ?? [],
        ...state.selectedListExercises ?? []
      ];

      PlanDay? updatedPlanDay =
          state.planDay?.copyWith(dayExercises: updatedExercisesOfPlanDay);

      List<ExerciseInfo>? filteredExercises =
          getFilteredExercises(updatedPlanDay);

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
    List<ExerciseInfo>? exercises = _exercisesCubit.state.exercises;

    // Filter exercises that are not in exercisesOfDay
    List<ExerciseInfo>? filteredExercises = exercises?.where((exercise) {
      return state.exercisesOfDay?.any((planExercise) =>
              planExercise.exerciseId == exercise.exerciseId) ==
          false;
    }).toList();

    if (query.isEmpty) {
      emit(state.copyWith(filteredExercisesForAdding: filteredExercises));
    } else {
      filteredExercises = filteredExercises
          ?.where((exerciseInfo) =>
              getTranslationText(context, exerciseInfo.exercise.title)
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();

      emit(state.copyWith(filteredExercisesForAdding: filteredExercises));
    }
  }

  void deleteExerciseFromDay(DayExercise dayExercise) async {
    try {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.none,
      ));

      User? user = FirebaseAuth.instance.currentUser;
      String? planId = _workoutsCubit.state.currentPlan?.planId;
      await firestoreWorkoutsRepository.deleteExerciseFromDay(
        user?.uid,
        planId,
        state.planDay?.dayId,
        dayExercise.exerciseRefId,
      );

      List<DayExercise> updatedPlanDay =
          List.from(state.planDay?.dayExercises ?? []);

      updatedPlanDay.removeWhere(
          (element) => element.exerciseRefId == dayExercise.exerciseRefId);

      emit(state.copyWith(
          planDay: state.planDay?.copyWith(dayExercises: updatedPlanDay)));

      _workoutsCubit.deleteExerciseFromPlan(state.planDay);
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
      ));
    }
  }

  void toogleIsEditing() {
    emit(state.copyWith(isEditing: !state.isEditing));
  }

  void clearState() {
    emit(DayState());
  }
}
