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
import 'package:fit_forge/pages/exercises/cubit/exercises_cubit.dart';
import 'package:fit_forge/repositories/firestore_session_repository.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'progress_state.dart';
part 'progress_cubit.g.dart';

class ProgressCubit extends BaseCubit<ProgressState> {
  late final FirestoreSessionRepository firestoreSessionRepository =
      FirestoreSessionRepository();
  late final ExercisesCubit _exercisesCubit;

  ProgressCubit(AppRouter appRouter, BuildContext context)
      : _exercisesCubit = context.read<ExercisesCubit>(),
        super(
          appRouter,
          ProgressState(),
        ) {
    getUserSessions();
  }

  Future<void> getUserSessions() async {
    try {
      emit(state.copyWith(isLoading: true));

      User? user = FirebaseAuth.instance.currentUser;

      final sessions =
          await firestoreSessionRepository.getUserSessions(user?.uid);

      emit(state.copyWith(
        sessions: sessions,
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
    print(dateFormat);
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

  void clearState() {
    emit(ProgressState());
  }
}
