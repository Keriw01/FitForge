// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingsStateCWProxy {
  SettingsState profileResponseMessage(
      ProfileResponseMessage profileResponseMessage);

  SettingsState isLoading(bool isLoading);

  SettingsState isSavingRow(bool isSavingRow);

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
    bool? isSavingRow,
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
  SettingsState isSavingRow(bool isSavingRow) => this(isSavingRow: isSavingRow);

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
    Object? isSavingRow = const $CopyWithPlaceholder(),
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
      isSavingRow:
          isSavingRow == const $CopyWithPlaceholder() || isSavingRow == null
              ? _value.isSavingRow
              // ignore: cast_nullable_to_non_nullable
              : isSavingRow as bool,
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
