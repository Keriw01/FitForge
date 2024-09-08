// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workouts_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkoutsStateCWProxy {
  WorkoutsState planName(PlanName planName);

  WorkoutsState planDescription(PlanDescription planDescription);

  WorkoutsState numberOfDays(int numberOfDays);

  WorkoutsState selectedPlanType(String selectedPlanType);

  WorkoutsState selectedDifficultyLevel(String selectedDifficultyLevel);

  WorkoutsState firestoreResponseMessage(
      FirestoreResponseMessage firestoreResponseMessage);

  WorkoutsState isLoading(bool isLoading);

  WorkoutsState userPlans(List<Plan>? userPlans);

  WorkoutsState currentPlan(Plan? currentPlan);

  WorkoutsState dayTitle(DayTitle dayTitle);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkoutsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkoutsState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkoutsState call({
    PlanName? planName,
    PlanDescription? planDescription,
    int? numberOfDays,
    String? selectedPlanType,
    String? selectedDifficultyLevel,
    FirestoreResponseMessage? firestoreResponseMessage,
    bool? isLoading,
    List<Plan>? userPlans,
    Plan? currentPlan,
    DayTitle? dayTitle,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkoutsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkoutsState.copyWith.fieldName(...)`
class _$WorkoutsStateCWProxyImpl implements _$WorkoutsStateCWProxy {
  const _$WorkoutsStateCWProxyImpl(this._value);

  final WorkoutsState _value;

  @override
  WorkoutsState planName(PlanName planName) => this(planName: planName);

  @override
  WorkoutsState planDescription(PlanDescription planDescription) =>
      this(planDescription: planDescription);

  @override
  WorkoutsState numberOfDays(int numberOfDays) =>
      this(numberOfDays: numberOfDays);

  @override
  WorkoutsState selectedPlanType(String selectedPlanType) =>
      this(selectedPlanType: selectedPlanType);

  @override
  WorkoutsState selectedDifficultyLevel(String selectedDifficultyLevel) =>
      this(selectedDifficultyLevel: selectedDifficultyLevel);

  @override
  WorkoutsState firestoreResponseMessage(
          FirestoreResponseMessage firestoreResponseMessage) =>
      this(firestoreResponseMessage: firestoreResponseMessage);

  @override
  WorkoutsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  WorkoutsState userPlans(List<Plan>? userPlans) => this(userPlans: userPlans);

  @override
  WorkoutsState currentPlan(Plan? currentPlan) =>
      this(currentPlan: currentPlan);

  @override
  WorkoutsState dayTitle(DayTitle dayTitle) => this(dayTitle: dayTitle);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkoutsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkoutsState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkoutsState call({
    Object? planName = const $CopyWithPlaceholder(),
    Object? planDescription = const $CopyWithPlaceholder(),
    Object? numberOfDays = const $CopyWithPlaceholder(),
    Object? selectedPlanType = const $CopyWithPlaceholder(),
    Object? selectedDifficultyLevel = const $CopyWithPlaceholder(),
    Object? firestoreResponseMessage = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? userPlans = const $CopyWithPlaceholder(),
    Object? currentPlan = const $CopyWithPlaceholder(),
    Object? dayTitle = const $CopyWithPlaceholder(),
  }) {
    return WorkoutsState(
      planName: planName == const $CopyWithPlaceholder() || planName == null
          ? _value.planName
          // ignore: cast_nullable_to_non_nullable
          : planName as PlanName,
      planDescription: planDescription == const $CopyWithPlaceholder() ||
              planDescription == null
          ? _value.planDescription
          // ignore: cast_nullable_to_non_nullable
          : planDescription as PlanDescription,
      numberOfDays:
          numberOfDays == const $CopyWithPlaceholder() || numberOfDays == null
              ? _value.numberOfDays
              // ignore: cast_nullable_to_non_nullable
              : numberOfDays as int,
      selectedPlanType: selectedPlanType == const $CopyWithPlaceholder() ||
              selectedPlanType == null
          ? _value.selectedPlanType
          // ignore: cast_nullable_to_non_nullable
          : selectedPlanType as String,
      selectedDifficultyLevel:
          selectedDifficultyLevel == const $CopyWithPlaceholder() ||
                  selectedDifficultyLevel == null
              ? _value.selectedDifficultyLevel
              // ignore: cast_nullable_to_non_nullable
              : selectedDifficultyLevel as String,
      firestoreResponseMessage:
          firestoreResponseMessage == const $CopyWithPlaceholder() ||
                  firestoreResponseMessage == null
              ? _value.firestoreResponseMessage
              // ignore: cast_nullable_to_non_nullable
              : firestoreResponseMessage as FirestoreResponseMessage,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      userPlans: userPlans == const $CopyWithPlaceholder()
          ? _value.userPlans
          // ignore: cast_nullable_to_non_nullable
          : userPlans as List<Plan>?,
      currentPlan: currentPlan == const $CopyWithPlaceholder()
          ? _value.currentPlan
          // ignore: cast_nullable_to_non_nullable
          : currentPlan as Plan?,
      dayTitle: dayTitle == const $CopyWithPlaceholder() || dayTitle == null
          ? _value.dayTitle
          // ignore: cast_nullable_to_non_nullable
          : dayTitle as DayTitle,
    );
  }
}

extension $WorkoutsStateCopyWith on WorkoutsState {
  /// Returns a callable class that can be used as follows: `instanceOfWorkoutsState.copyWith(...)` or like so:`instanceOfWorkoutsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkoutsStateCWProxy get copyWith => _$WorkoutsStateCWProxyImpl(this);
}
