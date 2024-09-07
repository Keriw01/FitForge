import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_exercise.freezed.dart';
part 'day_exercise.g.dart';

@freezed
class DayExercise with _$DayExercise {
  factory DayExercise({
    required int numberOfSets,
    required int numberOfReps,
    int? duration,
    int? restTime,
    int? best1RM,
  }) = _DayExercise;

  factory DayExercise.fromJson(Map<String, dynamic> json) =>
      _$DayExerciseFromJson(json);
}