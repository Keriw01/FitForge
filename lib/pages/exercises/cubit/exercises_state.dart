part of 'exercises_cubit.dart';

@CopyWith()
class ExercisesState with EquatableMixin {
  final FirestoreResponseMessage firestoreResponseMessage;
  final bool isLoading;
  final List<Exercises>? exercises;
  final bool isFiltering;
  final List<Exercises>? filteredExercises;

  ExercisesState({
    this.firestoreResponseMessage = FirestoreResponseMessage.none,
    this.isLoading = false,
    this.exercises,
    this.isFiltering = false,
    this.filteredExercises,
  });

  @override
  List<Object?> get props => [
        firestoreResponseMessage,
        isLoading,
        exercises,
        isFiltering,
        filteredExercises,
      ];
}
