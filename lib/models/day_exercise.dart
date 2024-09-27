import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_exercise.freezed.dart';
part 'day_exercise.g.dart';

@freezed

/// Single exercise of the day, possible to customize the appropriate fields by user
class DayExercise with _$DayExercise {
  factory DayExercise({
    required String exerciseRefId,
    required int numberOfSets,
    required int numberOfReps,
    int? duration,
    int? restTime,
    int? best1RM,
  }) = _DayExercise;

  factory DayExercise.fromJson(Map<String, dynamic> json) =>
      _$DayExerciseFromJson(json);
}
