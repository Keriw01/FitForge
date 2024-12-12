import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_forge/models/plan_day.dart';
import 'package:fit_forge/utils/formation/formation.dart';
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
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    DateTime? lastPerformed,
    List<PlanDay>? days,
  }) = _Plan;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}
