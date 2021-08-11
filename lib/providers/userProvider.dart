import 'dart:convert';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final String userName;
  final String firstName;
  final String lastName;
  final String nationality;
  final String email;
  final bool? admin;
  final double? height;
  final int? age;
  final String? gender;
  final double? weight;
  final String? mainWorkoutGoal;
  final int? workoutFrequency;
  final String? workoutExperiencelevel;
  final List<String>? friendsList;

  UserProvider(
      this.userName,
      this.firstName,
      this.lastName,
      this.nationality,
      this.email,
      this.admin,
      this.height,
      this.age,
      this.gender,
      this.weight,
      this.mainWorkoutGoal,
      this.workoutFrequency,
      this.workoutExperiencelevel,
      this.friendsList);

  get getFriendsList => friendsList;
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

  UserProvider copyWith({
    String? userName,
    String? firstName,
    String? lastName,
    String? nationality,
    String? email,
    bool? admin,
    double? height,
    int? age,
    String? gender,
    double? weight,
    String? mainWorkoutGoal,
    int? workoutFrequency,
    String? workoutExperiencelevel,
    List<String>? friendsList,
  }) {
    return UserProvider(
      userName ?? this.userName,
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      nationality ?? this.nationality,
      email ?? this.email,
      admin ?? this.admin,
      height ?? this.height,
      age ?? this.age,
      gender ?? this.gender,
      weight ?? this.weight,
      mainWorkoutGoal ?? this.mainWorkoutGoal,
      workoutFrequency ?? this.workoutFrequency,
      workoutExperiencelevel ?? this.workoutExperiencelevel,
      friendsList ?? this.friendsList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'nationality': nationality,
      'email': email,
      'admin': admin,
      'height': height,
      'age': age,
      'gender': gender,
      'weight': weight,
      'mainWorkoutGoal': mainWorkoutGoal,
      'workoutFrequency': workoutFrequency,
      'workoutExperiencelevel': workoutExperiencelevel,
      'friendsList': friendsList,
    };
  }

  factory UserProvider.fromMap(Map<String, dynamic> map) {
    return UserProvider(
      map['userName'],
      map['firstName'],
      map['lastName'],
      map['nationality'],
      map['email'],
      map['admin'],
      map['height'],
      map['age'],
      map['gender'],
      map['weight'],
      map['mainWorkoutGoal'],
      map['workoutFrequency'],
      map['workoutExperiencelevel'],
      List<String>.from(map['friendsList']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProvider.fromJson(String source) => UserProvider.fromMap(json.decode(source));
}
