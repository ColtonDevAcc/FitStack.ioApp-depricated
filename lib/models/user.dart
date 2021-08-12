import 'dart:convert';

class FirebaseUser {
  String userName;
  String firstName;
  String lastName;
  String nationality;
  String email;
  bool admin;
  double height;
  int age;
  String gender;
  double weight;
  String mainWorkoutGoal;
  String workoutFrequency;
  String workoutExperiencelevel;
  List? tags = [];

  FirebaseUser({
    required this.gender,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.nationality,
    required this.email,
    required this.admin,
    required this.height,
    required this.age,
    required this.weight,
    required this.mainWorkoutGoal,
    required this.workoutFrequency,
    required this.workoutExperiencelevel,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'tags': tags,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'nationality': nationality,
      'email': email,
      'gender': gender,
      'admin': admin,
      'height': height,
      'age': age,
      'weight': weight,
      'mainWorkoutGoal': mainWorkoutGoal,
      'workoutFrequency': workoutFrequency,
      'workoutExperiencelevel': workoutExperiencelevel,
    };
  }

  factory FirebaseUser.fromMap(Map<dynamic, dynamic> map) {
    return FirebaseUser(
      tags: map['tags'],
      userName: map['userName'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      nationality: map['nationality'],
      email: map['email'],
      admin: map['admin'],
      height: map['height'],
      age: map['age'],
      weight: map['weight'],
      mainWorkoutGoal: map['mainWorkoutGoal'],
      workoutFrequency: map['workoutFrequency'],
      workoutExperiencelevel: map['workoutExperiencelevel'],
      gender: map['gender'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseUser.fromJson(String source) => FirebaseUser.fromMap(json.decode(source));
}
