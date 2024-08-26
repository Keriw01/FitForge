part of 'auth_cubit.dart';

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
