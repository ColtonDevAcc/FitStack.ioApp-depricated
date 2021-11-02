import 'package:flutter/material.dart';
import 'package:openfoodfacts/model/Product.dart';
import 'productresultCips.dart';

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
                label: 'Vegan Status',
                value: product.ingredientsAnalysisTags != null
                    ? product.ingredientsAnalysisTags!.veganStatus
                    : null,
              ),
              NutritionSCoreChip(
                  label: 'Nutrition Score',
                  value:
                      '${product.nutriscore != null ? product.nutriscore!.toLowerCase() : 'null'}'),
              PalmOilStatusChip(
                label: 'Palm Oil Free?',
                value: product.ingredientsAnalysisTags != null
                    ? product.ingredientsAnalysisTags!.palmOilFreeStatus
                    : null,
              ),
              VegetarianStatusChip(
                label: 'Vegetarian Status',
                value: product.ingredientsAnalysisTags != null
                    ? product.ingredientsAnalysisTags!.vegetarianStatus
                    : null,
              ),
              NovaGroupChip(
                label: 'Proccesed Score',
                value: product.nutriments != null ? product.nutriments!.novaGroup : null,
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Colors.grey),
        Center(child: Text('Addatives', style: TextStyle(fontWeight: FontWeight.bold))),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          runSpacing: 5,
          children: product.additives != null
              ? product.additives!.names.map(
                  (e) {
                    return Chip(
                      backgroundColor: Colors.red,
                      label: Text(
                        e,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ).toList()
              : [
                  Text('no info to display'),
                ],
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
          children: product.categoriesTags != null
              ? product.categoriesTags!.asMap().entries.map((e) => Text('${e.value}, ')).toList()
              : [
                  Text('no info to display'),
                ],
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
