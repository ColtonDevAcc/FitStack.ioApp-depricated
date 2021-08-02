import 'package:flutter/material.dart';

class NutritionState with ChangeNotifier {
  double _calories = 0;
  double _fibers = 0;
  double _carbs = 0;
  double _proteins = 0;
  double _sugars = 0;
  double _caffine = 0;

  double get Fiber => this._fibers;
  double get Carbs => this._carbs;
  double get Proteins => this._proteins;
  double get Sugars => this._sugars;
  double get Calories => this._calories;
  double get Caffine => this._caffine;

  set Caffine(double newValue) {
    _caffine = newValue;
    notifyListeners();
  }

  set Calories(double newValue) {
    _calories = newValue;
    notifyListeners();
  }

  set Sugars(double newValue) {
    _sugars = newValue;
    notifyListeners();
  }

  set Proteins(double newValue) {
    _proteins = newValue;
    notifyListeners();
  }

  set Carbs(double newValue) {
    _carbs = newValue;
    notifyListeners();
  }

  set Fiber(double newValue) {
    _fibers = newValue;
    notifyListeners();
  }
}
