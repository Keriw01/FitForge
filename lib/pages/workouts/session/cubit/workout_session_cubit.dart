import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_forge/base_cubit/base_cubit.dart';
import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/models/day_exercise.dart';
import 'package:fit_forge/models/exercise.dart';
import 'package:fit_forge/models/exercise_set.dart';
import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/models/session_exercise.dart';
import 'package:fit_forge/repositories/firestore_session_repository.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/utils/formation/formation.dart';
import 'package:flutter/material.dart';

part 'workout_session_state.dart';
part 'workout_session_cubit.g.dart';

class WorkoutSessionCubit extends BaseCubit<WorkoutSessionState> {
  late final FirestoreSessionRepository firestoreSessionRepository =
      FirestoreSessionRepository();

  Timer? _timer;

  WorkoutSessionCubit(AppRouter appRouter, BuildContext context)
      : super(
          appRouter,
          WorkoutSessionState(),
        );

  Future<void> startWorkout() async {
    try {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.none,
        isLoading: true,
      ));

      User? user = FirebaseAuth.instance.currentUser;

      Session newSession =
          await firestoreSessionRepository.addNewSession(user?.uid);

      emit(state.copyWith(
        workoutDuration: Duration.zero,
        session: newSession,
        isLoading: false,
      ));

      _startTimer();
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
        isLoading: false,
      ));
    }
  }

  void navigateToSessionDayExercise(
    Exercise exercise,
    DayExercise dayExercise,
  ) {
    emit(state.copyWith(
      dayExercise: dayExercise,
    ));

    if (state.session?.sessionExercises == null) {
      emit(state.copyWith(
        countSets: 0,
        inputWeight: 0,
        inputReps: 0,
      ));
    } else {
      SessionExercise? sessionExerciseInProgress =
          state.session?.sessionExercises?.firstWhere(
        (element) => element.exerciseRefId == dayExercise.exerciseRefId,
        orElse: () => SessionExercise(exerciseRefId: ''),
      );

      if (sessionExerciseInProgress?.exerciseRefId != '') {
        emit(state.copyWith(
          countSets: sessionExerciseInProgress?.exercisesSets?.length ?? 0,
          inputWeight: 0,
          inputReps: 0,
          sessionExerciseInProgress: sessionExerciseInProgress,
        ));
      } else {
        emit(state.copyWith(
          countSets: 0,
          inputWeight: 0,
          inputReps: 0,
        ));
      }
    }

    appRouter.push(ExerciseSessionRoute(
      exercise: exercise,
      dayExercise: dayExercise,
    ));
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final newDuration = state.workoutDuration + const Duration(seconds: 1);
      emit(state.copyWith(workoutDuration: newDuration));
    });
  }

  void endWorkout() {
    if (state.session?.startTime != null) {
      final dateTimeNow = DateTime.now();
      final totalDuration = dateTimeNow.difference(state.session!.startTime!);

      emit(state.copyWith(
        session: state.session?.copyWith(
          endTime: dateTimeNow,
          totalDuration: formatDuration(totalDuration),
        ),
      ));
    }

    _timer?.cancel();
    appRouter.replaceAll([const WorkoutSummarySessionRoute()]);
  }

  Future<void> saveWorkout() async {
    try {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.none,
        isLoading: true,
      ));

      User? user = FirebaseAuth.instance.currentUser;

      await firestoreSessionRepository.saveEndedSession(
        user?.uid,
        state.session!,
      );

      appRouter.replaceAll([const AuthenticationFlowRoute()]);
      emit(state.copyWith(
        isLoading: false,
      ));
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
        isLoading: false,
      ));
    }

    clearState();
  }

  Future<void> deleteWorkout() async {
    try {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.none,
        isLoading: true,
      ));

      User? user = FirebaseAuth.instance.currentUser;

      await firestoreSessionRepository.deleteEndedWorkout(
        user?.uid,
        state.session!,
      );

      appRouter.replaceAll([const AuthenticationFlowRoute()]);
      emit(state.copyWith(
        isLoading: false,
      ));
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
        isLoading: false,
      ));
    }

    clearState();
  }

  void updateWeight(double weight) {
    emit(state.copyWith(inputWeight: weight));
  }

  void updateReps(int reps) {
    emit(state.copyWith(inputReps: reps));
  }

  bool canLogSet() {
    return state.inputWeight > 0 && state.inputReps > 0;
  }

  void logSet() {
    if (canLogSet()) {
      // Find existing exercise in session
      SessionExercise? updatedSessionExercise =
          state.session?.sessionExercises?.firstWhere(
        (sessionExercise) =>
            sessionExercise.exerciseRefId == state.dayExercise?.exerciseRefId,
        orElse: () => SessionExercise(exerciseRefId: ''),
      );

      double newTotalWeightLifted =
          state.inputWeight + double.parse(state.session!.totalWeightLifted);

      if (updatedSessionExercise?.exerciseRefId == '' ||
          updatedSessionExercise == null) {
        // Exercise not exist in session, create new and add exercise

        emit(state.copyWith(
          session: state.session?.copyWith(
            totalExercises: state.session!.totalExercises + 1,
            totalWeightLifted: newTotalWeightLifted.toString(),
            sessionExercises: [
              ...(state.session?.sessionExercises ?? []),
              SessionExercise(
                exerciseRefId: state.dayExercise!.exerciseRefId,
                exercisesSets: [
                  ExerciseSet(
                    set: 1,
                    weight: state.inputWeight,
                    reps: state.inputReps,
                  )
                ],
              ),
            ],
          ),
        ));
      } else {
        // Exercise exist, update list of sets
        List<SessionExercise> updatedSessionExercises =
            state.session!.sessionExercises!.map((sessionExercise) {
          if (sessionExercise.exerciseRefId ==
              updatedSessionExercise.exerciseRefId) {
            return sessionExercise.copyWith(
              exercisesSets: [
                ...sessionExercise.exercisesSets!,
                ExerciseSet(
                  set: sessionExercise.exercisesSets!.last.set + 1,
                  weight: state.inputWeight,
                  reps: state.inputReps,
                ),
              ],
            );
          }
          return sessionExercise;
        }).toList();

        emit(state.copyWith(
          session: state.session?.copyWith(
            sessionExercises: updatedSessionExercises,
            totalWeightLifted: newTotalWeightLifted.toString(),
          ),
        ));
      }

      // Increment the number of sets and reset the weights and reps
      if (state.countSets <= state.dayExercise!.numberOfSets) {
        emit(state.copyWith(
          countSets: state.countSets + 1,
          inputWeight: 0,
          inputReps: 0,
        ));
      }
    }
  }

  void clearState() {
    emit(WorkoutSessionState());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
