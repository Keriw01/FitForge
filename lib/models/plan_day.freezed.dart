// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlanDay _$PlanDayFromJson(Map<String, dynamic> json) {
  return _PlanDay.fromJson(json);
}

/// @nodoc
mixin _$PlanDay {
  String get dayId => throw _privateConstructorUsedError;
  String get dayTitle => throw _privateConstructorUsedError;
  List<DayExercise>? get dayExercises => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanDayCopyWith<PlanDay> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanDayCopyWith<$Res> {
  factory $PlanDayCopyWith(PlanDay value, $Res Function(PlanDay) then) =
      _$PlanDayCopyWithImpl<$Res, PlanDay>;
  @useResult
  $Res call({String dayId, String dayTitle, List<DayExercise>? dayExercises});
}

/// @nodoc
class _$PlanDayCopyWithImpl<$Res, $Val extends PlanDay>
    implements $PlanDayCopyWith<$Res> {
  _$PlanDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayId = null,
    Object? dayTitle = null,
    Object? dayExercises = freezed,
  }) {
    return _then(_value.copyWith(
      dayId: null == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as String,
      dayTitle: null == dayTitle
          ? _value.dayTitle
          : dayTitle // ignore: cast_nullable_to_non_nullable
              as String,
      dayExercises: freezed == dayExercises
          ? _value.dayExercises
          : dayExercises // ignore: cast_nullable_to_non_nullable
              as List<DayExercise>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanDayImplCopyWith<$Res> implements $PlanDayCopyWith<$Res> {
  factory _$$PlanDayImplCopyWith(
          _$PlanDayImpl value, $Res Function(_$PlanDayImpl) then) =
      __$$PlanDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dayId, String dayTitle, List<DayExercise>? dayExercises});
}

/// @nodoc
class __$$PlanDayImplCopyWithImpl<$Res>
    extends _$PlanDayCopyWithImpl<$Res, _$PlanDayImpl>
    implements _$$PlanDayImplCopyWith<$Res> {
  __$$PlanDayImplCopyWithImpl(
      _$PlanDayImpl _value, $Res Function(_$PlanDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayId = null,
    Object? dayTitle = null,
    Object? dayExercises = freezed,
  }) {
    return _then(_$PlanDayImpl(
      dayId: null == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as String,
      dayTitle: null == dayTitle
          ? _value.dayTitle
          : dayTitle // ignore: cast_nullable_to_non_nullable
              as String,
      dayExercises: freezed == dayExercises
          ? _value._dayExercises
          : dayExercises // ignore: cast_nullable_to_non_nullable
              as List<DayExercise>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanDayImpl implements _PlanDay {
  _$PlanDayImpl(
      {required this.dayId,
      required this.dayTitle,
      final List<DayExercise>? dayExercises})
      : _dayExercises = dayExercises;

  factory _$PlanDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanDayImplFromJson(json);

  @override
  final String dayId;
  @override
  final String dayTitle;
  final List<DayExercise>? _dayExercises;
  @override
  List<DayExercise>? get dayExercises {
    final value = _dayExercises;
    if (value == null) return null;
    if (_dayExercises is EqualUnmodifiableListView) return _dayExercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PlanDay(dayId: $dayId, dayTitle: $dayTitle, dayExercises: $dayExercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanDayImpl &&
            (identical(other.dayId, dayId) || other.dayId == dayId) &&
            (identical(other.dayTitle, dayTitle) ||
                other.dayTitle == dayTitle) &&
            const DeepCollectionEquality()
                .equals(other._dayExercises, _dayExercises));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dayId, dayTitle,
      const DeepCollectionEquality().hash(_dayExercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanDayImplCopyWith<_$PlanDayImpl> get copyWith =>
      __$$PlanDayImplCopyWithImpl<_$PlanDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanDayImplToJson(
      this,
    );
  }
}

abstract class _PlanDay implements PlanDay {
  factory _PlanDay(
      {required final String dayId,
      required final String dayTitle,
      final List<DayExercise>? dayExercises}) = _$PlanDayImpl;

  factory _PlanDay.fromJson(Map<String, dynamic> json) = _$PlanDayImpl.fromJson;

  @override
  String get dayId;
  @override
  String get dayTitle;
  @override
  List<DayExercise>? get dayExercises;
  @override
  @JsonKey(ignore: true)
  _$$PlanDayImplCopyWith<_$PlanDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
