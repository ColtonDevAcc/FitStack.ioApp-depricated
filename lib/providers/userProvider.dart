import 'package:flutter/material.dart';
import 'package:workify/models/user.dart';

class UserProvider with ChangeNotifier {
  String? userName = '';
  String? firstName = '';
  String? lastName = '';
  String? nationality = '';
  String? email = '';
  bool? admin = false;
  double? height = 23;
  int? age = 0;
  String? gender = '';
  double? weight = 0;
  String? mainWorkoutGoal = '';
  String? workoutFrequency = '';
  String? workoutExperiencelevel = '';
  List? tags = [];

  get getWorkoutExperiencelevel => workoutExperiencelevel;
  get getWorkoutFrequency => workoutFrequency;
  get getMainWorkoutGoal => getMainWorkoutGoal;
  get getWeight => weight;
  get getGender => gender;
  get getAge => age;
  get getHeight => height;
  get getAdmin => admin;
  get getEmail => email;
  get getNationality => nationality;
  get getLastName => lastName;
  get getFirstName => firstName;
  get getUserName => userName;

  setUserModel({firebaseUserSnapShot: Map}) {
    FirebaseUser user = FirebaseUser.fromMap(firebaseUserSnapShot);

    try {
      this.lastName = user.lastName;
      this.firstName = user.firstName;
      this.age = user.age;
      this.admin = user.admin;
      this.userName = user.userName;
      this.nationality = user.nationality;
      this.email = user.email;
      this.height = user.height;
      this.weight = user.weight;
      this.mainWorkoutGoal = user.mainWorkoutGoal;
      this.workoutFrequency = user.workoutFrequency;
      this.workoutExperiencelevel = user.workoutExperiencelevel;
    } catch (e) {
      print(e);
    }
  }
}
