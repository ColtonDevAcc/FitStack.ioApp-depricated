import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/model/EnvironmentImpactLevels.dart';
import 'package:openfoodfacts/model/IngredientsAnalysisTags.dart';
import 'package:openfoodfacts/model/NutrientLevels.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:workify/theme/theme.dart';

import '_widgets/productResultView/productresultCips.dart';

class ProductDetails_View extends StatelessWidget {
  final Product product;
  const ProductDetails_View({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          //! slide up indicator!
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                child: SizedBox(height: 5),
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16.0)],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            product.productName != null ? '${product.productName}' : 'could not load name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            //! this displays the top 4 important Nutrients information
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Calories\n',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: product.nutriments!.energyServing != null
                            ? '${(product.nutriments!.energyServing! / 4.2).round()}'
                            : '?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Carbs\n',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: product.nutriments!.carbohydratesServing != null
                            ? '${product.nutriments!.carbohydratesServing}'
                            : '?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Protein\n',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: product.nutriments!.proteinsServing != null
                            ? '${product.nutriments!.proteinsServing}'
                            : '?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Fiber\n',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: product.nutriments!.fiberServing != null
                            ? '${product.nutriments!.fiberServing}'
                            : '?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            labelColor: Colors.black,
            unselectedLabelStyle: TextStyle(color: Colors.black),
            tabs: [
              Tab(
                text: 'Nutrition',
              ),
              Tab(
                text: 'Overview',
              ),
              Tab(
                text: 'Ingredients',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        alignment: WrapAlignment.center,
                        children: [
                          product.ingredientsAnalysisTags!.veganStatus != null
                              ? VeganStatusChip(
                                  label: 'Vegan Status',
                                  value: product.ingredientsAnalysisTags!.veganStatus)
                              : Text('Vegan information unavaliable'),
                          NutritionSCoreChip(
                              label: 'Nutrition Score', value: '${product.nutriscore}'),
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
                                  label: '${e.key} - ${e.value.value.toUpperCase()}',
                                  value: e.value),
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
                    DataTable(
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
                    ),
                  ],
                ),
                ListView(
                  children: [
                    Center(
                        child: Text('Ingredients Analysis',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        alignment: WrapAlignment.center,
                        children: [
                          VeganStatusChip(
                              label: 'Vegan Status',
                              value: product.ingredientsAnalysisTags!.veganStatus),
                          NutritionSCoreChip(
                              label: 'Nutrition Score',
                              value: '${product.nutriscore!.toLowerCase()}'),
                          PalmOilStatusChip(
                              label: 'Palm Oil Free?',
                              value: product.ingredientsAnalysisTags!.palmOilFreeStatus),
                          VegetarianStatusChip(
                              label: 'Vegetarian Status',
                              value: product.ingredientsAnalysisTags!.vegetarianStatus),
                          NovaGroupChip(
                              label: 'Proccesed Score', value: product.nutriments!.novaGroup),
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
                        child: Text('Enviroment Impact Level',
                            style: TextStyle(fontWeight: FontWeight.bold))),
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
                                EnviromentStatusChip(
                                    label: 'Envrioment Impact Level', value: 'unknown'),
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
                      children: product.categoriesTags!
                          .asMap()
                          .entries
                          .map((e) => Text('${e.value}, '))
                          .toList(),
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
                ),
                ListView(
                  children: [
                    product.imageIngredientsUrl != null
                        ? Image(
                            image: NetworkImage(product.imageIngredientsUrl!),
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'No image to display for ingredients',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                    NovaGroupChip(
                      label: 'Proccesed Score',
                      value: product.nutriments!.novaGroup,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(height: 1, color: Colors.grey),
                    ),
                    Center(
                        child: Text('List of ingredients',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: product.ingredients!
                          .map(
                            (e) => Text('${e.text}, '),
                          )
                          .toList(),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
