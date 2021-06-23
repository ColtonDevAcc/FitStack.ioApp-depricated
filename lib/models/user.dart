class User {
  String? userID;
  String? userName;
  String? firstName;
  String? lastName;
  double? heightInches;
  String? nationality;
  String? email;
  bool? admin;
  double? height;
  int? age;
  double? weight;
  String? mainWorkoutGoal;
  int? workoutFrequency;
  String? workoutExperiencelevel;

  User(this.nationality, this.userID, this.admin, this.email, this.firstName,
      this.heightInches, this.lastName, this.userName);

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'userName': userName,
        'firstName': firstName,
        'lastName': lastName,
        'heightInches': heightInches,
        'nationality': nationality,
        'email': email,
        'admin': admin,
      };
}
