part of 'workout_session_cubit.dart';

@CopyWith()
class WorkoutSessionState with EquatableMixin {
  final bool isLoading;
  final FirestoreResponseMessage firestoreResponseMessage;

  final Duration workoutDuration;

  final double inputWeight;
  final int inputReps;
  final int countSets;

  final DayExercise? dayExercise;

  /// Main Session used to save in firebase data
  final Session? session;

  /// Temp SessionExercise helped display right sets, weight, reps, in complete series
  final SessionExercise? sessionExerciseInProgress;

  WorkoutSessionState({
    this.isLoading = false,
    this.firestoreResponseMessage = FirestoreResponseMessage.none,
    this.workoutDuration = Duration.zero,
    this.inputWeight = 0,
    this.inputReps = 0,
    this.countSets = 0,
    this.dayExercise,
    this.session,
    this.sessionExerciseInProgress,
  });

  @override
  List<Object?> get props => [
        isLoading,
        firestoreResponseMessage,
        workoutDuration,
        inputWeight,
        inputReps,
        countSets,
        dayExercise,
        session,
        sessionExerciseInProgress,
      ];
}
