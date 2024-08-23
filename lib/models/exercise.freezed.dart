// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

/// @nodoc
mixin _$Exercise {
  String get qrCodeUrl => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  Translation get title => throw _privateConstructorUsedError;
  Translation get description => throw _privateConstructorUsedError;
  Translation get mainBodyPart => throw _privateConstructorUsedError;
  Map<String, Translation> get otherBodyParts =>
      throw _privateConstructorUsedError;
  Map<String, Translation> get equipment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res, Exercise>;
  @useResult
  $Res call(
      {String qrCodeUrl,
      String videoUrl,
      Translation title,
      Translation description,
      Translation mainBodyPart,
      Map<String, Translation> otherBodyParts,
      Map<String, Translation> equipment});

  $TranslationCopyWith<$Res> get title;
  $TranslationCopyWith<$Res> get description;
  $TranslationCopyWith<$Res> get mainBodyPart;
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res, $Val extends Exercise>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCodeUrl = null,
    Object? videoUrl = null,
    Object? title = null,
    Object? description = null,
    Object? mainBodyPart = null,
    Object? otherBodyParts = null,
    Object? equipment = null,
  }) {
    return _then(_value.copyWith(
      qrCodeUrl: null == qrCodeUrl
          ? _value.qrCodeUrl
          : qrCodeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Translation,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Translation,
      mainBodyPart: null == mainBodyPart
          ? _value.mainBodyPart
          : mainBodyPart // ignore: cast_nullable_to_non_nullable
              as Translation,
      otherBodyParts: null == otherBodyParts
          ? _value.otherBodyParts
          : otherBodyParts // ignore: cast_nullable_to_non_nullable
              as Map<String, Translation>,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as Map<String, Translation>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TranslationCopyWith<$Res> get title {
    return $TranslationCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TranslationCopyWith<$Res> get description {
    return $TranslationCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TranslationCopyWith<$Res> get mainBodyPart {
    return $TranslationCopyWith<$Res>(_value.mainBodyPart, (value) {
      return _then(_value.copyWith(mainBodyPart: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExerciseImplCopyWith<$Res>
    implements $ExerciseCopyWith<$Res> {
  factory _$$ExerciseImplCopyWith(
          _$ExerciseImpl value, $Res Function(_$ExerciseImpl) then) =
      __$$ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String qrCodeUrl,
      String videoUrl,
      Translation title,
      Translation description,
      Translation mainBodyPart,
      Map<String, Translation> otherBodyParts,
      Map<String, Translation> equipment});

  @override
  $TranslationCopyWith<$Res> get title;
  @override
  $TranslationCopyWith<$Res> get description;
  @override
  $TranslationCopyWith<$Res> get mainBodyPart;
}

/// @nodoc
class __$$ExerciseImplCopyWithImpl<$Res>
    extends _$ExerciseCopyWithImpl<$Res, _$ExerciseImpl>
    implements _$$ExerciseImplCopyWith<$Res> {
  __$$ExerciseImplCopyWithImpl(
      _$ExerciseImpl _value, $Res Function(_$ExerciseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCodeUrl = null,
    Object? videoUrl = null,
    Object? title = null,
    Object? description = null,
    Object? mainBodyPart = null,
    Object? otherBodyParts = null,
    Object? equipment = null,
  }) {
    return _then(_$ExerciseImpl(
      qrCodeUrl: null == qrCodeUrl
          ? _value.qrCodeUrl
          : qrCodeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Translation,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Translation,
      mainBodyPart: null == mainBodyPart
          ? _value.mainBodyPart
          : mainBodyPart // ignore: cast_nullable_to_non_nullable
              as Translation,
      otherBodyParts: null == otherBodyParts
          ? _value._otherBodyParts
          : otherBodyParts // ignore: cast_nullable_to_non_nullable
              as Map<String, Translation>,
      equipment: null == equipment
          ? _value._equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as Map<String, Translation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseImpl implements _Exercise {
  _$ExerciseImpl(
      {required this.qrCodeUrl,
      required this.videoUrl,
      required this.title,
      required this.description,
      required this.mainBodyPart,
      required final Map<String, Translation> otherBodyParts,
      required final Map<String, Translation> equipment})
      : _otherBodyParts = otherBodyParts,
        _equipment = equipment;

  factory _$ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseImplFromJson(json);

  @override
  final String qrCodeUrl;
  @override
  final String videoUrl;
  @override
  final Translation title;
  @override
  final Translation description;
  @override
  final Translation mainBodyPart;
  final Map<String, Translation> _otherBodyParts;
  @override
  Map<String, Translation> get otherBodyParts {
    if (_otherBodyParts is EqualUnmodifiableMapView) return _otherBodyParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_otherBodyParts);
  }

  final Map<String, Translation> _equipment;
  @override
  Map<String, Translation> get equipment {
    if (_equipment is EqualUnmodifiableMapView) return _equipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_equipment);
  }

  @override
  String toString() {
    return 'Exercise(qrCodeUrl: $qrCodeUrl, videoUrl: $videoUrl, title: $title, description: $description, mainBodyPart: $mainBodyPart, otherBodyParts: $otherBodyParts, equipment: $equipment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
            (identical(other.qrCodeUrl, qrCodeUrl) ||
                other.qrCodeUrl == qrCodeUrl) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mainBodyPart, mainBodyPart) ||
                other.mainBodyPart == mainBodyPart) &&
            const DeepCollectionEquality()
                .equals(other._otherBodyParts, _otherBodyParts) &&
            const DeepCollectionEquality()
                .equals(other._equipment, _equipment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      qrCodeUrl,
      videoUrl,
      title,
      description,
      mainBodyPart,
      const DeepCollectionEquality().hash(_otherBodyParts),
      const DeepCollectionEquality().hash(_equipment));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      __$$ExerciseImplCopyWithImpl<_$ExerciseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseImplToJson(
      this,
    );
  }
}

abstract class _Exercise implements Exercise {
  factory _Exercise(
      {required final String qrCodeUrl,
      required final String videoUrl,
      required final Translation title,
      required final Translation description,
      required final Translation mainBodyPart,
      required final Map<String, Translation> otherBodyParts,
      required final Map<String, Translation> equipment}) = _$ExerciseImpl;

  factory _Exercise.fromJson(Map<String, dynamic> json) =
      _$ExerciseImpl.fromJson;

  @override
  String get qrCodeUrl;
  @override
  String get videoUrl;
  @override
  Translation get title;
  @override
  Translation get description;
  @override
  Translation get mainBodyPart;
  @override
  Map<String, Translation> get otherBodyParts;
  @override
  Map<String, Translation> get equipment;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
