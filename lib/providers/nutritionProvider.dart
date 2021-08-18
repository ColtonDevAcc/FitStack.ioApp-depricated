import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/QueryType.dart';

class NutritionState with ChangeNotifier {
  final nutritionProductCatalogStreamProvider = StreamProvider.autoDispose(
    (ref) async* {
      final channel = await OpenFoodAPIClient.searchProducts(
        User(userId: 'cbristow99@gmail.com', password: 'Colton99'),
        ProductSearchQueryConfiguration(
          language: OpenFoodFactsLanguage.ENGLISH,
          parametersList: [],
          fields: [
            ProductField.NUTRIMENTS,
            ProductField.NAME,
            ProductField.BARCODE,
            ProductField.IMAGE_FRONT_SMALL_URL,
            ProductField.NUTRISCORE,
            ProductField.SERVING_SIZE,
          ],
        ),
        queryType: QueryType.PROD,
      );
    },
  );

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
