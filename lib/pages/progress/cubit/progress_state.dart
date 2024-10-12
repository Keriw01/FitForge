part of 'progress_cubit.dart';

@CopyWith()
class ProgressState with EquatableMixin {
  final FirestoreResponseMessage firestoreResponseMessage;
  final bool isLoading;
  final List<Session>? sessions;
  final UserBodyStats? userBodyStats;
  final double? inputWeight;
  final String? inputHeight;
  final int? inputAge;

  ProgressState({
    this.firestoreResponseMessage = FirestoreResponseMessage.none,
    this.isLoading = true,
    this.sessions,
    this.userBodyStats,
    this.inputWeight,
    this.inputHeight,
    this.inputAge,
  });

  @override
  List<Object?> get props => [
        firestoreResponseMessage,
        isLoading,
        sessions,
        userBodyStats,
        inputWeight,
        inputHeight,
        inputAge,
      ];
}
