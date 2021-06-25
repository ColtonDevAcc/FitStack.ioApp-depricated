import 'dart:convert';

class UserNutrition {
  final double userCurrentCalorieIntake;
  final double userCurrentProteinIntake;
  final double userCurrentVitaminAIntake;
  final double userCurrentVitaminCIntake;
  final double userCurrentVitaminDIntake;
  final double userCurrentVitaminEIntake;

  final double userRecommendedCalorieIntake;
  final double userRecommendedProteinIntake;
  final double userRecommendedVitaminAIntake;
  final double userRecommendedVitaminCIntake;
  final double userRecommendedVitaminDIntake;
  final double userRecommendedVitaminEIntake;

  UserNutrition(
    this.userCurrentCalorieIntake,
    this.userCurrentProteinIntake,
    this.userCurrentVitaminAIntake,
    this.userCurrentVitaminCIntake,
    this.userCurrentVitaminDIntake,
    this.userCurrentVitaminEIntake,
    this.userRecommendedCalorieIntake,
    this.userRecommendedProteinIntake,
    this.userRecommendedVitaminAIntake,
    this.userRecommendedVitaminCIntake,
    this.userRecommendedVitaminDIntake,
    this.userRecommendedVitaminEIntake,
  );

  Map<String, dynamic> toMap() {
    return {
      'userCurrentCalorieIntake': userCurrentCalorieIntake,
      'userCurrentProteinIntake': userCurrentProteinIntake,
      'userCurrentVitaminAIntake': userCurrentVitaminAIntake,
      'userCurrentVitaminCIntake': userCurrentVitaminCIntake,
      'userCurrentVitaminDIntake': userCurrentVitaminDIntake,
      'userCurrentVitaminEIntake': userCurrentVitaminEIntake,
      'userRecommendedCalorieIntake': userRecommendedCalorieIntake,
      'userRecommendedProteinIntake': userRecommendedProteinIntake,
      'userRecommendedVitaminAIntake': userRecommendedVitaminAIntake,
      'userRecommendedVitaminCIntake': userRecommendedVitaminCIntake,
      'userRecommendedVitaminDIntake': userRecommendedVitaminDIntake,
      'userRecommendedVitaminEIntake': userRecommendedVitaminEIntake,
    };
  }

  factory UserNutrition.fromMap(Map<String, dynamic> map) {
    return UserNutrition(
      map['userCurrentCalorieIntake'],
      map['userCurrentProteinIntake'],
      map['userCurrentVitaminAIntake'],
      map['userCurrentVitaminCIntake'],
      map['userCurrentVitaminDIntake'],
      map['userCurrentVitaminEIntake'],
      map['userRecommendedCalorieIntake'],
      map['userRecommendedProteinIntake'],
      map['userRecommendedVitaminAIntake'],
      map['userRecommendedVitaminCIntake'],
      map['userRecommendedVitaminDIntake'],
      map['userRecommendedVitaminEIntake'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserNutrition.fromJson(String source) =>
      UserNutrition.fromMap(json.decode(source));
}

//protein https://www.acsm.org/docs/default-source/files-for-resource-library/protein-intake-for-optimal-muscle-maintenance.pdf

//cal calc
//https://www.checkyourhealth.org/eat-healthy/cal_calculator.php