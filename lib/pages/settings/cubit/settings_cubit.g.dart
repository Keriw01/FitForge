// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingsStateCWProxy {
  SettingsState profileResponseMessage(
      ProfileResponseMessage profileResponseMessage);

  SettingsState isLoading(bool isLoading);

  SettingsState profileCurrenRow(ProfileCurrenRow profileCurrenRow);

  SettingsState userProfile(UserProfile? userProfile);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsState call({
    ProfileResponseMessage? profileResponseMessage,
    bool? isLoading,
    ProfileCurrenRow? profileCurrenRow,
    UserProfile? userProfile,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSettingsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSettingsState.copyWith.fieldName(...)`
class _$SettingsStateCWProxyImpl implements _$SettingsStateCWProxy {
  const _$SettingsStateCWProxyImpl(this._value);

  final SettingsState _value;

  @override
  SettingsState profileResponseMessage(
          ProfileResponseMessage profileResponseMessage) =>
      this(profileResponseMessage: profileResponseMessage);

  @override
  SettingsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  SettingsState profileCurrenRow(ProfileCurrenRow profileCurrenRow) =>
      this(profileCurrenRow: profileCurrenRow);

  @override
  SettingsState userProfile(UserProfile? userProfile) =>
      this(userProfile: userProfile);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsState call({
    Object? profileResponseMessage = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? profileCurrenRow = const $CopyWithPlaceholder(),
    Object? userProfile = const $CopyWithPlaceholder(),
  }) {
    return SettingsState(
      profileResponseMessage:
          profileResponseMessage == const $CopyWithPlaceholder() ||
                  profileResponseMessage == null
              ? _value.profileResponseMessage
              // ignore: cast_nullable_to_non_nullable
              : profileResponseMessage as ProfileResponseMessage,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      profileCurrenRow: profileCurrenRow == const $CopyWithPlaceholder() ||
              profileCurrenRow == null
          ? _value.profileCurrenRow
          // ignore: cast_nullable_to_non_nullable
          : profileCurrenRow as ProfileCurrenRow,
      userProfile: userProfile == const $CopyWithPlaceholder()
          ? _value.userProfile
          // ignore: cast_nullable_to_non_nullable
          : userProfile as UserProfile?,
    );
  }
}

extension $SettingsStateCopyWith on SettingsState {
  /// Returns a callable class that can be used as follows: `instanceOfSettingsState.copyWith(...)` or like so:`instanceOfSettingsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SettingsStateCWProxy get copyWith => _$SettingsStateCWProxyImpl(this);
}
