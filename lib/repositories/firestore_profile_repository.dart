import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/models/user_profile.dart';

class FirestoreProfileRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserProfile> getUserProfile(String? userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('Users').doc(userId).get();

      Map<String, dynamic>? data = snapshot.data();

      if (data != null) {
        return UserProfile.fromJson(data);
      } else {
        throw DocumentIdNotExist();
      }
    } catch (e) {
      throw FirestoreException();
    }
  }
}