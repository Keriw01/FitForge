// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanImpl _$$PlanImplFromJson(Map<String, dynamic> json) => _$PlanImpl(
      difficultyLevel: json['difficultyLevel'] as String,
      numberOfDays: (json['numberOfDays'] as num).toInt(),
      planDescription: json['planDescription'] as String,
      planId: json['planId'] as String?,
      planName: json['planName'] as String,
      planType: json['planType'] as String,
      lastPerformed: timestampFromJson(json['lastPerformed'] as Timestamp?),
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => PlanDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlanImplToJson(_$PlanImpl instance) =>
    <String, dynamic>{
      'difficultyLevel': instance.difficultyLevel,
      'numberOfDays': instance.numberOfDays,
      'planDescription': instance.planDescription,
      'planId': instance.planId,
      'planName': instance.planName,
      'planType': instance.planType,
      'lastPerformed': timestampToJson(instance.lastPerformed),
      'days': instance.days,
    };
