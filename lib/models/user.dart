class User {
  String? userID;
  String? userName;
  String? firstName;
  String? lastName;
  double? heightInches;
  String? nationality;
  String? email;
  bool? admin;

  User(this.nationality);

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
