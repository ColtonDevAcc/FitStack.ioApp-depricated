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
  double weight;
  String mainWorkoutGoal;
  int workoutFrequency;
  String workoutExperiencelevel;
  FirebaseUser({
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
  });

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
      'weight': weight,
      'mainWorkoutGoal': mainWorkoutGoal,
      'workoutFrequency': workoutFrequency,
      'workoutExperiencelevel': workoutExperiencelevel,
    };
  }

  factory FirebaseUser.fromMap(Map<String, dynamic> map) {
    return FirebaseUser(
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
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseUser.fromJson(String source) =>
      FirebaseUser.fromMap(json.decode(source));
}

//  Map<String, dynamic> toJson() => {
//       'userName': userName,
//       'firstName': firstName,
//       'lastName': lastName,
//       'heightInches': height,
//       'nationality': nationality,
//       'email': email,
//       'admin': admin,
//     };
