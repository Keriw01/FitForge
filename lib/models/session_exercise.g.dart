// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionExerciseImpl _$$SessionExerciseImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionExerciseImpl(
      exerciseRefId: json['exerciseRefId'] as String,
      duration: (json['duration'] as num?)?.toInt(),
      restTime: (json['restTime'] as num?)?.toInt(),
      best1RM: (json['best1RM'] as num?)?.toInt(),
      exercisesSets: (json['exercisesSets'] as List<dynamic>?)
          ?.map((e) => ExerciseSet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SessionExerciseImplToJson(
        _$SessionExerciseImpl instance) =>
    <String, dynamic>{
      'exerciseRefId': instance.exerciseRefId,
      'duration': instance.duration,
      'restTime': instance.restTime,
      'best1RM': instance.best1RM,
      'exercisesSets': instance.exercisesSets,
    };
