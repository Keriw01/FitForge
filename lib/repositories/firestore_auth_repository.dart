import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_forge/exceptions/exceptions.dart';
import 'package:fit_forge/models/current_user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirestoreAuthRepository {
  FirestoreAuthRepository();

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
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw InternalCredentialsError();
      } else if (e.code == 'network-request-failed') {
        throw NetworkRequestFailed();
      }
      throw DefaultException();
    }
    return null;
  }

  Future<CurrentUser?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return await _addDataToUserProfile(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw UserAlreadyExistsError();
      } else if (e.code == 'network-request-failed') {
        throw NetworkRequestFailed();
      }
      throw DefaultException();
    }
  }

  Future<CurrentUser?> signInWithGoogleAccount(
      AuthCredential credential) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return await _addDataToUserProfile(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw NetworkRequestFailed();
      }
      throw DefaultException();
    }
  }

  Future<CurrentUser?> signInWithGitHubAccount(
      AuthProvider githubProvider) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithProvider(githubProvider);

      return await _addDataToUserProfile(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw NetworkRequestFailed();
      }
      throw DefaultException();
    }
  }

  Future<CurrentUser?> _addDataToUserProfile(User? firebaseUser) async {
    if (firebaseUser == null) return null;

    String userId = firebaseUser.uid;

    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Users');

    DocumentReference userDocRef = usersCollection.doc(userId);

    Map<String, dynamic> userData = {
      'email': firebaseUser.email,
      'userName': firebaseUser.displayName,
      'isConnectWithGoogleFit': false,
      'defaultReps': 8,
      'defaultSets': 3,
      'unitSystem': 'cm/kg',
    };

    await userDocRef.set(userData);

    return CurrentUser(
      userId: firebaseUser.uid,
      email: firebaseUser.email ?? '',
    );
  }

  ///signOutUser
  Future<void> signOutUser() async {
    try {
      final googleSignIn = GoogleSignIn();

      if (googleSignIn.currentUser != null) {
        await googleSignIn.signOut();
      }

      try {
        await googleSignIn.disconnect();
      } catch (e) {
        print('Failed to disconnect on signout: $e');
      }

      final firebaseAuth = FirebaseAuth.instance;
      if (firebaseAuth.currentUser != null) {
        await firebaseAuth.signOut();
      }
    } catch (e) {
      print('Error during sign out: $e');
    }
  }
}
