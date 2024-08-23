import 'package:fit_forge/models/exercise.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercises.freezed.dart';
part 'exercises.g.dart';

@freezed
class Exercises with _$Exercises {
  factory Exercises({
    required String exerciseId,
    required Exercise exercise,
  }) = _Exercises;

  factory Exercises.fromJson(Map<String, dynamic> json) =>
      _$ExercisesFromJson(json);
}
