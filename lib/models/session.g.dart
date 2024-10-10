// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      sessionId: json['sessionId'] as String?,
      userId: json['userId'] as String?,
      totalCaloriesBurned: json['totalCaloriesBurned'] as String,
      totalDuration: json['totalDuration'] as String,
      totalExercises: (json['totalExercises'] as num).toInt(),
      totalWeightLifted: json['totalWeightLifted'] as String,
      exercisesWith1RM: (json['exercisesWith1RM'] as num).toInt(),
      startTime: timestampFromJson(json['startTime'] as Timestamp?),
      endTime: timestampFromJson(json['endTime'] as Timestamp?),
      sessionExercises: (json['sessionExercises'] as List<dynamic>?)
          ?.map((e) => SessionExercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'userId': instance.userId,
      'totalCaloriesBurned': instance.totalCaloriesBurned,
      'totalDuration': instance.totalDuration,
      'totalExercises': instance.totalExercises,
      'totalWeightLifted': instance.totalWeightLifted,
      'exercisesWith1RM': instance.exercisesWith1RM,
      'startTime': timestampToJson(instance.startTime),
      'endTime': timestampToJson(instance.endTime),
      'sessionExercises': instance.sessionExercises,
    };
