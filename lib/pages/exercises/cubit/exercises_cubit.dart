import 'package:fit_forge/base_cubit/base_cubit.dart';
import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/repositories/firestore_exercises_repository.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'exercises_state.dart';
part 'exercises_cubit.g.dart';

class ExercisesCubit extends BaseCubit<ExercisesState> {
  late final FirestoreExercisesRepository firestoreExercisesRepository =
      FirestoreExercisesRepository();

  ExercisesCubit(AppRouter appRouter, BuildContext context)
      : super(
          appRouter,
          ExercisesState(),
        ) {
    _getExercises();
  }

  Future<void> _getExercises() async {
    try {
      emit(state.copyWith(isLoading: true));

      List<ExerciseInfo> exercises =
          await firestoreExercisesRepository.getExercises();

      emit(state.copyWith(
        exercises: exercises,
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

  void navigateToExercisesPage(String bodyPart) {
    appRouter.push(ExercisesRoute(bodyPart: bodyPart));
  }

  void filteringExercises(String bodyPart) {
    emit(state.copyWith(
      isFiltering: true,
      filteredExercises: [],
    ));

    final filteredExercised = state.exercises
        ?.where((element) => element.exercise.mainBodyPart.en == bodyPart)
        .toList();

    emit(state.copyWith(
      isFiltering: false,
      filteredExercises: filteredExercised,
    ));
  }

  void clearState() {
    emit(ExercisesState());
  }
}
