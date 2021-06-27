import 'dart:convert';

class UserAddedMealEntry {
  final String mealTitle;
  final int mealCalories;
  final int mealTransFat;
  final int mealCholesterol;
  final int mealSodium;
  final int mealTotalCarbs;
  final int mealProtein;
  final int mealVitaminA;
  final int mealVitaminC;
  final int mealCalcium;
  final int mealIron;

  UserAddedMealEntry(
      this.mealCalories,
      this.mealTransFat,
      this.mealCholesterol,
      this.mealSodium,
      this.mealTotalCarbs,
      this.mealProtein,
      this.mealVitaminA,
      this.mealVitaminC,
      this.mealCalcium,
      this.mealIron,
      this.mealTitle);

  Map<String, dynamic> toMap() {
    return {
      'mealTitle': mealTitle,
      'mealCalories': mealCalories,
      'mealTransFat': mealTransFat,
      'mealCholesterol': mealCholesterol,
      'mealSodium': mealSodium,
      'mealTotalCarbs': mealTotalCarbs,
      'mealProtein': mealProtein,
      'mealVitaminA': mealVitaminA,
      'mealVitaminC': mealVitaminC,
      'mealCalcium': mealCalcium,
      'mealIron': mealIron,
    };
  }

  factory UserAddedMealEntry.fromMap(Map<String, dynamic> map) {
    return UserAddedMealEntry(
      map['mealTitle'],
      map['mealCalories'],
      map['mealTransFat'],
      map['mealCholesterol'],
      map['mealSodium'],
      map['mealTotalCarbs'],
      map['mealProtein'],
      map['mealVitaminA'],
      map['mealVitaminC'],
      map['mealCalcium'],
      map['mealIron'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddedMealEntry.fromJson(String source) =>
      UserAddedMealEntry.fromMap(json.decode(source));
}
