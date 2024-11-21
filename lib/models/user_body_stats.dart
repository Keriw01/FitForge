import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_body_stats.freezed.dart';
part 'user_body_stats.g.dart';

@freezed
class UserBodyStats with _$UserBodyStats {
  factory UserBodyStats({
    double? weight,
    String? height,
    DateTime? birthDate,
  }) = _UserBodyStats;

  factory UserBodyStats.fromJson(Map<String, dynamic> json) =>
      _$UserBodyStatsFromJson(json);
}
