// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DayStateCWProxy {
  DayState isLoading(bool isLoading);

  DayState firestoreResponseMessage(
      FirestoreResponseMessage firestoreResponseMessage);

  DayState planDay(PlanDay? planDay);

  DayState exercisesOfDay(List<ExerciseInfo>? exercisesOfDay);

  DayState filteredExercisesForAdding(
      List<ExerciseInfo>? filteredExercisesForAdding);

  DayState selectedListExercises(List<DayExercise>? selectedListExercises);

  DayState isEditing(bool isEditing);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DayState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DayState(...).copyWith(id: 12, name: "My name")
  /// ````
  DayState call({
    bool? isLoading,
    FirestoreResponseMessage? firestoreResponseMessage,
    PlanDay? planDay,
    List<ExerciseInfo>? exercisesOfDay,
    List<ExerciseInfo>? filteredExercisesForAdding,
    List<DayExercise>? selectedListExercises,
    bool? isEditing,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDayState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDayState.copyWith.fieldName(...)`
class _$DayStateCWProxyImpl implements _$DayStateCWProxy {
  const _$DayStateCWProxyImpl(this._value);

  final DayState _value;

  @override
  DayState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  DayState firestoreResponseMessage(
          FirestoreResponseMessage firestoreResponseMessage) =>
      this(firestoreResponseMessage: firestoreResponseMessage);

  @override
  DayState planDay(PlanDay? planDay) => this(planDay: planDay);

  @override
  DayState exercisesOfDay(List<ExerciseInfo>? exercisesOfDay) =>
      this(exercisesOfDay: exercisesOfDay);

  @override
  DayState filteredExercisesForAdding(
          List<ExerciseInfo>? filteredExercisesForAdding) =>
      this(filteredExercisesForAdding: filteredExercisesForAdding);

  @override
  DayState selectedListExercises(List<DayExercise>? selectedListExercises) =>
      this(selectedListExercises: selectedListExercises);

  @override
  DayState isEditing(bool isEditing) => this(isEditing: isEditing);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DayState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DayState(...).copyWith(id: 12, name: "My name")
  /// ````
  DayState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? firestoreResponseMessage = const $CopyWithPlaceholder(),
    Object? planDay = const $CopyWithPlaceholder(),
    Object? exercisesOfDay = const $CopyWithPlaceholder(),
    Object? filteredExercisesForAdding = const $CopyWithPlaceholder(),
    Object? selectedListExercises = const $CopyWithPlaceholder(),
    Object? isEditing = const $CopyWithPlaceholder(),
  }) {
    return DayState(
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
      planDay: planDay == const $CopyWithPlaceholder()
          ? _value.planDay
          // ignore: cast_nullable_to_non_nullable
          : planDay as PlanDay?,
      exercisesOfDay: exercisesOfDay == const $CopyWithPlaceholder()
          ? _value.exercisesOfDay
          // ignore: cast_nullable_to_non_nullable
          : exercisesOfDay as List<ExerciseInfo>?,
      filteredExercisesForAdding:
          filteredExercisesForAdding == const $CopyWithPlaceholder()
              ? _value.filteredExercisesForAdding
              // ignore: cast_nullable_to_non_nullable
              : filteredExercisesForAdding as List<ExerciseInfo>?,
      selectedListExercises:
          selectedListExercises == const $CopyWithPlaceholder()
              ? _value.selectedListExercises
              // ignore: cast_nullable_to_non_nullable
              : selectedListExercises as List<DayExercise>?,
      isEditing: isEditing == const $CopyWithPlaceholder() || isEditing == null
          ? _value.isEditing
          // ignore: cast_nullable_to_non_nullable
          : isEditing as bool,
    );
  }
}

extension $DayStateCopyWith on DayState {
  /// Returns a callable class that can be used as follows: `instanceOfDayState.copyWith(...)` or like so:`instanceOfDayState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DayStateCWProxy get copyWith => _$DayStateCWProxyImpl(this);
}
