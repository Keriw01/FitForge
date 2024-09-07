// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanDayImpl _$$PlanDayImplFromJson(Map<String, dynamic> json) =>
    _$PlanDayImpl(
      dayId: json['dayId'] as String,
      dayNumber: (json['dayNumber'] as num).toInt(),
      dayExercises: (json['dayExercises'] as List<dynamic>?)
          ?.map((e) => DayExercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlanDayImplToJson(_$PlanDayImpl instance) =>
    <String, dynamic>{
      'dayId': instance.dayId,
      'dayNumber': instance.dayNumber,
      'dayExercises': instance.dayExercises,
    };
