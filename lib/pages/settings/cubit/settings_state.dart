part of 'settings_cubit.dart';

@CopyWith()
class SettingsState with EquatableMixin {
  final ProfileResponseMessage profileResponseMessage;
  final bool isLoading;
  final ProfileCurrenRow profileCurrenRow;
  final UserProfile? userProfile;

  SettingsState({
    this.profileResponseMessage = ProfileResponseMessage.none,
    this.isLoading = false,
    this.profileCurrenRow = ProfileCurrenRow.none,
    this.userProfile,
  });

  @override
  List<Object?> get props => [
        profileResponseMessage,
        isLoading,
        profileCurrenRow,
        userProfile,
      ];
}
