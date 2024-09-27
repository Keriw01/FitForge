import 'package:fit_forge/models/exercise.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_info.freezed.dart';
part 'exercise_info.g.dart';

@freezed

/// Exercise information in firestore from collection 'Exercises'
class ExerciseInfo with _$ExerciseInfo {
  factory ExerciseInfo({
    required String exerciseId,
    required Exercise exercise,
  }) = _ExerciseInfo;

  factory ExerciseInfo.fromJson(Map<String, dynamic> json) =>
      _$ExerciseInfoFromJson(json);
}
