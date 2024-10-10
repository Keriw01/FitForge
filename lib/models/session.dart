import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_forge/models/session_exercise.dart';
import 'package:fit_forge/utils/formation/formation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed

/// Represents a single workout session, started by user
class Session with _$Session {
  factory Session({
    String? sessionId,
    String? userId,
    required String totalCaloriesBurned,
    required String totalDuration,
    required int totalExercises,
    required String totalWeightLifted,
    required int exercisesWith1RM,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    required DateTime? startTime,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    DateTime? endTime,
    List<SessionExercise>? sessionExercises,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
