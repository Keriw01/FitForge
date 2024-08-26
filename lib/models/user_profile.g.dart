// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      isConnectWithGoogleFit: json['isConnectWithGoogleFit'] as bool,
      defaultReps: (json['defaultReps'] as num).toInt(),
      defaultSets: (json['defaultSets'] as num).toInt(),
      unitSystem: json['unitSystem'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String?,
      gender: json['gender'] as String?,
      height: json['height'] as String?,
      photoUrl: json['photoUrl'] as String?,
      topGoal: json['topGoal'] as String?,
      currentWorkoutLevel: json['currentWorkoutLevel'] as String?,
      birthDate: _timestampFromJson(json['birthDate'] as Timestamp?),
      age: (json['age'] as num?)?.toInt(),
      bmi: (json['bmi'] as num?)?.toInt(),
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
      'birthDate': _timestampToJson(instance.birthDate),
      'age': instance.age,
      'bmi': instance.bmi,
      'weight': instance.weight,
      'basicGymLocation': _geoPointToJson(instance.basicGymLocation),
    };
