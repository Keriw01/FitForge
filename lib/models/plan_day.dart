import 'package:fit_forge/models/day_exercise.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_day.freezed.dart';
part 'plan_day.g.dart';

@freezed
class PlanDay with _$PlanDay {
  factory PlanDay({
    required String dayId,
    required int dayNumber,
    List<DayExercise>? dayExercises,
  }) = _PlanDay;

  factory PlanDay.fromJson(Map<String, dynamic> json) =>
      _$PlanDayFromJson(json);
}
