// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  String? get sessionId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String get totalCaloriesBurned => throw _privateConstructorUsedError;
  String get totalDuration => throw _privateConstructorUsedError;
  int get totalExercises => throw _privateConstructorUsedError;
  String get totalWeightLifted => throw _privateConstructorUsedError;
  int get exercisesWith1RM => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  DateTime? get startTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  DateTime? get endTime => throw _privateConstructorUsedError;
  List<SessionExercise>? get sessionExercises =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {String? sessionId,
      String? userId,
      String totalCaloriesBurned,
      String totalDuration,
      int totalExercises,
      String totalWeightLifted,
      int exercisesWith1RM,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      DateTime? startTime,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      DateTime? endTime,
      List<SessionExercise>? sessionExercises});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? userId = freezed,
    Object? totalCaloriesBurned = null,
    Object? totalDuration = null,
    Object? totalExercises = null,
    Object? totalWeightLifted = null,
    Object? exercisesWith1RM = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? sessionExercises = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCaloriesBurned: null == totalCaloriesBurned
          ? _value.totalCaloriesBurned
          : totalCaloriesBurned // ignore: cast_nullable_to_non_nullable
              as String,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as String,
      totalExercises: null == totalExercises
          ? _value.totalExercises
          : totalExercises // ignore: cast_nullable_to_non_nullable
              as int,
      totalWeightLifted: null == totalWeightLifted
          ? _value.totalWeightLifted
          : totalWeightLifted // ignore: cast_nullable_to_non_nullable
              as String,
      exercisesWith1RM: null == exercisesWith1RM
          ? _value.exercisesWith1RM
          : exercisesWith1RM // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sessionExercises: freezed == sessionExercises
          ? _value.sessionExercises
          : sessionExercises // ignore: cast_nullable_to_non_nullable
              as List<SessionExercise>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
          _$SessionImpl value, $Res Function(_$SessionImpl) then) =
      __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? sessionId,
      String? userId,
      String totalCaloriesBurned,
      String totalDuration,
      int totalExercises,
      String totalWeightLifted,
      int exercisesWith1RM,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      DateTime? startTime,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      DateTime? endTime,
      List<SessionExercise>? sessionExercises});
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
      _$SessionImpl _value, $Res Function(_$SessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? userId = freezed,
    Object? totalCaloriesBurned = null,
    Object? totalDuration = null,
    Object? totalExercises = null,
    Object? totalWeightLifted = null,
    Object? exercisesWith1RM = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? sessionExercises = freezed,
  }) {
    return _then(_$SessionImpl(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCaloriesBurned: null == totalCaloriesBurned
          ? _value.totalCaloriesBurned
          : totalCaloriesBurned // ignore: cast_nullable_to_non_nullable
              as String,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as String,
      totalExercises: null == totalExercises
          ? _value.totalExercises
          : totalExercises // ignore: cast_nullable_to_non_nullable
              as int,
      totalWeightLifted: null == totalWeightLifted
          ? _value.totalWeightLifted
          : totalWeightLifted // ignore: cast_nullable_to_non_nullable
              as String,
      exercisesWith1RM: null == exercisesWith1RM
          ? _value.exercisesWith1RM
          : exercisesWith1RM // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sessionExercises: freezed == sessionExercises
          ? _value._sessionExercises
          : sessionExercises // ignore: cast_nullable_to_non_nullable
              as List<SessionExercise>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionImpl implements _Session {
  _$SessionImpl(
      {this.sessionId,
      this.userId,
      required this.totalCaloriesBurned,
      required this.totalDuration,
      required this.totalExercises,
      required this.totalWeightLifted,
      required this.exercisesWith1RM,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required this.startTime,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      this.endTime,
      final List<SessionExercise>? sessionExercises})
      : _sessionExercises = sessionExercises;

  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);

  @override
  final String? sessionId;
  @override
  final String? userId;
  @override
  final String totalCaloriesBurned;
  @override
  final String totalDuration;
  @override
  final int totalExercises;
  @override
  final String totalWeightLifted;
  @override
  final int exercisesWith1RM;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final DateTime? startTime;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final DateTime? endTime;
  final List<SessionExercise>? _sessionExercises;
  @override
  List<SessionExercise>? get sessionExercises {
    final value = _sessionExercises;
    if (value == null) return null;
    if (_sessionExercises is EqualUnmodifiableListView)
      return _sessionExercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Session(sessionId: $sessionId, userId: $userId, totalCaloriesBurned: $totalCaloriesBurned, totalDuration: $totalDuration, totalExercises: $totalExercises, totalWeightLifted: $totalWeightLifted, exercisesWith1RM: $exercisesWith1RM, startTime: $startTime, endTime: $endTime, sessionExercises: $sessionExercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalCaloriesBurned, totalCaloriesBurned) ||
                other.totalCaloriesBurned == totalCaloriesBurned) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises) &&
            (identical(other.totalWeightLifted, totalWeightLifted) ||
                other.totalWeightLifted == totalWeightLifted) &&
            (identical(other.exercisesWith1RM, exercisesWith1RM) ||
                other.exercisesWith1RM == exercisesWith1RM) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality()
                .equals(other._sessionExercises, _sessionExercises));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      userId,
      totalCaloriesBurned,
      totalDuration,
      totalExercises,
      totalWeightLifted,
      exercisesWith1RM,
      startTime,
      endTime,
      const DeepCollectionEquality().hash(_sessionExercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionImplToJson(
      this,
    );
  }
}

abstract class _Session implements Session {
  factory _Session(
      {final String? sessionId,
      final String? userId,
      required final String totalCaloriesBurned,
      required final String totalDuration,
      required final int totalExercises,
      required final String totalWeightLifted,
      required final int exercisesWith1RM,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required final DateTime? startTime,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      final DateTime? endTime,
      final List<SessionExercise>? sessionExercises}) = _$SessionImpl;

  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;

  @override
  String? get sessionId;
  @override
  String? get userId;
  @override
  String get totalCaloriesBurned;
  @override
  String get totalDuration;
  @override
  int get totalExercises;
  @override
  String get totalWeightLifted;
  @override
  int get exercisesWith1RM;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  DateTime? get startTime;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  DateTime? get endTime;
  @override
  List<SessionExercise>? get sessionExercises;
  @override
  @JsonKey(ignore: true)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
