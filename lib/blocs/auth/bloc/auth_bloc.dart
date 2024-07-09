import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fit_forge/blocs/base_cubit.dart';
import 'package:fit_forge/exceptions/auth_exceptions.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/repositories/firebase_auth_service.dart';
import 'package:fit_forge/models/current_user.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/utils/forms/inputs.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

part 'auth_state.dart';
part 'auth_bloc.g.dart';

/// AuthBloc is responsible for managing authorization in the application
class AuthBloc extends BaseCubit<AuthState> {
  late final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  AuthBloc(AppRouter appRouter, BuildContext context)
      : super(
          appRouter,
          AuthState(),
        );

  Future<void> login() async {
    final email = state.email.dirty();
    final password = state.password.dirty();

    emit(
      state.copyWith(
        authResponseMessage: AuthResponseMessage.none,
        email: email,
        password: password,
        formStatus: FormzSubmissionStatus.inProgress,
      ),
    );
    print(password);
    if (password.isNotValid || email.isNotValid) {
      emit(
        state.copyWith(formStatus: FormzSubmissionStatus.failure),
      );
      return;
    }

    emit(
      state.copyWith(
        authResponseMessage: AuthResponseMessage.none,
        formStatus: FormzSubmissionStatus.inProgress,
      ),
    );
    try {
      final CurrentUser? user = await _firebaseAuthService
          .signInWithEmailAndPassword(email.value, password.value);
      if (user != null) {
        emit(state.copyWith(
          formStatus: FormzSubmissionStatus.success,
          currentUser: user,
        ));
      } else {
        emit(state.copyWith(
          authResponseMessage: AuthResponseMessage.badAuthorization,
          formStatus: FormzSubmissionStatus.failure,
        ));
      }
    } on InternalCredentialsError {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.badAuthorization,
        formStatus: FormzSubmissionStatus.failure,
      ));
    } catch (e) {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.defaultError,
        formStatus: FormzSubmissionStatus.failure,
      ));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(
      state.copyWith(authResponseMessage: AuthResponseMessage.none),
    );
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        emit(state.copyWith(
          authResponseMessage: AuthResponseMessage.googleLoginCanceled,
        ));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(state.copyWith(
        formStatus: FormzSubmissionStatus.success,
        currentUser: CurrentUser(
          userId: googleUser.id,
          email: googleUser.email,
          name: googleUser.displayName ?? '',
        ),
      ));
      _navigateToAuthFlowScreen();
    } catch (e) {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.googleLoginCanceled,
      ));
    }
  }

  Future<void> signInWithGitHub() async {
    emit(
      state.copyWith(authResponseMessage: AuthResponseMessage.none),
    );
    try {
      GithubAuthProvider githubProvider = GithubAuthProvider();
      await FirebaseAuth.instance.signInWithProvider(githubProvider);
    } catch (e) {
      emit(state.copyWith(
          authResponseMessage: AuthResponseMessage.gitHubLoginCanceled));
    }
  }

  Future<void> register() async {
    final email = state.email.dirty();
    final password = state.password.dirty();

    emit(
      state.copyWith(
          authResponseMessage: AuthResponseMessage.none,
          email: email,
          password: password,
          formStatus: FormzSubmissionStatus.inProgress),
    );

    if (password.isNotValid || email.isNotValid) {
      emit(
        state.copyWith(formStatus: FormzSubmissionStatus.failure),
      );
      return;
    }

    emit(
      state.copyWith(
        authResponseMessage: AuthResponseMessage.none,
        formStatus: FormzSubmissionStatus.inProgress,
      ),
    );

    try {
      final CurrentUser? user = await _firebaseAuthService
          .signUpWithEmailAndPassword(email.value, password.value);
      if (user != null) {
        emit(state.copyWith(
          formStatus: FormzSubmissionStatus.success,
          currentUser: user,
        ));
        _navigateToAuthFlowScreen();
      } else {
        emit(state.copyWith(
          authResponseMessage: AuthResponseMessage.badAuthorization,
          formStatus: FormzSubmissionStatus.failure,
        ));
      }
    } on UserAlreadyExistsError {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.userAlreadyExist,
        formStatus: FormzSubmissionStatus.failure,
      ));
    } catch (e) {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.defaultError,
        formStatus: FormzSubmissionStatus.failure,
      ));
    }
  }

  Future<void> logOut() async {
    const email = EmailInput.pure();
    const password = PasswordInput.pure();
    emit(
      state.copyWith(
          authResponseMessage: AuthResponseMessage.none,
          email: email,
          password: password,
          formStatus: FormzSubmissionStatus.inProgress),
    );
    try {
      await _firebaseAuthService.signOutUser();
    } catch (e) {
      emit(state.copyWith(formStatus: FormzSubmissionStatus.failure));
    } finally {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.none,
        currentUser: null,
        formStatus: FormzSubmissionStatus.success,
      ));
    }
  }

  void emailChanged(String value) {
    final email = state.email.dirty(value);
    emit(state.copyWith(email: email));
  }

  void passwordChanged(String value) {
    final password = state.password.dirty(value);
    emit(state.copyWith(password: password));
  }

  void navigateToLoginPage() {
    _clearState();
    appRouter.replace(const LoginRoute());
  }

  void navigateToRegisterPage() {
    _clearState();
    appRouter.replace(RegisterRoute());
  }

  void _navigateToAuthFlowScreen() {
    appRouter.replace(const AuthenticationFlowRoute());
  }

  void _clearState() {
    emit(
      state.copyWith(
        authResponseMessage: AuthResponseMessage.none,
        email: const EmailInput.pure(),
        password: const PasswordInput.pure(),
        currentUser: null,
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  String? getResponseError(
    AuthResponseMessage authResponseMessage,
    BuildContext context,
  ) {
    switch (authResponseMessage) {
      case AuthResponseMessage.none:
        return null;

      case AuthResponseMessage.userAlreadyExist:
        return S.of(context).userAlreadyExist;

      case AuthResponseMessage.badAuthorization:
        return S.of(context).badAuthorization;

      case AuthResponseMessage.defaultError:
        return S.of(context).defaultError;

      case AuthResponseMessage.userAlreadyLogIn:
        return S.of(context).userAlreadyLogIn;

      case AuthResponseMessage.invalidEmailFormat:
        return S.of(context).invalidEmailFormat;

      case AuthResponseMessage.googleLoginCanceled:
        return S.of(context).googleLoginCanceled;

      case AuthResponseMessage.gitHubLoginCanceled:
        return S.of(context).gitHubLoginCanceled;

      // case AuthResponseMessage.emailAlreadyExist:
      //   return S.of(context).defaultError;

      // case AuthResponseMessage.facebookLoginFailed:
      //   return S.of(context).defaultError;
    }
  }
}
