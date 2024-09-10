// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DayExercise _$DayExerciseFromJson(Map<String, dynamic> json) {
  return _DayExercise.fromJson(json);
}

/// @nodoc
mixin _$DayExercise {
  String get exerciseRefId => throw _privateConstructorUsedError;
  int get numberOfSets => throw _privateConstructorUsedError;
  int get numberOfReps => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int? get restTime => throw _privateConstructorUsedError;
  int? get best1RM => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayExerciseCopyWith<DayExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayExerciseCopyWith<$Res> {
  factory $DayExerciseCopyWith(
          DayExercise value, $Res Function(DayExercise) then) =
      _$DayExerciseCopyWithImpl<$Res, DayExercise>;
  @useResult
  $Res call(
      {String exerciseRefId,
      int numberOfSets,
      int numberOfReps,
      int? duration,
      int? restTime,
      int? best1RM});
}

/// @nodoc
class _$DayExerciseCopyWithImpl<$Res, $Val extends DayExercise>
    implements $DayExerciseCopyWith<$Res> {
  _$DayExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseRefId = null,
    Object? numberOfSets = null,
    Object? numberOfReps = null,
    Object? duration = freezed,
    Object? restTime = freezed,
    Object? best1RM = freezed,
  }) {
    return _then(_value.copyWith(
      exerciseRefId: null == exerciseRefId
          ? _value.exerciseRefId
          : exerciseRefId // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfSets: null == numberOfSets
          ? _value.numberOfSets
          : numberOfSets // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfReps: null == numberOfReps
          ? _value.numberOfReps
          : numberOfReps // ignore: cast_nullable_to_non_nullable
              as int,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      restTime: freezed == restTime
          ? _value.restTime
          : restTime // ignore: cast_nullable_to_non_nullable
              as int?,
      best1RM: freezed == best1RM
          ? _value.best1RM
          : best1RM // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayExerciseImplCopyWith<$Res>
    implements $DayExerciseCopyWith<$Res> {
  factory _$$DayExerciseImplCopyWith(
          _$DayExerciseImpl value, $Res Function(_$DayExerciseImpl) then) =
      __$$DayExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String exerciseRefId,
      int numberOfSets,
      int numberOfReps,
      int? duration,
      int? restTime,
      int? best1RM});
}

/// @nodoc
class __$$DayExerciseImplCopyWithImpl<$Res>
    extends _$DayExerciseCopyWithImpl<$Res, _$DayExerciseImpl>
    implements _$$DayExerciseImplCopyWith<$Res> {
  __$$DayExerciseImplCopyWithImpl(
      _$DayExerciseImpl _value, $Res Function(_$DayExerciseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseRefId = null,
    Object? numberOfSets = null,
    Object? numberOfReps = null,
    Object? duration = freezed,
    Object? restTime = freezed,
    Object? best1RM = freezed,
  }) {
    return _then(_$DayExerciseImpl(
      exerciseRefId: null == exerciseRefId
          ? _value.exerciseRefId
          : exerciseRefId // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfSets: null == numberOfSets
          ? _value.numberOfSets
          : numberOfSets // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfReps: null == numberOfReps
          ? _value.numberOfReps
          : numberOfReps // ignore: cast_nullable_to_non_nullable
              as int,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      restTime: freezed == restTime
          ? _value.restTime
          : restTime // ignore: cast_nullable_to_non_nullable
              as int?,
      best1RM: freezed == best1RM
          ? _value.best1RM
          : best1RM // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayExerciseImpl implements _DayExercise {
  _$DayExerciseImpl(
      {required this.exerciseRefId,
      required this.numberOfSets,
      required this.numberOfReps,
      this.duration,
      this.restTime,
      this.best1RM});

  factory _$DayExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayExerciseImplFromJson(json);

  @override
  final String exerciseRefId;
  @override
  final int numberOfSets;
  @override
  final int numberOfReps;
  @override
  final int? duration;
  @override
  final int? restTime;
  @override
  final int? best1RM;

  @override
  String toString() {
    return 'DayExercise(exerciseRefId: $exerciseRefId, numberOfSets: $numberOfSets, numberOfReps: $numberOfReps, duration: $duration, restTime: $restTime, best1RM: $best1RM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayExerciseImpl &&
            (identical(other.exerciseRefId, exerciseRefId) ||
                other.exerciseRefId == exerciseRefId) &&
            (identical(other.numberOfSets, numberOfSets) ||
                other.numberOfSets == numberOfSets) &&
            (identical(other.numberOfReps, numberOfReps) ||
                other.numberOfReps == numberOfReps) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.restTime, restTime) ||
                other.restTime == restTime) &&
            (identical(other.best1RM, best1RM) || other.best1RM == best1RM));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, exerciseRefId, numberOfSets,
      numberOfReps, duration, restTime, best1RM);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayExerciseImplCopyWith<_$DayExerciseImpl> get copyWith =>
      __$$DayExerciseImplCopyWithImpl<_$DayExerciseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayExerciseImplToJson(
      this,
    );
  }
}

abstract class _DayExercise implements DayExercise {
  factory _DayExercise(
      {required final String exerciseRefId,
      required final int numberOfSets,
      required final int numberOfReps,
      final int? duration,
      final int? restTime,
      final int? best1RM}) = _$DayExerciseImpl;

  factory _DayExercise.fromJson(Map<String, dynamic> json) =
      _$DayExerciseImpl.fromJson;

  @override
  String get exerciseRefId;
  @override
  int get numberOfSets;
  @override
  int get numberOfReps;
  @override
  int? get duration;
  @override
  int? get restTime;
  @override
  int? get best1RM;
  @override
  @JsonKey(ignore: true)
  _$$DayExerciseImplCopyWith<_$DayExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
