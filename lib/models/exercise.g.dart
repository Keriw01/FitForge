// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      qrCode: json['qrCode'] as String,
      videoUrl: json['videoUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      title: Translation.fromJson(json['title'] as Map<String, dynamic>),
      description:
          Translation.fromJson(json['description'] as Map<String, dynamic>),
      mainBodyPart:
          Translation.fromJson(json['mainBodyPart'] as Map<String, dynamic>),
      otherBodyParts: (json['otherBodyParts'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Translation.fromJson(e as Map<String, dynamic>)),
      ),
      equipment: (json['equipment'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Translation.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'qrCode': instance.qrCode,
      'videoUrl': instance.videoUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'title': instance.title,
      'description': instance.description,
      'mainBodyPart': instance.mainBodyPart,
      'otherBodyParts': instance.otherBodyParts,
      'equipment': instance.equipment,
    };
