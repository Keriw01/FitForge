part of 'workouts_cubit.dart';

@CopyWith()
class WorkoutsState with EquatableMixin {
  final PlanName planName;
  final PlanDescription planDescription;

  final int numberOfDays;
  final String selectedPlanType;
  final String selectedDifficultyLevel;

  final FirestoreResponseMessage firestoreResponseMessage;
  final bool isLoading;

  final List<Plan>? userPlans;
  final Plan? currentPlan;

  WorkoutsState({
    this.planName = const PlanName.pure(),
    this.planDescription = const PlanDescription.pure(),
    this.numberOfDays = 3,
    this.selectedPlanType = 'maintaining',
    this.selectedDifficultyLevel = 'beginner',
    this.firestoreResponseMessage = FirestoreResponseMessage.none,
    this.isLoading = false,
    this.userPlans,
    this.currentPlan,
  });

  @override
  List<Object?> get props => [
        planName,
        planDescription,
        numberOfDays,
        selectedPlanType,
        selectedDifficultyLevel,
        firestoreResponseMessage,
        isLoading,
        userPlans,
        currentPlan,
      ];
}
