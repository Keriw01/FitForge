// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      isConnectWithGoogleFit: json['isConnectWithGoogleFit'] as bool,
      defaultReps: json['defaultReps'] as int,
      defaultSets: json['defaultSets'] as int,
      unitSystem: json['unitSystem'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String?,
      gender: json['gender'] as String?,
      height: json['height'] as String?,
      photoUrl: json['photoUrl'] as String?,
      topGoal: json['topGoal'] as String?,
      currentWorkoutLevel: json['currentWorkoutLevel'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      age: json['age'] as int?,
      bmi: json['bmi'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      basicGymLocation:
          _geoPointFromJson(json['basicGymLocation'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'isConnectWithGoogleFit': instance.isConnectWithGoogleFit,
      'defaultReps': instance.defaultReps,
      'defaultSets': instance.defaultSets,
      'unitSystem': instance.unitSystem,
      'email': instance.email,
      'userName': instance.userName,
      'gender': instance.gender,
      'height': instance.height,
      'photoUrl': instance.photoUrl,
      'topGoal': instance.topGoal,
      'currentWorkoutLevel': instance.currentWorkoutLevel,
      'birthDate': instance.birthDate?.toIso8601String(),
      'age': instance.age,
      'bmi': instance.bmi,
      'weight': instance.weight,
      'basicGymLocation': _geoPointToJson(instance.basicGymLocation),
    };