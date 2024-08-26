part of 'settings_cubit.dart';

@CopyWith()
class SettingsState with EquatableMixin {
  final FirestoreResponseMessage firestoreResponseMessage;
  final bool isLoading;
  final ProfileCurrenRow profileCurrenRow;
  final UserProfile? userProfile;

  SettingsState({
    this.firestoreResponseMessage = FirestoreResponseMessage.none,
    this.isLoading = false,
    this.profileCurrenRow = ProfileCurrenRow.none,
    this.userProfile,
  });

  @override
  List<Object?> get props => [
        firestoreResponseMessage,
        isLoading,
        profileCurrenRow,
        userProfile,
      ];
}
