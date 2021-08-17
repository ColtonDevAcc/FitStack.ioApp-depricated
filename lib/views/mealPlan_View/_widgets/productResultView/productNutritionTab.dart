import 'package:flutter/material.dart';
import 'package:openfoodfacts/model/Product.dart';
import 'package:workify/views/mealPlan_View/_widgets/productResultView/productNutritionLabel.dart';
import 'package:workify/views/mealPlan_View/_widgets/productResultView/productresultCips.dart';

class ProductNutritionTab extends StatelessWidget {
  final Product product;
  const ProductNutritionTab({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 15,
            runSpacing: 5,
            alignment: WrapAlignment.center,
            children: [
              product.ingredientsAnalysisTags != null
                  ? VeganStatusChip(
                      label: 'Vegan Status', value: product.ingredientsAnalysisTags!.veganStatus)
                  : Text('Vegan information unavaliable'),
              NutritionSCoreChip(label: 'Nutrition Score', value: '${product.nutriscore}'),
            ],
          ),
        ),
        Divider(height: 1, color: Colors.grey),
        SizedBox(height: 8),
        Center(
          child: Text(
            'Nutrients Levels per 100 g/100 mL',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            alignment: WrapAlignment.center,
            children: product.nutrientLevels!.levels.entries.map(
              (e) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: NutrientsLevelsChip(
                    label: '${e.key} - ${e.value}',
                    value: e.value,
                  ),
                );
              },
            ).toList(),
          ),
        ),
        SizedBox(height: 8),
        Divider(height: 1, color: Colors.grey),
        product.imageNutritionUrl != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1.91 / .6,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      product.imageNutritionUrl.toString(),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'No images to display for nutrition label',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
        Center(
          child: Text(
            'Per Serving: ${product.servingSize}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ProductNutritionLabel(product: product),
      ],
    );
  }
}
