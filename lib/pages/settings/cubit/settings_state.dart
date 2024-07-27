part of 'settings_cubit.dart';

enum ProfileResponseMessage {
  none,
  documentIdNotExist,
  firestoreException,
  defaultError,
}

@CopyWith()
class SettingsState with EquatableMixin {
  final ProfileResponseMessage profileResponseMessage;
  final bool isLoading;
  final bool isSavingRow;
  final UserProfile? userProfile;

  SettingsState({
    this.profileResponseMessage = ProfileResponseMessage.none,
    this.isLoading = false,
    this.isSavingRow = false,
    this.userProfile,
  });

  @override
  List<Object?> get props => [
        profileResponseMessage,
        isLoading,
        isSavingRow,
        userProfile,
      ];
}
