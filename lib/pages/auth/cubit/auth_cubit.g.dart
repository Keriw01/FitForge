// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthStateCWProxy {
  AuthState authResponseMessage(AuthResponseMessage authResponseMessage);

  AuthState currentUser(CurrentUser? currentUser);

  AuthState email(EmailInput email);

  AuthState password(PasswordInput password);

  AuthState formStatus(FormzSubmissionStatus formStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthState call({
    AuthResponseMessage? authResponseMessage,
    CurrentUser? currentUser,
    EmailInput? email,
    PasswordInput? password,
    FormzSubmissionStatus? formStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthState.copyWith.fieldName(...)`
class _$AuthStateCWProxyImpl implements _$AuthStateCWProxy {
  const _$AuthStateCWProxyImpl(this._value);

  final AuthState _value;

  @override
  AuthState authResponseMessage(AuthResponseMessage authResponseMessage) =>
      this(authResponseMessage: authResponseMessage);

  @override
  AuthState currentUser(CurrentUser? currentUser) =>
      this(currentUser: currentUser);

  @override
  AuthState email(EmailInput email) => this(email: email);

  @override
  AuthState password(PasswordInput password) => this(password: password);

  @override
  AuthState formStatus(FormzSubmissionStatus formStatus) =>
      this(formStatus: formStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthState call({
    Object? authResponseMessage = const $CopyWithPlaceholder(),
    Object? currentUser = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? formStatus = const $CopyWithPlaceholder(),
  }) {
    return AuthState(
      authResponseMessage:
          authResponseMessage == const $CopyWithPlaceholder() ||
                  authResponseMessage == null
              ? _value.authResponseMessage
              // ignore: cast_nullable_to_non_nullable
              : authResponseMessage as AuthResponseMessage,
      currentUser: currentUser == const $CopyWithPlaceholder()
          ? _value.currentUser
          // ignore: cast_nullable_to_non_nullable
          : currentUser as CurrentUser?,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as EmailInput,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as PasswordInput,
      formStatus:
          formStatus == const $CopyWithPlaceholder() || formStatus == null
              ? _value.formStatus
              // ignore: cast_nullable_to_non_nullable
              : formStatus as FormzSubmissionStatus,
    );
  }
}

extension $AuthStateCopyWith on AuthState {
  /// Returns a callable class that can be used as follows: `instanceOfAuthState.copyWith(...)` or like so:`instanceOfAuthState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthStateCWProxy get copyWith => _$AuthStateCWProxyImpl(this);
}
