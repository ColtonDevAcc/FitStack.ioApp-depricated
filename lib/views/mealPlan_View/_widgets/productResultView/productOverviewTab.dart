import 'package:flutter/material.dart';
import 'package:openfoodfacts/model/Product.dart';
import 'package:workify/views/mealPlan_View/_widgets/productResultView/productresultCips.dart';

class ProductOverViewTab extends StatelessWidget {
  final Product product;
  const ProductOverViewTab({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(child: Text('Ingredients Analysis', style: TextStyle(fontWeight: FontWeight.bold))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            alignment: WrapAlignment.center,
            children: [
              VeganStatusChip(
                  label: 'Vegan Status', value: product.ingredientsAnalysisTags!.veganStatus),
              NutritionSCoreChip(
                  label: 'Nutrition Score', value: '${product.nutriscore!.toLowerCase()}'),
              PalmOilStatusChip(
                  label: 'Palm Oil Free?',
                  value: product.ingredientsAnalysisTags!.palmOilFreeStatus),
              VegetarianStatusChip(
                  label: 'Vegetarian Status',
                  value: product.ingredientsAnalysisTags!.vegetarianStatus),
              NovaGroupChip(label: 'Proccesed Score', value: product.nutriments!.novaGroup),
            ],
          ),
        ),
        Divider(height: 1, color: Colors.grey),
        Center(child: Text('Addatives', style: TextStyle(fontWeight: FontWeight.bold))),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          runSpacing: 5,
          children: product.additives!.names.map(
            (e) {
              return Chip(
                backgroundColor: Colors.red,
                label: Text(
                  e,
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ).toList(),
        ),
        Divider(height: 1, color: Colors.grey),
        Center(
            child: Text('Enviroment Impact Level', style: TextStyle(fontWeight: FontWeight.bold))),
        SizedBox(height: 8),
        Wrap(
            spacing: 5,
            runSpacing: 5,
            alignment: WrapAlignment.center,
            children: product.environmentImpactLevels != null
                ? product.environmentImpactLevels!.levels.asMap().entries.map(
                    (e) {
                      return Text('null');
                    },
                  ).toList()
                : [
                    EnviromentStatusChip(label: 'Envrioment Impact Level', value: 'unknown'),
                  ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Divider(height: 1, color: Colors.grey),
        ),
        Center(
            child: Text(
          'Category Tags',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        Wrap(
          alignment: WrapAlignment.center,
          children:
              product.categoriesTags!.asMap().entries.map((e) => Text('${e.value}, ')).toList(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Divider(height: 1, color: Colors.grey),
        ),
        Center(
          child: Text(
            'Barcode:\n${product.barcode}',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
