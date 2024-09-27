import 'package:fit_forge/models/plan_day.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan.freezed.dart';
part 'plan.g.dart';

@freezed

/// Represents a single training plan entered by the user
class Plan with _$Plan {
  factory Plan({
    required String difficultyLevel,
    required int numberOfDays,
    required String planDescription,
    String? planId,
    required String planName,
    required String planType,
    List<PlanDay>? days,
  }) = _Plan;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}
