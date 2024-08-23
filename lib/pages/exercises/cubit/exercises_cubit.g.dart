// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExercisesStateCWProxy {
  ExercisesState firestoreResponseMessage(
      FirestoreResponseMessage firestoreResponseMessage);

  ExercisesState isLoading(bool isLoading);

  ExercisesState exercises(List<Exercises>? exercises);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExercisesState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExercisesState(...).copyWith(id: 12, name: "My name")
  /// ````
  ExercisesState call({
    FirestoreResponseMessage? firestoreResponseMessage,
    bool? isLoading,
    List<Exercises>? exercises,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExercisesState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExercisesState.copyWith.fieldName(...)`
class _$ExercisesStateCWProxyImpl implements _$ExercisesStateCWProxy {
  const _$ExercisesStateCWProxyImpl(this._value);

  final ExercisesState _value;

  @override
  ExercisesState firestoreResponseMessage(
          FirestoreResponseMessage firestoreResponseMessage) =>
      this(firestoreResponseMessage: firestoreResponseMessage);

  @override
  ExercisesState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ExercisesState exercises(List<Exercises>? exercises) =>
      this(exercises: exercises);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExercisesState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExercisesState(...).copyWith(id: 12, name: "My name")
  /// ````
  ExercisesState call({
    Object? firestoreResponseMessage = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? exercises = const $CopyWithPlaceholder(),
  }) {
    return ExercisesState(
      firestoreResponseMessage:
          firestoreResponseMessage == const $CopyWithPlaceholder() ||
                  firestoreResponseMessage == null
              ? _value.firestoreResponseMessage
              // ignore: cast_nullable_to_non_nullable
              : firestoreResponseMessage as FirestoreResponseMessage,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      exercises: exercises == const $CopyWithPlaceholder()
          ? _value.exercises
          // ignore: cast_nullable_to_non_nullable
          : exercises as List<Exercises>?,
    );
  }
}

extension $ExercisesStateCopyWith on ExercisesState {
  /// Returns a callable class that can be used as follows: `instanceOfExercisesState.copyWith(...)` or like so:`instanceOfExercisesState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExercisesStateCWProxy get copyWith => _$ExercisesStateCWProxyImpl(this);
}
