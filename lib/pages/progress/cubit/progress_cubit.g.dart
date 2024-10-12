// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProgressStateCWProxy {
  ProgressState firestoreResponseMessage(
      FirestoreResponseMessage firestoreResponseMessage);

  ProgressState isLoading(bool isLoading);

  ProgressState sessions(List<Session>? sessions);

  ProgressState userBodyStats(UserBodyStats? userBodyStats);

  ProgressState inputWeight(double? inputWeight);

  ProgressState inputHeight(String? inputHeight);

  ProgressState inputAge(int? inputAge);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProgressState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProgressState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProgressState call({
    FirestoreResponseMessage? firestoreResponseMessage,
    bool? isLoading,
    List<Session>? sessions,
    UserBodyStats? userBodyStats,
    double? inputWeight,
    String? inputHeight,
    int? inputAge,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProgressState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProgressState.copyWith.fieldName(...)`
class _$ProgressStateCWProxyImpl implements _$ProgressStateCWProxy {
  const _$ProgressStateCWProxyImpl(this._value);

  final ProgressState _value;

  @override
  ProgressState firestoreResponseMessage(
          FirestoreResponseMessage firestoreResponseMessage) =>
      this(firestoreResponseMessage: firestoreResponseMessage);

  @override
  ProgressState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ProgressState sessions(List<Session>? sessions) => this(sessions: sessions);

  @override
  ProgressState userBodyStats(UserBodyStats? userBodyStats) =>
      this(userBodyStats: userBodyStats);

  @override
  ProgressState inputWeight(double? inputWeight) =>
      this(inputWeight: inputWeight);

  @override
  ProgressState inputHeight(String? inputHeight) =>
      this(inputHeight: inputHeight);

  @override
  ProgressState inputAge(int? inputAge) => this(inputAge: inputAge);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProgressState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProgressState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProgressState call({
    Object? firestoreResponseMessage = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? sessions = const $CopyWithPlaceholder(),
    Object? userBodyStats = const $CopyWithPlaceholder(),
    Object? inputWeight = const $CopyWithPlaceholder(),
    Object? inputHeight = const $CopyWithPlaceholder(),
    Object? inputAge = const $CopyWithPlaceholder(),
  }) {
    return ProgressState(
      firestoreResponseMessage:
          firestoreResponseMessage == const $CopyWithPlaceholder() ||
                  firestoreResponseMessage == null
              ? _value.firestoreResponseMessage
              // ignore: cast_nullable_to_non_nullable
              : firestoreResponseMessage as FirestoreResponseMessage,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      sessions: sessions == const $CopyWithPlaceholder()
          ? _value.sessions
          // ignore: cast_nullable_to_non_nullable
          : sessions as List<Session>?,
      userBodyStats: userBodyStats == const $CopyWithPlaceholder()
          ? _value.userBodyStats
          // ignore: cast_nullable_to_non_nullable
          : userBodyStats as UserBodyStats?,
      inputWeight: inputWeight == const $CopyWithPlaceholder()
          ? _value.inputWeight
          // ignore: cast_nullable_to_non_nullable
          : inputWeight as double?,
      inputHeight: inputHeight == const $CopyWithPlaceholder()
          ? _value.inputHeight
          // ignore: cast_nullable_to_non_nullable
          : inputHeight as String?,
      inputAge: inputAge == const $CopyWithPlaceholder()
          ? _value.inputAge
          // ignore: cast_nullable_to_non_nullable
          : inputAge as int?,
    );
  }
}

extension $ProgressStateCopyWith on ProgressState {
  /// Returns a callable class that can be used as follows: `instanceOfProgressState.copyWith(...)` or like so:`instanceOfProgressState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProgressStateCWProxy get copyWith => _$ProgressStateCWProxyImpl(this);
}
