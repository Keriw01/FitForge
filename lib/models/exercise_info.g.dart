// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseInfoImpl _$$ExerciseInfoImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseInfoImpl(
      exerciseId: json['exerciseId'] as String,
      exercise: Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExerciseInfoImplToJson(_$ExerciseInfoImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'exercise': instance.exercise,
    };
