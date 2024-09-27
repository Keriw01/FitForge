// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  bool get isConnectWithGoogleFit => throw _privateConstructorUsedError;
  int get defaultReps => throw _privateConstructorUsedError;
  int get defaultSets => throw _privateConstructorUsedError;
  String get unitSystem => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get height => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get topGoal => throw _privateConstructorUsedError;
  String? get currentWorkoutLevel => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  DateTime? get birthDate => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  int? get bmi => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _geoPointFromJson, toJson: _geoPointToJson)
  GeoPoint? get basicGymLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {bool isConnectWithGoogleFit,
      int defaultReps,
      int defaultSets,
      String unitSystem,
      String email,
      String? userName,
      String? gender,
      String? height,
      String? photoUrl,
      String? topGoal,
      String? currentWorkoutLevel,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      DateTime? birthDate,
      int? age,
      int? bmi,
      double? weight,
      @JsonKey(fromJson: _geoPointFromJson, toJson: _geoPointToJson)
      GeoPoint? basicGymLocation});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnectWithGoogleFit = null,
    Object? defaultReps = null,
    Object? defaultSets = null,
    Object? unitSystem = null,
    Object? email = null,
    Object? userName = freezed,
    Object? gender = freezed,
    Object? height = freezed,
    Object? photoUrl = freezed,
    Object? topGoal = freezed,
    Object? currentWorkoutLevel = freezed,
    Object? birthDate = freezed,
    Object? age = freezed,
    Object? bmi = freezed,
    Object? weight = freezed,
    Object? basicGymLocation = freezed,
  }) {
    return _then(_value.copyWith(
      isConnectWithGoogleFit: null == isConnectWithGoogleFit
          ? _value.isConnectWithGoogleFit
          : isConnectWithGoogleFit // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultReps: null == defaultReps
          ? _value.defaultReps
          : defaultReps // ignore: cast_nullable_to_non_nullable
              as int,
      defaultSets: null == defaultSets
          ? _value.defaultSets
          : defaultSets // ignore: cast_nullable_to_non_nullable
              as int,
      unitSystem: null == unitSystem
          ? _value.unitSystem
          : unitSystem // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      topGoal: freezed == topGoal
          ? _value.topGoal
          : topGoal // ignore: cast_nullable_to_non_nullable
              as String?,
      currentWorkoutLevel: freezed == currentWorkoutLevel
          ? _value.currentWorkoutLevel
          : currentWorkoutLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      bmi: freezed == bmi
          ? _value.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      basicGymLocation: freezed == basicGymLocation
          ? _value.basicGymLocation
          : basicGymLocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isConnectWithGoogleFit,
      int defaultReps,
      int defaultSets,
      String unitSystem,
      String email,
      String? userName,
      String? gender,
      String? height,
      String? photoUrl,
      String? topGoal,
      String? currentWorkoutLevel,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      DateTime? birthDate,
      int? age,
      int? bmi,
      double? weight,
      @JsonKey(fromJson: _geoPointFromJson, toJson: _geoPointToJson)
      GeoPoint? basicGymLocation});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnectWithGoogleFit = null,
    Object? defaultReps = null,
    Object? defaultSets = null,
    Object? unitSystem = null,
    Object? email = null,
    Object? userName = freezed,
    Object? gender = freezed,
    Object? height = freezed,
    Object? photoUrl = freezed,
    Object? topGoal = freezed,
    Object? currentWorkoutLevel = freezed,
    Object? birthDate = freezed,
    Object? age = freezed,
    Object? bmi = freezed,
    Object? weight = freezed,
    Object? basicGymLocation = freezed,
  }) {
    return _then(_$UserProfileImpl(
      isConnectWithGoogleFit: null == isConnectWithGoogleFit
          ? _value.isConnectWithGoogleFit
          : isConnectWithGoogleFit // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultReps: null == defaultReps
          ? _value.defaultReps
          : defaultReps // ignore: cast_nullable_to_non_nullable
              as int,
      defaultSets: null == defaultSets
          ? _value.defaultSets
          : defaultSets // ignore: cast_nullable_to_non_nullable
              as int,
      unitSystem: null == unitSystem
          ? _value.unitSystem
          : unitSystem // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      topGoal: freezed == topGoal
          ? _value.topGoal
          : topGoal // ignore: cast_nullable_to_non_nullable
              as String?,
      currentWorkoutLevel: freezed == currentWorkoutLevel
          ? _value.currentWorkoutLevel
          : currentWorkoutLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      bmi: freezed == bmi
          ? _value.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      basicGymLocation: freezed == basicGymLocation
          ? _value.basicGymLocation
          : basicGymLocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  _$UserProfileImpl(
      {required this.isConnectWithGoogleFit,
      required this.defaultReps,
      required this.defaultSets,
      required this.unitSystem,
      required this.email,
      this.userName,
      this.gender,
      this.height,
      this.photoUrl,
      this.topGoal,
      this.currentWorkoutLevel,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      this.birthDate,
      this.age,
      this.bmi,
      this.weight,
      @JsonKey(fromJson: _geoPointFromJson, toJson: _geoPointToJson)
      this.basicGymLocation});

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final bool isConnectWithGoogleFit;
  @override
  final int defaultReps;
  @override
  final int defaultSets;
  @override
  final String unitSystem;
  @override
  final String email;
  @override
  final String? userName;
  @override
  final String? gender;
  @override
  final String? height;
  @override
  final String? photoUrl;
  @override
  final String? topGoal;
  @override
  final String? currentWorkoutLevel;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final DateTime? birthDate;
  @override
  final int? age;
  @override
  final int? bmi;
  @override
  final double? weight;
  @override
  @JsonKey(fromJson: _geoPointFromJson, toJson: _geoPointToJson)
  final GeoPoint? basicGymLocation;

  @override
  String toString() {
    return 'UserProfile(isConnectWithGoogleFit: $isConnectWithGoogleFit, defaultReps: $defaultReps, defaultSets: $defaultSets, unitSystem: $unitSystem, email: $email, userName: $userName, gender: $gender, height: $height, photoUrl: $photoUrl, topGoal: $topGoal, currentWorkoutLevel: $currentWorkoutLevel, birthDate: $birthDate, age: $age, bmi: $bmi, weight: $weight, basicGymLocation: $basicGymLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.isConnectWithGoogleFit, isConnectWithGoogleFit) ||
                other.isConnectWithGoogleFit == isConnectWithGoogleFit) &&
            (identical(other.defaultReps, defaultReps) ||
                other.defaultReps == defaultReps) &&
            (identical(other.defaultSets, defaultSets) ||
                other.defaultSets == defaultSets) &&
            (identical(other.unitSystem, unitSystem) ||
                other.unitSystem == unitSystem) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.topGoal, topGoal) || other.topGoal == topGoal) &&
            (identical(other.currentWorkoutLevel, currentWorkoutLevel) ||
                other.currentWorkoutLevel == currentWorkoutLevel) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.bmi, bmi) || other.bmi == bmi) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.basicGymLocation, basicGymLocation) ||
                other.basicGymLocation == basicGymLocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isConnectWithGoogleFit,
      defaultReps,
      defaultSets,
      unitSystem,
      email,
      userName,
      gender,
      height,
      photoUrl,
      topGoal,
      currentWorkoutLevel,
      birthDate,
      age,
      bmi,
      weight,
      basicGymLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  factory _UserProfile(
      {required final bool isConnectWithGoogleFit,
      required final int defaultReps,
      required final int defaultSets,
      required final String unitSystem,
      required final String email,
      final String? userName,
      final String? gender,
      final String? height,
      final String? photoUrl,
      final String? topGoal,
      final String? currentWorkoutLevel,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      final DateTime? birthDate,
      final int? age,
      final int? bmi,
      final double? weight,
      @JsonKey(fromJson: _geoPointFromJson, toJson: _geoPointToJson)
      final GeoPoint? basicGymLocation}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  bool get isConnectWithGoogleFit;
  @override
  int get defaultReps;
  @override
  int get defaultSets;
  @override
  String get unitSystem;
  @override
  String get email;
  @override
  String? get userName;
  @override
  String? get gender;
  @override
  String? get height;
  @override
  String? get photoUrl;
  @override
  String? get topGoal;
  @override
  String? get currentWorkoutLevel;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  DateTime? get birthDate;
  @override
  int? get age;
  @override
  int? get bmi;
  @override
  double? get weight;
  @override
  @JsonKey(fromJson: _geoPointFromJson, toJson: _geoPointToJson)
  GeoPoint? get basicGymLocation;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
