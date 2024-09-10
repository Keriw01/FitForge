part of 'day_cubit.dart';

@CopyWith()
class DayState with EquatableMixin {
  final bool isLoading;
  final FirestoreResponseMessage firestoreResponseMessage;

  final PlanDay? planDay;
  final List<Exercises>? exercisesOfDay;

  final List<Exercises>? filteredExercisesForAdding;
  final List<DayExercise>? selectedListExercises;

  DayState({
    this.isLoading = true,
    this.firestoreResponseMessage = FirestoreResponseMessage.none,
    this.planDay,
    this.exercisesOfDay,
    this.filteredExercisesForAdding,
    this.selectedListExercises,
  });

  @override
  List<Object?> get props => [
        isLoading,
        firestoreResponseMessage,
        planDay,
        exercisesOfDay,
        filteredExercisesForAdding,
        selectedListExercises,
      ];
}
