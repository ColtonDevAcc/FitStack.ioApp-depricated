import 'dart:convert';

class UserAddWorkout {
  final String userAddedWorkoutTitle;
  final String userAddedWorkoutDescription;
  final String userAddedWorkoutType;
  final List userAddedWorkoutTags;

  UserAddWorkout(this.userAddedWorkoutTitle, this.userAddedWorkoutDescription,
      this.userAddedWorkoutType, this.userAddedWorkoutTags);

  Map<String, dynamic> toMap() {
    return {
      'userAddedWorkoutTitle': userAddedWorkoutTitle,
      'userAddedWorkoutDescription': userAddedWorkoutDescription,
      'userAddedWorkoutType': userAddedWorkoutType,
      'userAddedWorkoutTags': userAddedWorkoutTags,
    };
  }

  factory UserAddWorkout.fromMap(Map<String, dynamic> map) {
    return UserAddWorkout(
      map['userAddedWorkoutTitle'],
      map['userAddedWorkoutDescription'],
      map['userAddedWorkoutType'],
      List.from(map['userAddedWorkoutTags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddWorkout.fromJson(String source) =>
      UserAddWorkout.fromMap(json.decode(source));
}
