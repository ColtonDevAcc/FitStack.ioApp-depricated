import 'dart:convert';

import 'package:openfoodfacts/model/Nutriments.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class UserAddedMealEntry {
  final String barcode;
  final Nutriments nutrients;
  final String productName;
  final Product product;

  UserAddedMealEntry(
    this.barcode,
    this.nutrients,
    this.productName,
    this.product,
  );

  UserAddedMealEntry copyWith({
    String? barcode,
    Nutriments? nutrients,
    String? productName,
    Product? product,
  }) {
    return UserAddedMealEntry(
      barcode ?? this.barcode,
      nutrients ?? this.nutrients,
      productName ?? this.productName,
      product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'barcode': barcode,
      'nutrients': nutrients.toData(),
      'productName': productName,
      'product': product.toData(),
    };
  }

  factory UserAddedMealEntry.fromMap(Map<String, dynamic> map) {
    return UserAddedMealEntry(
      map['barcode'],
      Nutriments.fromJson(map['nutrients']),
      map['productName'],
      Product.fromJson(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddedMealEntry.fromJson(String source) =>
      UserAddedMealEntry.fromMap(json.decode(source));
}
