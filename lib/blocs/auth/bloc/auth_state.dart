part of 'auth_bloc.dart';

enum AuthResponseMessage {
  none,
  userAlreadyExist,
  badAuthorization,
  defaultError,
  userAlreadyLogIn,
  invalidEmailFormat,
  googleLoginCanceled,
  gitHubLoginCanceled,
  // emailAlreadyExist,
  // facebookLoginCanceled,
  // facebookLoginFailed,
}

@CopyWith()
class AuthState with EquatableMixin {
  final AuthResponseMessage authResponseMessage;

  final CurrentUser? currentUser;

  final EmailInput email;
  final PasswordInput password;
  final FormzSubmissionStatus formStatus;

  AuthState({
    this.authResponseMessage = AuthResponseMessage.none,
    this.currentUser,
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.formStatus = FormzSubmissionStatus.initial,
  });

  @override
  List<Object?> get props => [
        authResponseMessage,
        currentUser,
        email,
        password,
        formStatus,
      ];
}