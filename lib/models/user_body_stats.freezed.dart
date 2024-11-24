// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_body_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBodyStats _$UserBodyStatsFromJson(Map<String, dynamic> json) {
  return _UserBodyStats.fromJson(json);
}

/// @nodoc
mixin _$UserBodyStats {
  double? get weight => throw _privateConstructorUsedError;
  String? get height => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  DateTime? get birthDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserBodyStatsCopyWith<UserBodyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBodyStatsCopyWith<$Res> {
  factory $UserBodyStatsCopyWith(
          UserBodyStats value, $Res Function(UserBodyStats) then) =
      _$UserBodyStatsCopyWithImpl<$Res, UserBodyStats>;
  @useResult
  $Res call(
      {double? weight,
      String? height,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      DateTime? birthDate});
}

/// @nodoc
class _$UserBodyStatsCopyWithImpl<$Res, $Val extends UserBodyStats>
    implements $UserBodyStatsCopyWith<$Res> {
  _$UserBodyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
    Object? height = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_value.copyWith(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBodyStatsImplCopyWith<$Res>
    implements $UserBodyStatsCopyWith<$Res> {
  factory _$$UserBodyStatsImplCopyWith(
          _$UserBodyStatsImpl value, $Res Function(_$UserBodyStatsImpl) then) =
      __$$UserBodyStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? weight,
      String? height,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      DateTime? birthDate});
}

/// @nodoc
class __$$UserBodyStatsImplCopyWithImpl<$Res>
    extends _$UserBodyStatsCopyWithImpl<$Res, _$UserBodyStatsImpl>
    implements _$$UserBodyStatsImplCopyWith<$Res> {
  __$$UserBodyStatsImplCopyWithImpl(
      _$UserBodyStatsImpl _value, $Res Function(_$UserBodyStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
    Object? height = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_$UserBodyStatsImpl(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBodyStatsImpl implements _UserBodyStats {
  _$UserBodyStatsImpl(
      {this.weight,
      this.height,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      this.birthDate});

  factory _$UserBodyStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBodyStatsImplFromJson(json);

  @override
  final double? weight;
  @override
  final String? height;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final DateTime? birthDate;

  @override
  String toString() {
    return 'UserBodyStats(weight: $weight, height: $height, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBodyStatsImpl &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, weight, height, birthDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBodyStatsImplCopyWith<_$UserBodyStatsImpl> get copyWith =>
      __$$UserBodyStatsImplCopyWithImpl<_$UserBodyStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBodyStatsImplToJson(
      this,
    );
  }
}

abstract class _UserBodyStats implements UserBodyStats {
  factory _UserBodyStats(
      {final double? weight,
      final String? height,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      final DateTime? birthDate}) = _$UserBodyStatsImpl;

  factory _UserBodyStats.fromJson(Map<String, dynamic> json) =
      _$UserBodyStatsImpl.fromJson;

  @override
  double? get weight;
  @override
  String? get height;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  DateTime? get birthDate;
  @override
  @JsonKey(ignore: true)
  _$$UserBodyStatsImplCopyWith<_$UserBodyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
