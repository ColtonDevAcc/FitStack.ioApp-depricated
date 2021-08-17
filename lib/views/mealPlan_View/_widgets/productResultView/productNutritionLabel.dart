import 'package:flutter/material.dart';
import 'package:openfoodfacts/model/Product.dart';

class ProductNutritionLabel extends StatelessWidget {
  const ProductNutritionLabel({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(
          label: Text(
            'Raw Nutrition Labels',
            style: TextStyle(color: Colors.black),
          ),
        ),
        DataColumn(
          label: Text(
            'Raw Nutrition Data',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
      rows: product.nutriments!.toData().entries.map(
        (e) {
          return DataRow(
            cells: [
              DataCell(
                Text(
                  e.key,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              DataCell(
                Text(
                  e.value,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
