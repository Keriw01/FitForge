import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_forge/base_cubit/base_cubit.dart';
import 'package:fit_forge/consts/profile_enums.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/user_profile.dart';
import 'package:fit_forge/repositories/firestore_profile_repository.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:flutter/widgets.dart';

part 'settings_state.dart';
part 'settings_cubit.g.dart';

class SettingsCubit extends BaseCubit<SettingsState> {
  late final FirestoreProfileRepository firebaseProfileRepository =
      FirestoreProfileRepository();

  SettingsCubit(AppRouter appRouter, BuildContext context)
      : super(
          appRouter,
          SettingsState(),
        ) {
    _getUserProfile();
  }

  Future<void> _getUserProfile() async {
    try {
      emit(state.copyWith(isLoading: true));

      User? user = FirebaseAuth.instance.currentUser;

      UserProfile userProfile =
          await firebaseProfileRepository.getUserProfile(user?.uid);

      emit(state.copyWith(
        userProfile: userProfile,
        isLoading: false,
      ));
    } on DocumentIdNotExist {
      emit(state.copyWith(
        profileResponseMessage: ProfileResponseMessage.documentIdNotExist,
        isLoading: false,
      ));
    } on FirestoreException {
      emit(state.copyWith(
        profileResponseMessage: ProfileResponseMessage.firestoreException,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        profileResponseMessage: ProfileResponseMessage.defaultError,
        isLoading: false,
      ));
    }
  }

  Future<void> updateUserProfile(
    ProfileCurrenRow profileCurrenRow, {
    String? userName,
    String? gender,
    DateTime? birthDate,
    String? currentWorkoutLevel,
    String? topGoal,
  }) async {
    try {
      emit(state.copyWith(profileCurrenRow: profileCurrenRow));

      User? user = FirebaseAuth.instance.currentUser;
      UserProfile? currentUserProfile = state.userProfile;

      if (user != null) {
        UserProfile updatedUserProfile = state.userProfile!.copyWith(
          userName: userName ?? currentUserProfile?.userName,
          gender: gender ?? currentUserProfile?.gender,
          birthDate: birthDate ?? currentUserProfile?.birthDate,
          currentWorkoutLevel:
              currentWorkoutLevel ?? currentUserProfile?.currentWorkoutLevel,
          topGoal: topGoal ?? currentUserProfile?.topGoal,
        );

        await firebaseProfileRepository.updateUserProfile(
          user.uid,
          updatedUserProfile,
        );

        emit(state.copyWith(
          userProfile: updatedUserProfile,
          profileCurrenRow: ProfileCurrenRow.none,
        ));
      }
    } on FirestoreException {
      emit(state.copyWith(
        profileResponseMessage: ProfileResponseMessage.firestoreException,
        profileCurrenRow: ProfileCurrenRow.none,
      ));
    } catch (e) {
      emit(state.copyWith(
        profileResponseMessage: ProfileResponseMessage.defaultError,
        profileCurrenRow: ProfileCurrenRow.none,
      ));
    }
  }

  void navigateToSettingsPage() async {
    appRouter.push(SettingsRoute());
    await _getUserProfile();
  }

  void clearState() {
    emit(SettingsState());
  }

  String? getResponseError(
    ProfileResponseMessage profileResponseMessage,
    BuildContext context,
  ) {
    switch (profileResponseMessage) {
      case ProfileResponseMessage.none:
        return null;

      case ProfileResponseMessage.documentIdNotExist:
        return S.of(context).documentIdNotExist;

      case ProfileResponseMessage.firestoreException:
        return S.of(context).firestoreException;

      case ProfileResponseMessage.defaultError:
        return S.of(context).defaultError;

      default:
        return S.of(context).defaultError;
    }
  }
}
