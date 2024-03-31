import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_forge/exceptions/auth_exceptions.dart';
import 'package:fit_forge/models/current_user.dart';

class FirebaseAuthService {
  FirebaseAuthService();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<CurrentUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return CurrentUser(
          userId: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          name: firebaseUser.displayName ?? '',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw InternalCredentialsError();
      }
    }
    return null;
  }

  Future<CurrentUser?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        String userId = firebaseUser.uid;

        CollectionReference usersCollection =
            FirebaseFirestore.instance.collection('Users');

        DocumentReference userDocRef = usersCollection.doc(userId);

        Map<String, dynamic> userData = {
          'email': firebaseUser.email,
          'userName': firebaseUser.displayName ?? '',
        };

        await userDocRef.set(userData);

        return CurrentUser(
          userId: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          name: firebaseUser.displayName ?? '',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw UserAlreadyExistsError();
      }
    }
    return null;
  }

  ///signOutUser
  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
}
