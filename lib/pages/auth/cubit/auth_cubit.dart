import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fit_forge/base_cubit/base_cubit.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/repositories/firestore_auth_repository.dart';
import 'package:fit_forge/models/current_user.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/utils/forms/inputs.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

part 'auth_state.dart';
part 'auth_cubit.g.dart';

/// AuthBloc is responsible for managing authorization in the application
class AuthCubit extends BaseCubit<AuthState> {
  late final FirestoreAuthRepository _firebaseAuthService =
      FirestoreAuthRepository();

  AuthCubit(AppRouter appRouter, BuildContext context)
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

    if (password.isNotValid || email.isNotValid) {
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.failure,
          authResponseMessage: AuthResponseMessage.badAuthorization,
        ),
      );
      return;
    }

    try {
      final CurrentUser? user = await _firebaseAuthService
          .signInWithEmailAndPassword(email.value, password.value);
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
    } on InternalCredentialsError {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.badAuthorization,
        formStatus: FormzSubmissionStatus.failure,
      ));
    } on NetworkRequestFailed {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.networkRequestFailed,
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

      final CurrentUser? user =
          await _firebaseAuthService.signInWithGoogleAccount(credential);

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
    } on NetworkRequestFailed {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.networkRequestFailed,
        formStatus: FormzSubmissionStatus.failure,
      ));
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

      final CurrentUser? user =
          await _firebaseAuthService.signInWithGitHubAccount(githubProvider);

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
    } on NetworkRequestFailed {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.networkRequestFailed,
        formStatus: FormzSubmissionStatus.failure,
      ));
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
    } on NetworkRequestFailed {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.networkRequestFailed,
        formStatus: FormzSubmissionStatus.failure,
      ));
    } catch (e) {
      emit(state.copyWith(
        authResponseMessage: AuthResponseMessage.defaultError,
        formStatus: FormzSubmissionStatus.failure,
      ));
    }
  }

  void logOut(BuildContext context) {
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
      _firebaseAuthService.signOutUser();
    } catch (e) {
      emit(state.copyWith(formStatus: FormzSubmissionStatus.failure));
    } finally {
      navigateToLoginPage();
      context.read<SettingsCubit>().clearState();
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
    appRouter.replaceAll([const AuthenticationFlowRoute()]);
  }

  void _clearState() {
    emit(AuthState());
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

      case AuthResponseMessage.networkRequestFailed:
        return S.of(context).networkRequestFailed;
    }
  }
}
