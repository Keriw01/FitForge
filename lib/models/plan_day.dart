import 'package:fit_forge/models/day_exercise.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_day.freezed.dart';
part 'plan_day.g.dart';

@freezed

/// Represents a single day in plan, with a list of exercises.
class PlanDay with _$PlanDay {
  factory PlanDay({
    required String dayId,
    required String dayTitle,
    List<DayExercise>? dayExercises,
  }) = _PlanDay;

  factory PlanDay.fromJson(Map<String, dynamic> json) =>
      _$PlanDayFromJson(json);
}
