// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercises.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Exercises _$ExercisesFromJson(Map<String, dynamic> json) {
  return _Exercises.fromJson(json);
}

/// @nodoc
mixin _$Exercises {
  String get exerciseId => throw _privateConstructorUsedError;
  Exercise get exercise => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExercisesCopyWith<Exercises> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExercisesCopyWith<$Res> {
  factory $ExercisesCopyWith(Exercises value, $Res Function(Exercises) then) =
      _$ExercisesCopyWithImpl<$Res, Exercises>;
  @useResult
  $Res call({String exerciseId, Exercise exercise});

  $ExerciseCopyWith<$Res> get exercise;
}

/// @nodoc
class _$ExercisesCopyWithImpl<$Res, $Val extends Exercises>
    implements $ExercisesCopyWith<$Res> {
  _$ExercisesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exercise = null,
  }) {
    return _then(_value.copyWith(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Exercise,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseCopyWith<$Res> get exercise {
    return $ExerciseCopyWith<$Res>(_value.exercise, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExercisesImplCopyWith<$Res>
    implements $ExercisesCopyWith<$Res> {
  factory _$$ExercisesImplCopyWith(
          _$ExercisesImpl value, $Res Function(_$ExercisesImpl) then) =
      __$$ExercisesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String exerciseId, Exercise exercise});

  @override
  $ExerciseCopyWith<$Res> get exercise;
}

/// @nodoc
class __$$ExercisesImplCopyWithImpl<$Res>
    extends _$ExercisesCopyWithImpl<$Res, _$ExercisesImpl>
    implements _$$ExercisesImplCopyWith<$Res> {
  __$$ExercisesImplCopyWithImpl(
      _$ExercisesImpl _value, $Res Function(_$ExercisesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exercise = null,
  }) {
    return _then(_$ExercisesImpl(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Exercise,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExercisesImpl implements _Exercises {
  _$ExercisesImpl({required this.exerciseId, required this.exercise});

  factory _$ExercisesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExercisesImplFromJson(json);

  @override
  final String exerciseId;
  @override
  final Exercise exercise;

  @override
  String toString() {
    return 'Exercises(exerciseId: $exerciseId, exercise: $exercise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExercisesImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, exerciseId, exercise);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExercisesImplCopyWith<_$ExercisesImpl> get copyWith =>
      __$$ExercisesImplCopyWithImpl<_$ExercisesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExercisesImplToJson(
      this,
    );
  }
}

abstract class _Exercises implements Exercises {
  factory _Exercises(
      {required final String exerciseId,
      required final Exercise exercise}) = _$ExercisesImpl;

  factory _Exercises.fromJson(Map<String, dynamic> json) =
      _$ExercisesImpl.fromJson;

  @override
  String get exerciseId;
  @override
  Exercise get exercise;
  @override
  @JsonKey(ignore: true)
  _$$ExercisesImplCopyWith<_$ExercisesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
