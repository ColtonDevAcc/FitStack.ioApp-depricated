import 'package:workify/controllers/currentUser.dart';

class CurrentUserNutrition {
  static double? userCurrentCalorieIntake;
  static double? userCurrentProteinIntake;
  static double? userCurrentVitaminAIntake;
  static double? userCurrentVitaminCIntake;
  static double? serCurrentVitaminDIntake;
  static double? userCurrentVitaminEIntake;

  static double? userRecommendedCalorieIntake;
  static double? userRecommendedProteinIntake;
  static double? userRecommendedVitaminAIntake;
  static double? userRecommendedVitaminCIntake;
  static double? userRecommendedVitaminDIntake;
  static double? userRecommendedVitaminEIntake;

  double calculateNutrientsForWeightGain({userGender: String}) {
    double userWorkoutActivityFactor = calculateUserWorkoutActivityFactor();

    if (CurrentUser.gender == 'Male') {
      print('Male');
      return userRecommendedCalorieIntake = 66 +
          (6.3 * CurrentUser.weight!.toDouble()) +
          (12.9 * CurrentUser.height!.toDouble()) -
          (6.8 * CurrentUser.age!.toDouble()) * userWorkoutActivityFactor;
    } else {
      print('Female');
      return userRecommendedCalorieIntake = 66 +
          (4.3 * CurrentUser.weight!.toDouble()) +
          (4.7 * CurrentUser.height!.toDouble()) -
          (4.7 * CurrentUser.age!.toDouble()) * userWorkoutActivityFactor;
    }
  }

  void calculateNutrientsForMuscleGain() {}

  void calculateNutrientsForWeighLoss() {}

  void calculateNutrientsForStrength() {}

  void calculateNutrientsFor() {}

  static double calculateUserWorkoutActivityFactor() {
    double? userWorkoutActivityFactor;

    switch (CurrentUser.workoutFrequency) {
      case 0:
        {
          userWorkoutActivityFactor = 1.2;
        }
        break;
      case 1:
        {
          userWorkoutActivityFactor = 1.375;
        }
        break;
      case 2:
        {
          userWorkoutActivityFactor = 1.375;
        }
        break;
      case 3:
        {
          userWorkoutActivityFactor = 1.55;
        }
        break;
      case 4:
        {
          userWorkoutActivityFactor = 1.55;
        }
        break;
      case 5:
        {
          userWorkoutActivityFactor = 1.725;
        }
        break;
      case 6:
        {
          userWorkoutActivityFactor = 1.725;
        }
        break;
      case 7:
        {
          userWorkoutActivityFactor = 1.9;
        }
        break;
    }
    return userWorkoutActivityFactor!;
  }
}

//prot calc
//protein https://www.acsm.org/docs/default-source/files-for-resource-library/protein-intake-for-optimal-muscle-maintenance.pdf

//cal calc
//https://www.checkyourhealth.org/eat-healthy/cal_calculator.php