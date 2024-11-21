part of 'progress_cubit.dart';

@CopyWith()
class ProgressState with EquatableMixin {
  final FirestoreResponseMessage firestoreResponseMessage;
  final bool isLoading;
  final List<Session>? sessions;
  final UserBodyStats? userBodyStats;
  final double? inputWeight;
  final String? inputHeight;
  final DateTime? inputBirthDate;

  ProgressState({
    this.firestoreResponseMessage = FirestoreResponseMessage.none,
    this.isLoading = false,
    this.sessions,
    this.userBodyStats,
    this.inputWeight,
    this.inputHeight,
    this.inputBirthDate,
  });

  @override
  List<Object?> get props => [
        firestoreResponseMessage,
        isLoading,
        sessions,
        userBodyStats,
        inputWeight,
        inputHeight,
        inputBirthDate,
      ];
}
