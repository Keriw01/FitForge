part of 'exercises_cubit.dart';

@CopyWith()
class ExercisesState with EquatableMixin {
  final FirestoreResponseMessage firestoreResponseMessage;
  final bool isLoading;
  final List<Exercises>? exercises;

  ExercisesState({
    this.firestoreResponseMessage = FirestoreResponseMessage.none,
    this.isLoading = false,
    this.exercises,
  });

  @override
  List<Object?> get props => [
        firestoreResponseMessage,
        isLoading,
        exercises,
      ];
}
