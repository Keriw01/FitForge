// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionExercise _$SessionExerciseFromJson(Map<String, dynamic> json) {
  return _SessionExercise.fromJson(json);
}

/// @nodoc
mixin _$SessionExercise {
  String get exerciseRefId => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int? get restTime => throw _privateConstructorUsedError;
  int? get best1RM => throw _privateConstructorUsedError;
  List<ExerciseSet>? get exercisesSets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionExerciseCopyWith<SessionExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionExerciseCopyWith<$Res> {
  factory $SessionExerciseCopyWith(
          SessionExercise value, $Res Function(SessionExercise) then) =
      _$SessionExerciseCopyWithImpl<$Res, SessionExercise>;
  @useResult
  $Res call(
      {String exerciseRefId,
      int? duration,
      int? restTime,
      int? best1RM,
      List<ExerciseSet>? exercisesSets});
}

/// @nodoc
class _$SessionExerciseCopyWithImpl<$Res, $Val extends SessionExercise>
    implements $SessionExerciseCopyWith<$Res> {
  _$SessionExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseRefId = null,
    Object? duration = freezed,
    Object? restTime = freezed,
    Object? best1RM = freezed,
    Object? exercisesSets = freezed,
  }) {
    return _then(_value.copyWith(
      exerciseRefId: null == exerciseRefId
          ? _value.exerciseRefId
          : exerciseRefId // ignore: cast_nullable_to_non_nullable
              as String,
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
      exercisesSets: freezed == exercisesSets
          ? _value.exercisesSets
          : exercisesSets // ignore: cast_nullable_to_non_nullable
              as List<ExerciseSet>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionExerciseImplCopyWith<$Res>
    implements $SessionExerciseCopyWith<$Res> {
  factory _$$SessionExerciseImplCopyWith(_$SessionExerciseImpl value,
          $Res Function(_$SessionExerciseImpl) then) =
      __$$SessionExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String exerciseRefId,
      int? duration,
      int? restTime,
      int? best1RM,
      List<ExerciseSet>? exercisesSets});
}

/// @nodoc
class __$$SessionExerciseImplCopyWithImpl<$Res>
    extends _$SessionExerciseCopyWithImpl<$Res, _$SessionExerciseImpl>
    implements _$$SessionExerciseImplCopyWith<$Res> {
  __$$SessionExerciseImplCopyWithImpl(
      _$SessionExerciseImpl _value, $Res Function(_$SessionExerciseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseRefId = null,
    Object? duration = freezed,
    Object? restTime = freezed,
    Object? best1RM = freezed,
    Object? exercisesSets = freezed,
  }) {
    return _then(_$SessionExerciseImpl(
      exerciseRefId: null == exerciseRefId
          ? _value.exerciseRefId
          : exerciseRefId // ignore: cast_nullable_to_non_nullable
              as String,
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
      exercisesSets: freezed == exercisesSets
          ? _value._exercisesSets
          : exercisesSets // ignore: cast_nullable_to_non_nullable
              as List<ExerciseSet>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionExerciseImpl implements _SessionExercise {
  _$SessionExerciseImpl(
      {required this.exerciseRefId,
      this.duration,
      this.restTime,
      this.best1RM,
      final List<ExerciseSet>? exercisesSets})
      : _exercisesSets = exercisesSets;

  factory _$SessionExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionExerciseImplFromJson(json);

  @override
  final String exerciseRefId;
  @override
  final int? duration;
  @override
  final int? restTime;
  @override
  final int? best1RM;
  final List<ExerciseSet>? _exercisesSets;
  @override
  List<ExerciseSet>? get exercisesSets {
    final value = _exercisesSets;
    if (value == null) return null;
    if (_exercisesSets is EqualUnmodifiableListView) return _exercisesSets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SessionExercise(exerciseRefId: $exerciseRefId, duration: $duration, restTime: $restTime, best1RM: $best1RM, exercisesSets: $exercisesSets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionExerciseImpl &&
            (identical(other.exerciseRefId, exerciseRefId) ||
                other.exerciseRefId == exerciseRefId) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.restTime, restTime) ||
                other.restTime == restTime) &&
            (identical(other.best1RM, best1RM) || other.best1RM == best1RM) &&
            const DeepCollectionEquality()
                .equals(other._exercisesSets, _exercisesSets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, exerciseRefId, duration,
      restTime, best1RM, const DeepCollectionEquality().hash(_exercisesSets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionExerciseImplCopyWith<_$SessionExerciseImpl> get copyWith =>
      __$$SessionExerciseImplCopyWithImpl<_$SessionExerciseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionExerciseImplToJson(
      this,
    );
  }
}

abstract class _SessionExercise implements SessionExercise {
  factory _SessionExercise(
      {required final String exerciseRefId,
      final int? duration,
      final int? restTime,
      final int? best1RM,
      final List<ExerciseSet>? exercisesSets}) = _$SessionExerciseImpl;

  factory _SessionExercise.fromJson(Map<String, dynamic> json) =
      _$SessionExerciseImpl.fromJson;

  @override
  String get exerciseRefId;
  @override
  int? get duration;
  @override
  int? get restTime;
  @override
  int? get best1RM;
  @override
  List<ExerciseSet>? get exercisesSets;
  @override
  @JsonKey(ignore: true)
  _$$SessionExerciseImplCopyWith<_$SessionExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
