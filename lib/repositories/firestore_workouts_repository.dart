import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/models/plan.dart';
import 'package:fit_forge/models/plan_day.dart';
import 'package:fit_forge/models/day_exercise.dart';

class FirestoreWorkoutsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Plan>?> getUserPlans(String? userId) async {
    try {
      final plansCollectionRef = _firestore
          .collection('UserTrainingPlans')
          .doc(userId)
          .collection('Plans');

      final plansSnapshot = await plansCollectionRef.get();

      if (plansSnapshot.docs.isEmpty) {
        return null;
      } else {
        List<Plan> plans = [];
        for (var planDoc in plansSnapshot.docs) {
          final daysCollectionRef =
              plansCollectionRef.doc(planDoc.id).collection('Days');

          final daysSnapshot = await daysCollectionRef.get();

          List<PlanDay> days = [];

          for (var dayDoc in daysSnapshot.docs) {
            final exercisesCollectionRef =
                daysCollectionRef.doc(dayDoc.id).collection('DayExercises');
            final exercisesSnapshot = await exercisesCollectionRef.get();

            List<DayExercise> exercises =
                exercisesSnapshot.docs.map((exerciseDoc) {
              return DayExercise.fromJson(exerciseDoc.data());
            }).toList();

            PlanDay day = PlanDay.fromJson(dayDoc.data())
                .copyWith(dayExercises: exercises);

            days.add(day);
          }
          days.sort((a, b) => a.dayTitle.compareTo(b.dayTitle));

          Plan plan = Plan.fromJson(planDoc.data()).copyWith(days: days);

          plans.add(plan);
        }

        return plans;
      }
    } on DocumentIdNotExist {
      throw DocumentIdNotExist();
    } catch (e) {
      print(e);
      throw FirestoreException();
    }
  }

  Future<Plan?> getCurrentPlan(String? userId) async {
    try {
      final userDocRef = _firestore.collection('UserTrainingPlans').doc(userId);
      final userDocSnapshot = await userDocRef.get();

      final currentPlanId = userDocSnapshot.data()?['currentPlanId'];

      if (currentPlanId == null) {
        return null;
      }

      final planDocRef = userDocRef.collection('Plans').doc(currentPlanId);
      final planDocSnapshot = await planDocRef.get();

      final planData = planDocSnapshot.data();

      if (planData == null) {
        return null;
      }

      final daysCollectionRef = planDocRef.collection('Days');
      final daysSnapshot = await daysCollectionRef.get();

      List<PlanDay> days = [];

      for (var dayDoc in daysSnapshot.docs) {
        final exercisesCollectionRef =
            daysCollectionRef.doc(dayDoc.id).collection('PlanExercises');
        final exercisesSnapshot = await exercisesCollectionRef.get();

        List<DayExercise> exercises =
            exercisesSnapshot.docs.map((exercisesDoc) {
          return DayExercise.fromJson(exercisesDoc.data());
        }).toList();

        PlanDay day =
            PlanDay.fromJson(dayDoc.data()).copyWith(dayExercises: exercises);

        days.add(day);
      }

      days.sort((a, b) => a.dayTitle.compareTo(b.dayTitle));

      Plan plan = Plan.fromJson(planData).copyWith(days: days);

      return plan;
    } on DocumentIdNotExist {
      throw DocumentIdNotExist();
    } catch (e) {
      print(e);
      throw FirestoreException();
    }
  }

  Future<Plan?> addNewPlan(String? userId, Plan newPlan) async {
    try {
      final userDocRef = _firestore.collection('UserTrainingPlans').doc(userId);

      final plansCollectionRef = userDocRef.collection('Plans');
      final planDocRef = plansCollectionRef.doc();
      final planId = planDocRef.id;

      // Sprawdzanie czy są istniejące plany
      final plansSnapshot = await plansCollectionRef.get();
      // Jeżeli brak istniejących planów, ustaw nowy plan jako currentPlan
      if (plansSnapshot.docs.isEmpty) {
        await userDocRef.set({
          'currentPlanId': planId,
        }, SetOptions(merge: true));
      }

      await planDocRef.set({
        'difficultyLevel': newPlan.difficultyLevel,
        'numberOfDays': newPlan.numberOfDays,
        'planDescription': newPlan.planDescription,
        'planId': planId,
        'planName': newPlan.planName,
        'planType': newPlan.planType,
      });

      final daysCollectionRef = planDocRef.collection('Days');
      List<PlanDay>? days = [];

      for (int i = 1; i <= newPlan.numberOfDays; i++) {
        final daysDocRef = daysCollectionRef.doc();
        final dayId = daysDocRef.id;

        days.add(
          PlanDay(dayId: dayId, dayTitle: 'Day $i'),
        );

        await daysDocRef.set({
          'dayId': dayId,
          'dayTitle': 'Day $i',
        });
      }

      return newPlan.copyWith(
        planId: planId,
        days: days,
      );
    } catch (e) {
      throw FirestoreException();
    }
  }

  Future<void> saveEditedPlan(String? userId, Plan editedPlan) async {
    try {
      await _firestore
          .collection('UserTrainingPlans')
          .doc(userId)
          .collection('Plans')
          .doc(editedPlan.planId)
          .update({
        'difficultyLevel': editedPlan.difficultyLevel,
        'planDescription': editedPlan.planDescription,
        'planName': editedPlan.planName,
        'planType': editedPlan.planType,
      });
    } catch (e) {
      throw FirestoreException();
    }
  }

  Future<void> saveCurrentPlanId(
      String? userId, String newCurrentPlanId) async {
    try {
      await _firestore.collection('UserTrainingPlans').doc(userId).update({
        'currentPlanId': newCurrentPlanId,
      });
    } catch (e) {
      throw FirestoreException();
    }
  }

  Future<void> deletePlan(String? userId, String? planId) async {
    try {
      final userDocRef = _firestore.collection('UserTrainingPlans').doc(userId);
      final planDocRef = userDocRef.collection('Plans').doc(planId);

      final userDocSnapshot = await userDocRef.get();
      final currentPlanId = userDocSnapshot.data()?['currentPlanId'];

      if (currentPlanId == planId) {
        await userDocRef.set({
          'currentPlanId': null,
        }, SetOptions(merge: true));
      }

      await planDocRef.delete();
    } catch (e) {
      print(e);
      throw FirestoreException();
    }
  }

  Future<String?> addNewDayAndGetId(
    String? userId,
    String? planId,
    int newDayNumber,
  ) async {
    try {
      final planDocRef = _firestore
          .collection('UserTrainingPlans')
          .doc(userId)
          .collection('Plans')
          .doc(planId);

      await planDocRef.update({
        'numberOfDays': newDayNumber,
      });

      final daysCollectionRef = planDocRef.collection('Days');
      final daysDocRef = daysCollectionRef.doc();
      final dayId = daysDocRef.id;

      await daysDocRef.set({
        'dayId': dayId,
        'dayTitle': 'Day $newDayNumber',
      });

      return dayId;
    } catch (e) {
      throw FirestoreException();
    }
  }

  Future<void> deleteDay(
    String? userId,
    Plan plan,
    String dayId,
  ) async {
    try {
      final planDocRef = _firestore
          .collection('UserTrainingPlans')
          .doc(userId)
          .collection('Plans')
          .doc(plan.planId);

      planDocRef.update({
        'numberOfDays': plan.numberOfDays - 1,
      });

      final daysCollectionRef = planDocRef.collection('Days').doc(dayId);
      daysCollectionRef.delete();
    } catch (e) {
      throw FirestoreException();
    }
  }

  Future<void> saveEditedPlanDay(
      String? userId, String? planId, PlanDay day) async {
    try {
      await _firestore
          .collection('UserTrainingPlans')
          .doc(userId)
          .collection('Plans')
          .doc(planId)
          .collection('Days')
          .doc(day.dayId)
          .update({
        'dayTitle': day.dayTitle,
      });
    } catch (e) {
      throw FirestoreException();
    }
  }
}
