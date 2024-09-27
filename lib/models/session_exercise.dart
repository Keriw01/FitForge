import 'package:fit_forge/models/exercise_set.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_exercise.freezed.dart';
part 'session_exercise.g.dart';

@freezed

/// Represents a single exercise in a workout session, with a list of exercisesSets
class SessionExercise with _$SessionExercise {
  factory SessionExercise({
    required String exerciseRefId,
    int? duration,
    int? restTime,
    int? best1RM,
    List<ExerciseSet>? exercisesSets,
  }) = _SessionExercise;

  factory SessionExercise.fromJson(Map<String, dynamic> json) =>
      _$SessionExerciseFromJson(json);
}
