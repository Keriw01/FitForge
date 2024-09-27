import 'package:fit_forge/models/translation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

@freezed

/// Represents a single exercise from firestore collection 'Exercises'.
/// Used to store and display single exercise data in the app
class Exercise with _$Exercise {
  factory Exercise({
    required String qrCode,
    required String videoUrl,
    required String thumbnailUrl,
    required Translation title,
    required Translation description,
    required Translation mainBodyPart,
    required Map<String, Translation> otherBodyParts,
    required Map<String, Translation> equipment,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}
