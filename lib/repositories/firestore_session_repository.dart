import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/models/session.dart';

class FirestoreSessionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Session> addNewSession(String? userId) async {
    try {
      final userDocRef =
          _firestore.collection('UserTrainingSessions').doc(userId);

      final sessionsCollectionRef = userDocRef.collection('Sessions');
      final sessionDocRef = sessionsCollectionRef.doc();
      final sessionId = sessionDocRef.id;

      await userDocRef.set({
        'currentSessionId': sessionId,
      }, SetOptions(merge: true));

      Session session = Session(
        sessionId: sessionId,
        userId: userId!,
        totalCaloriesBurned: '0',
        totalDuration: '0',
        totalExercises: 0,
        totalWeightLifted: '0',
        exercisesWith1RM: 0,
        startTime: DateTime.now(),
      );

      await sessionDocRef.set({
        'startTime': session.startTime,
        'totalCaloriesBurned': session.totalCaloriesBurned,
        'totalDuration': session.totalDuration,
        'totalExercises': session.totalExercises,
        'totalWeightLifted': session.totalWeightLifted,
        'exercisesWith1RM': session.exercisesWith1RM,
      });

      return session;
    } catch (e) {
      print(e);
      throw FirestoreException();
    }
  }

  Future<void> saveEndedSession(String? userId, Session session) async {
    try {
      final userDocRef =
          _firestore.collection('UserTrainingSessions').doc(userId);

      await userDocRef.set({
        'currentSessionId': null,
      }, SetOptions(merge: true));

      final sessionsCollectionRef = userDocRef.collection('Sessions');
      final sessionDocRef = sessionsCollectionRef.doc(session.sessionId);

      await sessionDocRef.update({
        'endTime': session.endTime,
        'totalCaloriesBurned': session.totalCaloriesBurned,
        'totalDuration': session.totalDuration,
        'totalExercises': session.totalExercises,
        'totalWeightLifted': session.totalWeightLifted,
        'exercisesWith1RM': session.exercisesWith1RM,
      });

      final sessionExercisesCollectionRef =
          sessionDocRef.collection('SessionExercises');

      for (var exercise in session.sessionExercises ?? []) {
        final sessionExercisesDocRef = sessionExercisesCollectionRef.doc();

        await sessionExercisesDocRef.set({
          'exerciseRefId': exercise.exerciseRefId,
          'duration': exercise.duration,
          'restTime': exercise.restTime,
          'best1RM': exercise.best1RM,
        });

        final exerciseSetsCollectionRef =
            sessionExercisesDocRef.collection('ExerciseSets');

        for (var i = 0; i < (exercise.exercisesSets?.length ?? 0); i++) {
          final set = exercise.exercisesSets![i];

          await exerciseSetsCollectionRef.doc(i.toString()).set({
            'set': set.set,
            'weight': set.weight,
            'reps': set.reps,
          });
        }
      }
    } catch (e) {
      print(e);
      throw FirestoreException();
    }
  }

  Future<void> deleteEndedWorkout(String? userId, Session session) async {
    try {
      final userDocRef =
          _firestore.collection('UserTrainingSessions').doc(userId);

      await userDocRef.set({
        'currentSessionId': null,
      }, SetOptions(merge: true));

      final sessionsCollectionRef = userDocRef.collection('Sessions');
      final sessionDocRef = sessionsCollectionRef.doc(session.sessionId);

      await sessionDocRef.delete();
    } catch (e) {
      print(e);
      throw FirestoreException();
    }
  }
}
