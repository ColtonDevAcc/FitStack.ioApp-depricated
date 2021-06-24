import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:workify/controllers/currentUser.dart';

class AuthServices extends ChangeNotifier {
  bool userLoggedIn = false;
  static String? userUID;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthServices(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({email: String, password: String}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      userLoggedIn = true;
      userUID = _firebaseAuth.currentUser!.uid;
      await getUserInfo(userUID: userUID);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      userLoggedIn = false;
      print(e);
      return 'Not Signed In';
    }
  }

  Future<String> signUp({email: String, password: String}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      userLoggedIn = true;
      userUID = _firebaseAuth.currentUser!.uid;
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message.toString();
    }
  }

  Future<void> getUserInfo({userUID: String}) async {
    print('START');
    print('User ID == $userUID');
    await FirebaseFirestore.instance
        .collection('UserInfo')
        .doc(userUID)
        .get()
        .then((value) {
      CurrentUser.userName = value.data()!['userName'];
      CurrentUser.firstName = value.data()!['firstName'];
      CurrentUser.lastName = value.data()!['lastName'];
      CurrentUser.nationality = value.data()!['nationality'];
      CurrentUser.email = value.data()!['email'];
      CurrentUser.admin = value.data()!['admin'];
      CurrentUser.height = value.data()!['height'];
      CurrentUser.age = value.data()!['age'];
      CurrentUser.weight = value.data()!['weight'];
      CurrentUser.mainWorkoutGoal = value.data()!['mainWorkoutGoal'];
      CurrentUser.workoutFrequency = value.data()!['workoutFrequency'];
      CurrentUser.workoutExperiencelevel =
          value.data()!['workoutExperiencelevel'];
    });
    print('END');
  }
}
