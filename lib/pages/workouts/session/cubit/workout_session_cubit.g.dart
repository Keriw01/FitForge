// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkoutSessionStateCWProxy {
  WorkoutSessionState isLoading(bool isLoading);

  WorkoutSessionState firestoreResponseMessage(
      FirestoreResponseMessage firestoreResponseMessage);

  WorkoutSessionState workoutDuration(Duration workoutDuration);

  WorkoutSessionState inputWeight(double inputWeight);

  WorkoutSessionState inputReps(int inputReps);

  WorkoutSessionState countSets(int countSets);

  WorkoutSessionState dayExercise(DayExercise? dayExercise);

  WorkoutSessionState session(Session? session);

  WorkoutSessionState sessionExerciseInProgress(
      SessionExercise? sessionExerciseInProgress);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkoutSessionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkoutSessionState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkoutSessionState call({
    bool? isLoading,
    FirestoreResponseMessage? firestoreResponseMessage,
    Duration? workoutDuration,
    double? inputWeight,
    int? inputReps,
    int? countSets,
    DayExercise? dayExercise,
    Session? session,
    SessionExercise? sessionExerciseInProgress,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkoutSessionState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkoutSessionState.copyWith.fieldName(...)`
class _$WorkoutSessionStateCWProxyImpl implements _$WorkoutSessionStateCWProxy {
  const _$WorkoutSessionStateCWProxyImpl(this._value);

  final WorkoutSessionState _value;

  @override
  WorkoutSessionState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  WorkoutSessionState firestoreResponseMessage(
          FirestoreResponseMessage firestoreResponseMessage) =>
      this(firestoreResponseMessage: firestoreResponseMessage);

  @override
  WorkoutSessionState workoutDuration(Duration workoutDuration) =>
      this(workoutDuration: workoutDuration);

  @override
  WorkoutSessionState inputWeight(double inputWeight) =>
      this(inputWeight: inputWeight);

  @override
  WorkoutSessionState inputReps(int inputReps) => this(inputReps: inputReps);

  @override
  WorkoutSessionState countSets(int countSets) => this(countSets: countSets);

  @override
  WorkoutSessionState dayExercise(DayExercise? dayExercise) =>
      this(dayExercise: dayExercise);

  @override
  WorkoutSessionState session(Session? session) => this(session: session);

  @override
  WorkoutSessionState sessionExerciseInProgress(
          SessionExercise? sessionExerciseInProgress) =>
      this(sessionExerciseInProgress: sessionExerciseInProgress);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkoutSessionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkoutSessionState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkoutSessionState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? firestoreResponseMessage = const $CopyWithPlaceholder(),
    Object? workoutDuration = const $CopyWithPlaceholder(),
    Object? inputWeight = const $CopyWithPlaceholder(),
    Object? inputReps = const $CopyWithPlaceholder(),
    Object? countSets = const $CopyWithPlaceholder(),
    Object? dayExercise = const $CopyWithPlaceholder(),
    Object? session = const $CopyWithPlaceholder(),
    Object? sessionExerciseInProgress = const $CopyWithPlaceholder(),
  }) {
    return WorkoutSessionState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      firestoreResponseMessage:
          firestoreResponseMessage == const $CopyWithPlaceholder() ||
                  firestoreResponseMessage == null
              ? _value.firestoreResponseMessage
              // ignore: cast_nullable_to_non_nullable
              : firestoreResponseMessage as FirestoreResponseMessage,
      workoutDuration: workoutDuration == const $CopyWithPlaceholder() ||
              workoutDuration == null
          ? _value.workoutDuration
          // ignore: cast_nullable_to_non_nullable
          : workoutDuration as Duration,
      inputWeight:
          inputWeight == const $CopyWithPlaceholder() || inputWeight == null
              ? _value.inputWeight
              // ignore: cast_nullable_to_non_nullable
              : inputWeight as double,
      inputReps: inputReps == const $CopyWithPlaceholder() || inputReps == null
          ? _value.inputReps
          // ignore: cast_nullable_to_non_nullable
          : inputReps as int,
      countSets: countSets == const $CopyWithPlaceholder() || countSets == null
          ? _value.countSets
          // ignore: cast_nullable_to_non_nullable
          : countSets as int,
      dayExercise: dayExercise == const $CopyWithPlaceholder()
          ? _value.dayExercise
          // ignore: cast_nullable_to_non_nullable
          : dayExercise as DayExercise?,
      session: session == const $CopyWithPlaceholder()
          ? _value.session
          // ignore: cast_nullable_to_non_nullable
          : session as Session?,
      sessionExerciseInProgress:
          sessionExerciseInProgress == const $CopyWithPlaceholder()
              ? _value.sessionExerciseInProgress
              // ignore: cast_nullable_to_non_nullable
              : sessionExerciseInProgress as SessionExercise?,
    );
  }
}

extension $WorkoutSessionStateCopyWith on WorkoutSessionState {
  /// Returns a callable class that can be used as follows: `instanceOfWorkoutSessionState.copyWith(...)` or like so:`instanceOfWorkoutSessionState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkoutSessionStateCWProxy get copyWith =>
      _$WorkoutSessionStateCWProxyImpl(this);
}
