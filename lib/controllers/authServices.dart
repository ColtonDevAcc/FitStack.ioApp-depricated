import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:workify/controllers/currentUser.dart';
import 'package:workify/controllers/currentUserNutrition.dart';
import 'package:workify/models/userAddWorkout.dart';
import 'package:workify/models/userAddWorkoutDetails.dart';

class AuthServices extends ChangeNotifier {
  bool userLoggedIn = false;
  static String? userUID;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthServices(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({email: String, password: String}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      userLoggedIn = true;
      userUID = _firebaseAuth.currentUser!.uid;
      await getUserInfo(userUID: userUID);
      logInTask();
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      userLoggedIn = false;
      print(e);
      return 'Not Signed In';
    }
  }

  Future<String> signUp({email: String, password: String}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
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
    await FirebaseFirestore.instance.collection('UserInfo').doc(userUID).get().then((value) {
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
      CurrentUser.friends = value.data()!['friends'];
      CurrentUser.workoutExperiencelevel = value.data()!['workoutExperiencelevel'];
    });
    print('END');
  }

  static Future<String> addUserWorkout({
    workoutType: String,
    workoutTitle: String,
    workoutDescription: String,
    workoutTags: List,
  }) async {
    try {
      UserAddWorkout newUserWorkout = UserAddWorkout(
        workoutTitle,
        workoutDescription,
        workoutType,
        workoutTags,
      );

      await FirebaseFirestore.instance
          .collection('UserInfo')
          .doc(AuthServices.userUID)
          .collection('UserAddedWorkout')
          .doc(workoutTitle)
          .set(newUserWorkout.toMap());
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  static Future<String> addUserWorkoutDetails({workoutCategoryTitle: String}) async {
    try {
      print('Start 2');
      UserAddWorkoutDetails addUserWorkoutDetails =
          UserAddWorkoutDetails(workoutCategoryTitle: workoutCategoryTitle);

      await FirebaseFirestore.instance
          .collection('UserInfo')
          .doc(AuthServices.userUID)
          .collection('UserAddedWorkout')
          .doc(workoutCategoryTitle)
          .collection('UserAddedWorkoutDetails')
          .doc()
          .set(addUserWorkoutDetails.toMap());
      print('End 2');
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}

void logInTask() {
  CurrentUserNutrition(CurrentUser.gender);
  print(CurrentUser.gender);
}
