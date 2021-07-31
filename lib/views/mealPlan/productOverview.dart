import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/model/EnvironmentImpactLevels.dart';
import 'package:openfoodfacts/model/IngredientsAnalysisTags.dart';
import 'package:openfoodfacts/model/NutrientLevels.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:workify/theme/theme.dart';

class ProductOverView extends StatelessWidget {
  final Product product;
  const ProductOverView({Key? key, required this.product}) : super(key: key);

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
                        text: product.nutriments!.energyServing != null ? '${(product.nutriments!.energyServing! / 4.2).round()}' : '?',
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
                        text: product.nutriments!.carbohydratesServing != null ? '${product.nutriments!.carbohydratesServing}' : '?',
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
                        text: product.nutriments!.proteinsServing != null ? '${product.nutriments!.proteinsServing}' : '?',
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
                        text: product.nutriments!.fiberServing != null ? '${product.nutriments!.fiberServing}' : '?',
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
                              ? veganStatusChip(label: 'Vegan Status', value: product.ingredientsAnalysisTags!.veganStatus)
                              : Text('Vegan information unavaliable'),
                          nutritionSCoreChip(label: 'Nutrition Score', value: '${product.nutriscore}'),
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
                              child: nutrientsLevelsChip(label: '${e.key} - ${e.value.value.toUpperCase()}', value: e.value),
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
                    Center(child: Text('Ingredients Analysis', style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        alignment: WrapAlignment.center,
                        children: [
                          veganStatusChip(label: 'Vegan Status', value: product.ingredientsAnalysisTags!.veganStatus),
                          nutritionSCoreChip(label: 'Nutrition Score', value: '${product.nutriscore!.toLowerCase()}'),
                          palmOilStatusChip(label: 'Palm Oil Free?', value: product.ingredientsAnalysisTags!.palmOilFreeStatus),
                          vegetarianStatusChip(label: 'Vegetarian Status', value: product.ingredientsAnalysisTags!.vegetarianStatus),
                          novaGroupChip(label: 'Proccesed Score', value: product.nutriments!.novaGroup),
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
                    Center(child: Text('Enviroment Impact Level', style: TextStyle(fontWeight: FontWeight.bold))),
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
                                enviromentStatusChip(label: 'Envrioment Impact Level', value: 'unknown'),
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
                      children: product.categoriesTags!.asMap().entries.map((e) => Text('${e.value}, ')).toList(),
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
                    novaGroupChip(
                      label: 'Proccesed Score',
                      value: product.nutriments!.novaGroup,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(height: 1, color: Colors.grey),
                    ),
                    Center(child: Text('List of ingredients', style: TextStyle(fontWeight: FontWeight.bold))),
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

class nutrientsLevelsChip extends StatelessWidget {
  const nutrientsLevelsChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final Level? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsLevelColor = {
      Level.LOW: Colors.green,
      Level.MODERATE: Colors.orange,
      Level.HIGH: Colors.red,
      Level.UNDEFINED: Colors.grey,
      null: Colors.grey,
    };
    Map nutrientsLevelIcons = {
      Level.LOW: LineIcons.check,
      Level.MODERATE: LineIcons.exclamation,
      Level.HIGH: LineIcons.skull,
      Level.UNDEFINED: LineIcons.question,
      null: LineIcons.question,
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsLevelColor[value],
        child: Icon(
          nutrientsLevelIcons[value],
          color: Colors.white,
          size: 20,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsLevelColor[value],
        ),
      ),
    );
  }
}

class veganStatusChip extends StatelessWidget {
  const veganStatusChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final VeganStatus? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsLevelColor = {
      VeganStatus.VEGAN: Colors.green,
      VeganStatus.MAYBE_VEGAN: Colors.orange,
      VeganStatus.NON_VEGAN: Colors.red,
      VeganStatus.VEGAN_STATUS_UNKNOWN: Colors.grey,
      null: Colors.grey,
    };
    Map nutrientsLevelIcons = {
      VeganStatus.VEGAN: LineIcons.check,
      VeganStatus.MAYBE_VEGAN: LineIcons.exclamation,
      VeganStatus.NON_VEGAN: LineIcons.skull,
      VeganStatus.VEGAN_STATUS_UNKNOWN: LineIcons.question,
      null: LineIcons.question,
    };
    Map veganStatusLabel = {
      VeganStatus.VEGAN: 'Vegan',
      VeganStatus.MAYBE_VEGAN: 'Maybe Vegan',
      VeganStatus.NON_VEGAN: 'Non-Vegan',
      VeganStatus.VEGAN_STATUS_UNKNOWN: 'Uknown',
      null: 'Uknown',
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsLevelColor[value],
        child: Icon(
          nutrientsLevelIcons[value],
          color: Colors.white,
          size: 20,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${veganStatusLabel[value]}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsLevelColor[value],
        ),
      ),
    );
  }
}

