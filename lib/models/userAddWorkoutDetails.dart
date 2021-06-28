import 'dart:convert';

class UserAddWorkoutDetails {
  final String workoutCategoryTitle;

  UserAddWorkoutDetails({required this.workoutCategoryTitle});

  Map<String, dynamic> toMap() {
    return {
      'workoutCategoryTitle': workoutCategoryTitle,
    };
  }

  factory UserAddWorkoutDetails.fromMap(Map<String, dynamic> map) {
    return UserAddWorkoutDetails(
      workoutCategoryTitle: map['workoutCategoryTitle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddWorkoutDetails.fromJson(String source) =>
      UserAddWorkoutDetails.fromMap(json.decode(source));
}
