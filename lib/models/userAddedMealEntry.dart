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
  final String mealEntryCreationDateTime;

  UserAddedMealEntry({
    required this.mealCalories,
    required this.mealTransFat,
    required this.mealCholesterol,
    required this.mealSodium,
    required this.mealTotalCarbs,
    required this.mealProtein,
    required this.mealVitaminA,
    required this.mealVitaminC,
    required this.mealCalcium,
    required this.mealIron,
    required this.mealTitle,
    required this.mealEntryCreationDateTime,
  });

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
      'mealEntryCreationDateTime': mealEntryCreationDateTime,
    };
  }

  factory UserAddedMealEntry.fromMap(Map<String, dynamic> map) {
    return UserAddedMealEntry(
      mealTitle: map['mealTitle'],
      mealCalories: map['mealCalories'],
      mealTransFat: map['mealTransFat'],
      mealCholesterol: map['mealCholesterol'],
      mealSodium: map['mealSodium'],
      mealTotalCarbs: map['mealTotalCarbs'],
      mealProtein: map['mealProtein'],
      mealVitaminA: map['mealVitaminA'],
      mealVitaminC: map['mealVitaminC'],
      mealCalcium: map['mealCalcium'],
      mealIron: map['mealIron'],
      mealEntryCreationDateTime: map['mealEntryCreationDateTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddedMealEntry.fromJson(String source) =>
      UserAddedMealEntry.fromMap(json.decode(source));
}