class nutritionSCoreChip extends StatelessWidget {
  const nutritionSCoreChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsScoreColor = {
      'a': Colors.green,
      'b': Colors.green.shade200,
      'c': Colors.yellow.shade600,
      'd': Colors.orange,
      'e': Colors.red,
      null: Colors.grey,
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsScoreColor[value],
        child: Text(
          '${value!.toUpperCase()}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${value!.toUpperCase()}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsScoreColor[value],
        ),
      ),
    );
  }
}

class palmOilStatusChip extends StatelessWidget {
  const palmOilStatusChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final PalmOilFreeStatus? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsScoreColor = {
      PalmOilFreeStatus.PALM_OIL_FREE: Colors.green,
      PalmOilFreeStatus.MAY_CONTAIN_PALM_OIL: Colors.orange,
      PalmOilFreeStatus.PALM_OIL: Colors.red,
      PalmOilFreeStatus.PALM_OIL_CONTENT_UNKNOWN: Colors.grey,
      null: Colors.grey,
    };

    Map palmOilLabel = {
      PalmOilFreeStatus.PALM_OIL_FREE: 'Palm Oil Free',
      PalmOilFreeStatus.MAY_CONTAIN_PALM_OIL: 'May Contain Palm Oil',
      PalmOilFreeStatus.PALM_OIL: 'Contains Palm Oil',
      PalmOilFreeStatus.PALM_OIL_CONTENT_UNKNOWN: 'Unknown',
      Null: 'Unknown',
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsScoreColor[value],
        child: Icon(
          LineIcons.paw,
          color: Colors.white,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${palmOilLabel[value].toString().toUpperCase()}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsScoreColor[value],
        ),
      ),
    );
  }
}

class vegetarianStatusChip extends StatelessWidget {
  const vegetarianStatusChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final VegetarianStatus? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsScoreColor = {
      VegetarianStatus.VEGETARIAN: Colors.green,
      VegetarianStatus.MAYBE_VEGETARIAN: Colors.orange,
      VegetarianStatus.NON_VEGETARIAN: Colors.red,
      VegetarianStatus.VEGETARIAN_STATUS_UNKNOWN: Colors.grey,
      null: Colors.grey,
    };

    Map palmOilLabel = {
      VegetarianStatus.VEGETARIAN: 'Vegetarian',
      VegetarianStatus.MAYBE_VEGETARIAN: 'Maybe Vegetarian',
      VegetarianStatus.NON_VEGETARIAN: 'Non-Vegetarian',
      VegetarianStatus.VEGETARIAN_STATUS_UNKNOWN: 'Unknown',
      null: 'Unknown',
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsScoreColor[value],
        child: Icon(
          LineIcons.egg,
          size: 18,
          color: Colors.white,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${palmOilLabel[value].toString().toUpperCase()}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsScoreColor[value],
        ),
      ),
    );
  }
}

class enviromentStatusChip extends StatelessWidget {
  const enviromentStatusChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsScoreColor = {
      EnvironmentImpactLevels: Colors.green,
      VegetarianStatus.MAYBE_VEGETARIAN: Colors.orange,
      VegetarianStatus.NON_VEGETARIAN: Colors.red,
      'unknown': Colors.grey,
      null: Colors.grey,
    };

    Map palmOilLabel = {
      VegetarianStatus.VEGETARIAN: 'Vegetarian',
      VegetarianStatus.MAYBE_VEGETARIAN: 'Maybe Vegetarian',
      VegetarianStatus.NON_VEGETARIAN: 'Non-Vegetarian',
      VegetarianStatus.VEGETARIAN_STATUS_UNKNOWN: 'Unknown',
      null: 'Unknown',
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsScoreColor[value],
        child: Icon(
          LineIcons.leaf,
          color: Colors.white,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${value}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsScoreColor[value],
        ),
      ),
    );
  }
}

class novaGroupChip extends StatelessWidget {
  const novaGroupChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final int? value;

  @override
  Widget build(BuildContext context) {
    List nutrientsScoreColor = [
      Colors.green,
      Colors.green.shade300,
      Colors.orange,
      Colors.red,
    ];

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: value != null ? nutrientsScoreColor[value! - 1] : Colors.grey,
        child: Icon(
          LineIcons.heartAlt,
          size: 15,
          color: Colors.white,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${value}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsScoreColor[value! - 1],
        ),
      ),
    );
  }
}
