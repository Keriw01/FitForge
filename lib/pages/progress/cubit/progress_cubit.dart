import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_forge/base_cubit/base_cubit.dart';
import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/models/session_exercise.dart';
import 'package:fit_forge/models/user_body_stats.dart';
import 'package:fit_forge/pages/exercises/cubit/exercises_cubit.dart';
import 'package:fit_forge/repositories/firestore_profile_repository.dart';
import 'package:fit_forge/repositories/firestore_session_repository.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'progress_state.dart';
part 'progress_cubit.g.dart';

class ProgressCubit extends BaseCubit<ProgressState> {
  late final FirestoreSessionRepository firestoreSessionRepository =
      FirestoreSessionRepository();
  late final FirestoreProfileRepository firestoreProfileRepository =
      FirestoreProfileRepository();
  late final ExercisesCubit _exercisesCubit;

  ProgressCubit(AppRouter appRouter, BuildContext context)
      : _exercisesCubit = context.read<ExercisesCubit>(),
        super(
          appRouter,
          ProgressState(),
        ) {
    getUserProgress();
  }

  Future<void> getUserProgress() async {
    try {
      emit(state.copyWith(isLoading: true));

      User? user = FirebaseAuth.instance.currentUser;

      final sessions =
          await firestoreSessionRepository.getUserSessions(user?.uid);

      emit(state.copyWith(
          sessions: sessions
            ..sort((a, b) => b.startTime!.compareTo(a.startTime!))));

      await getUserBodyStats();
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

  Future<void> getUserBodyStats() async {
    try {
      emit(state.copyWith(isLoading: true));

      User? user = FirebaseAuth.instance.currentUser;

      final userBodyStats =
          await firestoreProfileRepository.getUserBodyStats(user?.uid);
      print("userBodyStats $userBodyStats");
      emit(state.copyWith(
        userBodyStats: userBodyStats,
        inputWeight: userBodyStats.weight,
        inputHeight: userBodyStats.height,
        inputBirthDate: userBodyStats.birthDate,
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
  }

  void navigateToActivityDetailPage(Session session) {
    emit(state.copyWith(
      isLoading: true,
    ));

    List<ExerciseInfo> filteredExercises =
        getFilteredExercises(session.sessionExercises);

    emit(state.copyWith(
      isLoading: false,
    ));

    appRouter.push(ActivityDetailRoute(
      session: session,
      exercises: filteredExercises,
    ));
  }

  List<ExerciseInfo> getFilteredExercises(
      List<SessionExercise>? sessionExercises) {
    final exercises = _exercisesCubit.state.exercises;

    return sessionExercises
            ?.map((planExercise) {
              return exercises?.firstWhere((exercise) =>
                  exercise.exerciseId == planExercise.exerciseRefId);
            })
            .whereType<ExerciseInfo>()
            .toList() ??
        [];
  }

  Map<String, double> getMonthlyWeightLifted(List<Session>? sessions) {
    if (sessions == null || sessions.isEmpty) {
      return {};
    }

    Map<String, double> monthlyWeightLifted = {};
    final String defaultLocale = Platform.localeName;

    final dateFormat = DateFormat('MMM', defaultLocale);

    for (Session session in sessions) {
      final monthKey = dateFormat.format(session.startTime!);

      if (monthlyWeightLifted.containsKey(monthKey)) {
        monthlyWeightLifted[monthKey] = monthlyWeightLifted[monthKey]! +
            double.parse(session.totalWeightLifted);
      } else {
        monthlyWeightLifted[monthKey] = double.parse(session.totalWeightLifted);
      }
    }

    return monthlyWeightLifted;
  }

  Future<void> updateUserBodyStats() async {
    try {
      emit(state.copyWith(
        isLoading: true,
      ));

      User? user = FirebaseAuth.instance.currentUser;
      UserBodyStats updatedUserBodyStats = UserBodyStats(
        weight: state.inputWeight,
        height: state.inputHeight,
        birthDate: state.inputBirthDate,
      );

      await firestoreProfileRepository.updateUserBodyStats(
        user?.uid,
        updatedUserBodyStats,
      );

      emit(state.copyWith(
        userBodyStats: updatedUserBodyStats,
        isLoading: false,
      ));
      appRouter.maybePop();
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

  void updateWeight(double? weight) {
    emit(state.copyWith(inputWeight: weight));
  }

  void updateHeight(String? height) {
    emit(state.copyWith(inputHeight: height));
  }

  void updateAge(DateTime? inputBirthDate) {
    emit(state.copyWith(inputBirthDate: inputBirthDate));
  }

  clearForm() {
    emit(state.copyWith(
      inputWeight: state.userBodyStats?.weight,
      inputHeight: state.userBodyStats?.height,
    ));
    appRouter.maybePop();
  }

  void clearState() {
    emit(ProgressState());
  }
}
