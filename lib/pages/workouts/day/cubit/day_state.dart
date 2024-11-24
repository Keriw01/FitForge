part of 'day_cubit.dart';

@CopyWith()
class DayState with EquatableMixin {
  final bool isLoading;
  final FirestoreResponseMessage firestoreResponseMessage;

  final PlanDay? planDay;
  final List<ExerciseInfo>? exercisesOfDay;

  final List<ExerciseInfo>? filteredExercisesForAdding;
  final List<DayExercise>? selectedListExercises;

  final bool isEditing;

  DayState({
    this.isLoading = true,
    this.firestoreResponseMessage = FirestoreResponseMessage.none,
    this.planDay,
    this.exercisesOfDay,
    this.filteredExercisesForAdding,
    this.selectedListExercises,
    this.isEditing = false,
  });

  @override
  List<Object?> get props => [
        isLoading,
        firestoreResponseMessage,
        planDay,
        exercisesOfDay,
        filteredExercisesForAdding,
        selectedListExercises,
        isEditing,
      ];
}
