// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return _Plan.fromJson(json);
}

/// @nodoc
mixin _$Plan {
  String get difficultyLevel => throw _privateConstructorUsedError;
  int get numberOfDays => throw _privateConstructorUsedError;
  String get planDescription => throw _privateConstructorUsedError;
  String? get planId => throw _privateConstructorUsedError;
  String get planName => throw _privateConstructorUsedError;
  String get planType => throw _privateConstructorUsedError;
  List<PlanDay>? get days => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanCopyWith<Plan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanCopyWith<$Res> {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) then) =
      _$PlanCopyWithImpl<$Res, Plan>;
  @useResult
  $Res call(
      {String difficultyLevel,
      int numberOfDays,
      String planDescription,
      String? planId,
      String planName,
      String planType,
      List<PlanDay>? days});
}

/// @nodoc
class _$PlanCopyWithImpl<$Res, $Val extends Plan>
    implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? difficultyLevel = null,
    Object? numberOfDays = null,
    Object? planDescription = null,
    Object? planId = freezed,
    Object? planName = null,
    Object? planType = null,
    Object? days = freezed,
  }) {
    return _then(_value.copyWith(
      difficultyLevel: null == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfDays: null == numberOfDays
          ? _value.numberOfDays
          : numberOfDays // ignore: cast_nullable_to_non_nullable
              as int,
      planDescription: null == planDescription
          ? _value.planDescription
          : planDescription // ignore: cast_nullable_to_non_nullable
              as String,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String?,
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      planType: null == planType
          ? _value.planType
          : planType // ignore: cast_nullable_to_non_nullable
              as String,
      days: freezed == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<PlanDay>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanImplCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$$PlanImplCopyWith(
          _$PlanImpl value, $Res Function(_$PlanImpl) then) =
      __$$PlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String difficultyLevel,
      int numberOfDays,
      String planDescription,
      String? planId,
      String planName,
      String planType,
      List<PlanDay>? days});
}

/// @nodoc
class __$$PlanImplCopyWithImpl<$Res>
    extends _$PlanCopyWithImpl<$Res, _$PlanImpl>
    implements _$$PlanImplCopyWith<$Res> {
  __$$PlanImplCopyWithImpl(_$PlanImpl _value, $Res Function(_$PlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? difficultyLevel = null,
    Object? numberOfDays = null,
    Object? planDescription = null,
    Object? planId = freezed,
    Object? planName = null,
    Object? planType = null,
    Object? days = freezed,
  }) {
    return _then(_$PlanImpl(
      difficultyLevel: null == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfDays: null == numberOfDays
          ? _value.numberOfDays
          : numberOfDays // ignore: cast_nullable_to_non_nullable
              as int,
      planDescription: null == planDescription
          ? _value.planDescription
          : planDescription // ignore: cast_nullable_to_non_nullable
              as String,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String?,
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      planType: null == planType
          ? _value.planType
          : planType // ignore: cast_nullable_to_non_nullable
              as String,
      days: freezed == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<PlanDay>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanImpl implements _Plan {
  _$PlanImpl(
      {required this.difficultyLevel,
      required this.numberOfDays,
      required this.planDescription,
      this.planId,
      required this.planName,
      required this.planType,
      final List<PlanDay>? days})
      : _days = days;

  factory _$PlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanImplFromJson(json);

  @override
  final String difficultyLevel;
  @override
  final int numberOfDays;
  @override
  final String planDescription;
  @override
  final String? planId;
  @override
  final String planName;
  @override
  final String planType;
  final List<PlanDay>? _days;
  @override
  List<PlanDay>? get days {
    final value = _days;
    if (value == null) return null;
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Plan(difficultyLevel: $difficultyLevel, numberOfDays: $numberOfDays, planDescription: $planDescription, planId: $planId, planName: $planName, planType: $planType, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanImpl &&
            (identical(other.difficultyLevel, difficultyLevel) ||
                other.difficultyLevel == difficultyLevel) &&
            (identical(other.numberOfDays, numberOfDays) ||
                other.numberOfDays == numberOfDays) &&
            (identical(other.planDescription, planDescription) ||
                other.planDescription == planDescription) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.planType, planType) ||
                other.planType == planType) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      difficultyLevel,
      numberOfDays,
      planDescription,
      planId,
      planName,
      planType,
      const DeepCollectionEquality().hash(_days));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanImplCopyWith<_$PlanImpl> get copyWith =>
      __$$PlanImplCopyWithImpl<_$PlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanImplToJson(
      this,
    );
  }
}

abstract class _Plan implements Plan {
  factory _Plan(
      {required final String difficultyLevel,
      required final int numberOfDays,
      required final String planDescription,
      final String? planId,
      required final String planName,
      required final String planType,
      final List<PlanDay>? days}) = _$PlanImpl;

  factory _Plan.fromJson(Map<String, dynamic> json) = _$PlanImpl.fromJson;

  @override
  String get difficultyLevel;
  @override
  int get numberOfDays;
  @override
  String get planDescription;
  @override
  String? get planId;
  @override
  String get planName;
  @override
  String get planType;
  @override
  List<PlanDay>? get days;
  @override
  @JsonKey(ignore: true)
  _$$PlanImplCopyWith<_$PlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
