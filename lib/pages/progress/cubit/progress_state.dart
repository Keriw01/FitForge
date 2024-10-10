part of 'progress_cubit.dart';

@CopyWith()
class ProgressState with EquatableMixin {
  final FirestoreResponseMessage firestoreResponseMessage;
  final bool isLoading;
  final List<Session>? sessions;

  ProgressState({
    this.firestoreResponseMessage = FirestoreResponseMessage.none,
    this.isLoading = true,
    this.sessions,
  });

  @override
  List<Object?> get props => [
        firestoreResponseMessage,
        isLoading,
        sessions,
      ];
}
