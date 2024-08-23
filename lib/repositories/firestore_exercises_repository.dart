import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/models/exercises.dart';

class FirestoreExercisesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Exercises>> getExercises() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('Exercises').get();

      List<Exercises> exercisesList = snapshot.docs.map((doc) {
        Map<String, dynamic> exercises = {};
        exercises['exercise'] = doc.data();
        exercises['exerciseId'] = doc.id;

        return Exercises.fromJson(exercises);
      }).toList();

      return exercisesList;
    } catch (e) {
      throw FirestoreException();
    }
  }
}
