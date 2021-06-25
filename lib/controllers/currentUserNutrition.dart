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

  final currentUserGender;

  CurrentUserNutrition(this.currentUserGender) {
    calcUserRecommendedNutrientsForWeightGain();
    calcUserRecommendedVitaminAIntake();
    calcUserRecommendedVitaminCIntake();
    userRecommendedVitaminEIntake = 15;
    userRecommendedVitaminDIntake = 175;
  }

  double calcUserRecommendedNutrientsForWeightGain({userGender: String}) {
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

  void calcUserRecommendedVitaminCIntake() {
    int x = CurrentUser.age!;

    if (x > 14 && CurrentUser.gender == 'Male' && x < 19) {
      userRecommendedVitaminCIntake = 70;
    } else if (x > 18 && CurrentUser.gender == 'Female') {
      userRecommendedVitaminCIntake = 75;
    } else if (x > 18 && CurrentUser.gender == 'Male') {
      userRecommendedVitaminCIntake = 90;
    }
  }

  void calcUserRecommendedVitaminAIntake() {
    int x = CurrentUser.age!;

    if (x > 14 && CurrentUser.gender == 'Male') {
      userRecommendedVitaminAIntake = 900;
    } else if (x > 14 && CurrentUser.gender == 'Female') {
      userRecommendedVitaminAIntake = 700;
    }
  }

  double calculateUserWorkoutActivityFactor() {
    double userWorkoutActivityFactor = 1.0;
    int x = CurrentUser.workoutFrequency!;

    if (x == 0) {
      return userWorkoutActivityFactor = 1.2;
    } else if (x > 0 && x < 3) {
      return userWorkoutActivityFactor = 1.375;
    } else if (x > 2 && x < 5) {
      return userWorkoutActivityFactor = 1.55;
    } else if (x > 4 && x < 7) {
      return userWorkoutActivityFactor = 1.725;
    } else if (x > 6 && x < 9) {
      return userWorkoutActivityFactor = 1.9;
    }

    return userWorkoutActivityFactor;
  }
}

//prot calc
//protein https://www.acsm.org/docs/default-source/files-for-resource-library/protein-intake-for-optimal-muscle-maintenance.pdf

//cal calc
//https://www.checkyourhealth.org/eat-healthy/cal_calculator.php

// switch (CurrentUser.workoutFrequency) {
//       case 0:
//         {
//           userWorkoutActivityFactor = 1.2;
//         }
//         break;
//       case 0 <:
//         {
//           userWorkoutActivityFactor = 1.375;
//         }
//         break;
//       case 2:
//         {
//           userWorkoutActivityFactor = 1.375;
//         }
//         break;
//       case 3:
//         {
//           userWorkoutActivityFactor = 1.55;
//         }
//         break;
//       case 4:
//         {
//           userWorkoutActivityFactor = 1.55;
//         }
//         break;
//       case 5:
//         {
//           userWorkoutActivityFactor = 1.725;
//         }
//         break;
//       case 6:
//         {
//           userWorkoutActivityFactor = 1.725;
//         }
//         break;
//       case 7:
//         {
//           userWorkoutActivityFactor = 1.9;
//         }
//         break;
//     }