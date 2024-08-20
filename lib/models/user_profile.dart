import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  factory UserProfile({
    required bool isConnectWithGoogleFit,
    required int defaultReps,
    required int defaultSets,
    required String unitSystem,
    required String email,
    String? userName,
    String? gender,
    String? height,
    String? photoUrl,
    String? topGoal,
    String? currentWorkoutLevel,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? birthDate,
    int? age,
    int? bmi,
    double? weight,
    @JsonKey(fromJson: _geoPointFromJson, toJson: _geoPointToJson)
    GeoPoint? basicGymLocation,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

DateTime? _timestampFromJson(Timestamp? timestamp) {
  return timestamp?.toDate();
}

Timestamp? _timestampToJson(DateTime? dateTime) {
  return dateTime != null ? Timestamp.fromDate(dateTime) : null;
}

GeoPoint? _geoPointFromJson(Map<String, dynamic>? json) {
  if (json == null) return null;
  return GeoPoint(json['latitude'] as double, json['longitude'] as double);
}

Map<String, dynamic>? _geoPointToJson(GeoPoint? geoPoint) {
  if (geoPoint == null) return null;
  return {
    'latitude': geoPoint.latitude,
    'longitude': geoPoint.longitude,
  };
}
