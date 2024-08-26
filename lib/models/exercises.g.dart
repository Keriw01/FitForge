// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExercisesImpl _$$ExercisesImplFromJson(Map<String, dynamic> json) =>
    _$ExercisesImpl(
      exerciseId: json['exerciseId'] as String,
      exercise: Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExercisesImplToJson(_$ExercisesImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'exercise': instance.exercise,
    };
