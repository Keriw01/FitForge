import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_forge/base_cubit/base_cubit.dart';
import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/models/day_exercise.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/models/plan.dart';
import 'package:fit_forge/models/plan_day.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/repositories/firestore_workouts_repository.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/utils/forms/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'workouts_state.dart';
part 'workouts_cubit.g.dart';

class WorkoutsCubit extends BaseCubit<WorkoutsState> {
  late final FirestoreWorkoutsRepository firestoreWorkoutsRepository =
      FirestoreWorkoutsRepository();
  late final SettingsCubit _settingsCubit;

  WorkoutsCubit(AppRouter appRouter, BuildContext context)
      : _settingsCubit = context.read<SettingsCubit>(),
        super(
          appRouter,
          WorkoutsState(),
        ) {
    _getUserPlansAndCurrent();
  }

  Future<void> _getUserPlansAndCurrent() async {
    try {
      emit(state.copyWith(
        isLoading: true,
        firestoreResponseMessage: FirestoreResponseMessage.none,
      ));

      User? user = FirebaseAuth.instance.currentUser;

      List<Plan>? userPlans =
          await firestoreWorkoutsRepository.getUserPlans(user?.uid);

      Plan? currentPlan =
          await firestoreWorkoutsRepository.getCurrentPlan(user?.uid);

      emit(state.copyWith(
        userPlans: userPlans,
        currentPlan: currentPlan,
        isLoading: false,
      ));
    } on DocumentIdNotExist {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.documentIdNotExist,
        isLoading: false,
      ));
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
        isLoading: false,
      ));
    }
  }

  void setPlanName(String value) {
    final planName = PlanName.dirty(value);
    emit(state.copyWith(planName: planName));
  }

  void setPlanDescription(String value) {
    final planDescription = PlanDescription.dirty(value);
    emit(state.copyWith(planDescription: planDescription));
  }

  void setNumberOfDays(int days) {
    emit(state.copyWith(numberOfDays: days));
  }

  void setPlanType(String planType) {
    emit(state.copyWith(selectedPlanType: planType));
  }

  void setDifficultyLevel(String difficultyLevel) {
    emit(state.copyWith(selectedDifficultyLevel: difficultyLevel));
  }

  void clearForm() {
    emit(state.copyWith(
      planName: const PlanName.pure(),
      planDescription: const PlanDescription.pure(),
      numberOfDays: 3,
      selectedPlanType: 'maintaining',
      selectedDifficultyLevel: 'beginner',
    ));
    appRouter.maybePop();
  }

  void addNewPlan() async {
    try {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.none,
        isLoading: true,
      ));

      Plan newPlan = Plan(
        difficultyLevel: state.selectedDifficultyLevel,
        numberOfDays: state.numberOfDays,
        planDescription: state.planDescription.value,
        planName: state.planName.value,
        planType: state.selectedPlanType,
      );

      User? user = FirebaseAuth.instance.currentUser;

      Plan? addedPlan =
          await firestoreWorkoutsRepository.addNewPlan(user?.uid, newPlan);

      if (addedPlan?.planId != null) {
        List<Plan> updatedPlans = List.from(state.userPlans ?? [])
          ..add(addedPlan!);

        emit(state.copyWith(
          userPlans: updatedPlans,
          currentPlan: addedPlan,
          isLoading: false,
        ));
      }
      clearForm();
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
        isLoading: false,
      ));
    }
  }

  void setCurrentPlan(Plan plan) async {
    print(plan);
    try {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.none,
      ));

      User? user = FirebaseAuth.instance.currentUser;
      await firestoreWorkoutsRepository.saveCurrentPlanId(
          user?.uid, plan.planId!);

      emit(state.copyWith(currentPlan: plan));
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
      ));
    }
  }

  void loadPlanForEditing(Plan plan) {
    emit(state.copyWith(
      planName: PlanName.dirty(plan.planName),
      planDescription: PlanDescription.dirty(plan.planDescription),
      numberOfDays: plan.numberOfDays,
      selectedPlanType: plan.planType,
      selectedDifficultyLevel: plan.difficultyLevel,
    ));
  }

  void saveEditedPlan(String? planId) async {
    try {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.none,
      ));

      Plan editedPlan =
          state.userPlans!.firstWhere((planData) => planData.planId == planId);

      editedPlan = editedPlan.copyWith(
        difficultyLevel: state.selectedDifficultyLevel,
        numberOfDays: state.numberOfDays,
        planDescription: state.planDescription.value,
        planName: state.planName.value,
        planType: state.selectedPlanType,
      );

      User? user = FirebaseAuth.instance.currentUser;
      await firestoreWorkoutsRepository.saveEditedPlan(user?.uid, editedPlan);

      List<Plan> updatedPlans = (state.userPlans ?? []).map((plan) {
        return plan.planId == editedPlan.planId ? editedPlan : plan;
      }).toList();

      emit(state.copyWith(
          userPlans: updatedPlans,
          currentPlan: planId == state.currentPlan?.planId
              ? editedPlan
              : state.currentPlan));

      clearForm();
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
      ));
    }
  }

  void deletePlan(Plan plan) async {
    try {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.none,
      ));

      User? user = FirebaseAuth.instance.currentUser;

      await firestoreWorkoutsRepository.deletePlan(user?.uid, plan.planId);

      emit(state.copyWith(
        currentPlan:
            plan.planId == state.currentPlan?.planId ? null : state.currentPlan,
      ));

      List<Plan> updatedPlans = (state.userPlans ?? [])
          .where((p) => p.planId != plan.planId)
          .toList();

      emit(state.copyWith(
        userPlans: updatedPlans,
      ));
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
      ));
    }
  }

  void addNewDay(Plan? currentPlan) async {
    try {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.none,
      ));

      User? user = FirebaseAuth.instance.currentUser;
      if (currentPlan != null && currentPlan.days != null) {
        int newDayNumber =
            currentPlan.numberOfDays != 0 ? currentPlan.numberOfDays + 1 : 1;

        String? newDayId = await firestoreWorkoutsRepository.addNewDayAndGetId(
          user?.uid,
          currentPlan.planId,
          newDayNumber,
        );

        if (newDayId != null) {
          PlanDay newDay = PlanDay(
            dayId: newDayId,
            dayTitle: 'Day $newDayNumber',
          );

          List<PlanDay> updatedDays = List.from(currentPlan.days!)..add(newDay);

          updatedDays.sort((a, b) => a.dayTitle.compareTo(b.dayTitle));

          Plan updatedCurrentPlan = currentPlan.copyWith(
            days: updatedDays,
            numberOfDays: newDayNumber,
          );

          List<Plan> updatedUserPlans = (state.userPlans ?? []).map((plan) {
            return plan.planId == updatedCurrentPlan.planId
                ? updatedCurrentPlan
                : plan;
          }).toList();

          emit(state.copyWith(
            userPlans: updatedUserPlans,
            currentPlan: updatedCurrentPlan,
            firestoreResponseMessage: FirestoreResponseMessage.none,
          ));
        } else {
          emit(state.copyWith(
            firestoreResponseMessage: FirestoreResponseMessage.defaultError,
          ));
        }
      }
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
      ));
    }
  }

  void deleteDay(Plan? currentPlan, PlanDay day) async {
    try {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.none,
      ));

      User? user = FirebaseAuth.instance.currentUser;
      if (currentPlan != null && currentPlan.days != null) {
        await firestoreWorkoutsRepository.deleteDay(
          user?.uid,
          currentPlan,
          day.dayId,
        );

        List<PlanDay> updatedDays = List.from(currentPlan.days!)..remove(day);

        Plan updatedCurrentPlan = currentPlan.copyWith(
          days: updatedDays,
          numberOfDays: currentPlan.numberOfDays - 1,
        );

        List<Plan> updatedUserPlans = (state.userPlans ?? []).map((plan) {
          return plan.planId == updatedCurrentPlan.planId
              ? updatedCurrentPlan
              : plan;
        }).toList();

        emit(state.copyWith(
          userPlans: updatedUserPlans,
          currentPlan: updatedCurrentPlan,
          firestoreResponseMessage: FirestoreResponseMessage.none,
        ));

        appRouter.maybePop();
      } else {
        emit(state.copyWith(
          firestoreResponseMessage: FirestoreResponseMessage.defaultError,
        ));
      }
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
      ));
    } catch (e) {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
      ));
    }
  }

  void setDayTitle(String value) {
    final dayTitle = DayTitle.dirty(value);
    emit(state.copyWith(dayTitle: dayTitle));
  }

  void saveRenamedDay(String? planId, PlanDay day) async {
    try {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.none,
      ));

      Plan editedPlan =
          state.userPlans!.firstWhere((planData) => planData.planId == planId);

      PlanDay editedPlanDay = day.copyWith(dayTitle: state.dayTitle.value);

      List<PlanDay> updatedPlanDays = (editedPlan.days ?? []).map((day) {
        return day.dayId == editedPlanDay.dayId ? editedPlanDay : day;
      }).toList();

      updatedPlanDays.sort((a, b) => a.dayTitle.compareTo(b.dayTitle));

      editedPlan = editedPlan.copyWith(days: updatedPlanDays);

      List<Plan> updatedPlans = (state.userPlans ?? []).map((plan) {
        return plan.planId == editedPlan.planId ? editedPlan : plan;
      }).toList();

      User? user = FirebaseAuth.instance.currentUser;
      await firestoreWorkoutsRepository.saveEditedPlanDay(
        user?.uid,
        planId,
        editedPlanDay,
      );

      emit(state.copyWith(
        userPlans: updatedPlans,
        currentPlan: planId == state.currentPlan?.planId
            ? editedPlan
            : state.currentPlan,
        dayTitle: const DayTitle.pure(),
      ));

      appRouter.maybePop();
    } on FirestoreException {
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.firestoreException,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(
        firestoreResponseMessage: FirestoreResponseMessage.defaultError,
      ));
    }
  }

  void updatedPlanDayAfterAdd(String? planId, PlanDay? newPlanDay) {
    if (planId == null || newPlanDay == null) return;

    final updatedDays = state.currentPlan?.days?.map((day) {
          return day.dayId == newPlanDay.dayId ? newPlanDay : day;
        }).toList() ??
        [];

    Plan? updatedCurrentPlan = state.currentPlan?.copyWith(
      days: updatedDays,
    );

    List<Plan> updatedUserPlans = (state.userPlans ?? []).map((plan) {
      return plan.planId == updatedCurrentPlan?.planId
          ? updatedCurrentPlan!
          : plan;
    }).toList();

    emit(state.copyWith(
      userPlans: updatedUserPlans,
      currentPlan: updatedCurrentPlan,
    ));
  }

  void addNewExercise(
    String? planId,
    PlanDay? planDay,
    ExerciseInfo exerciseInfo,
  ) async {
    User? user = FirebaseAuth.instance.currentUser;

    DayExercise newExercise = DayExercise(
      exerciseRefId: exerciseInfo.exerciseId,
      numberOfReps: _settingsCubit.state.userProfile?.defaultReps ?? 8,
      numberOfSets: _settingsCubit.state.userProfile?.defaultSets ?? 3,
    );

    await firestoreWorkoutsRepository.addNewExerciseToDayFromExerciseDetail(
      user?.uid,
      planId,
      planDay?.dayId,
      newExercise,
    );

    if (planDay != null) {
      Plan? targetPlan =
          (state.userPlans ?? []).firstWhere((plan) => plan.planId == planId);

      PlanDay updatedPlanDay = planDay.copyWith(
        dayExercises: [
          ...?planDay.dayExercises,
          newExercise,
        ],
      );

      final updatedDays = targetPlan.days?.map((day) {
            return day.dayId == planDay.dayId ? updatedPlanDay : day;
          }).toList() ??
          [];

      Plan updatedTargetPlan = targetPlan.copyWith(days: updatedDays);

      List<Plan> updatedUserPlans = (state.userPlans ?? []).map((plan) {
        return plan.planId == updatedTargetPlan.planId
            ? updatedTargetPlan
            : plan;
      }).toList();
      print('addNewExercise $updatedUserPlans');
      emit(state.copyWith(
        userPlans: updatedUserPlans,
        currentPlan: updatedTargetPlan.planId == state.currentPlan?.planId
            ? updatedTargetPlan
            : state.currentPlan,
      ));
    }
  }

  void clearState() {
    emit(WorkoutsState());
  }
}
