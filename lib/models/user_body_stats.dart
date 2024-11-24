import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_forge/utils/formation/formation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_body_stats.freezed.dart';
part 'user_body_stats.g.dart';

@freezed
class UserBodyStats with _$UserBodyStats {
  factory UserBodyStats({
    double? weight,
    String? height,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    DateTime? birthDate,
  }) = _UserBodyStats;

  factory UserBodyStats.fromJson(Map<String, dynamic> json) =>
      _$UserBodyStatsFromJson(json);
}
