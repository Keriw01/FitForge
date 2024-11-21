// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_body_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBodyStatsImpl _$$UserBodyStatsImplFromJson(Map<String, dynamic> json) =>
    _$UserBodyStatsImpl(
      weight: (json['weight'] as num?)?.toDouble(),
      height: json['height'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$$UserBodyStatsImplToJson(_$UserBodyStatsImpl instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'birthDate': instance.birthDate?.toIso8601String(),
    };
