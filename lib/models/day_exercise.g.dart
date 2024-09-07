// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DayExerciseImpl _$$DayExerciseImplFromJson(Map<String, dynamic> json) =>
    _$DayExerciseImpl(
      numberOfSets: (json['numberOfSets'] as num).toInt(),
      numberOfReps: (json['numberOfReps'] as num).toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      restTime: (json['restTime'] as num?)?.toInt(),
      best1RM: (json['best1RM'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DayExerciseImplToJson(_$DayExerciseImpl instance) =>
    <String, dynamic>{
      'numberOfSets': instance.numberOfSets,
      'numberOfReps': instance.numberOfReps,
      'duration': instance.duration,
      'restTime': instance.restTime,
      'best1RM': instance.best1RM,
    };
