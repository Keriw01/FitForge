import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_set.freezed.dart';
part 'exercise_set.g.dart';

@freezed

/// Representation of a single exercise series during the user's active exercise session
class ExerciseSet with _$ExerciseSet {
  factory ExerciseSet({
    required int set,
    required double weight,
    required int reps,
  }) = _ExerciseSet;

  factory ExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSetFromJson(json);
}
