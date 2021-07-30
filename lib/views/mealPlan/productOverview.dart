import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/model/NutrientLevels.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:workify/theme/theme.dart';

class ProductOverView extends StatelessWidget {
  final Product product;
  const ProductOverView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map nutrientsScoreColor = {
      'a': Colors.green,
      'b': Colors.green.shade200,
      'c': Colors.yellow.shade600,
      'd': Colors.orange,
      'e': Colors.red,
    };
    return DefaultTabController(
      length: 4,
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
                        text: product.nutriments!.energyServing != null ? '${product.nutriments!.energyServing}' : '?',
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
              Tab(
                text: 'Enviroment',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Chip(
                          backgroundColor: Apptheme.mainCardColor,
                          avatar: CircleAvatar(
                            backgroundColor: nutrientsScoreColor[product.nutriscore],
                            child: Text(
                              product.nutriscore != null ? '${product.nutriscore!.toUpperCase()}' : '?',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              width: 1,
                              color: product.nutriscore != null ? nutrientsScoreColor[product.nutriscore] : Colors.grey,
                            ),
                          ),
                          label: Text(
                            'Nutrition Score',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1, color: Colors.grey),
                    SizedBox(height: 8),
                    Text(
                      'Nutrients Levels per 100 g/100 mL',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: product.nutrientLevels!.levels.entries.map(
                        (e) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: nutrientsLevelsChip(label: e.key, value: e.value),
                          );
                        },
                      ).toList(),
                    ),
                    SizedBox(height: 8),
                    Divider(height: 1, color: Colors.grey),
                    Padding(
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
                          label: Text('Per Serving'),
                        ),
                        DataColumn(
                          label: Text('Per Serving'),
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
                Container(
                  child: Text('data'),
                ),
                Container(
                  child: Text('data'),
                ),
                Container(
                  child: Text('data'),
                ),
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
  final Level value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsLevelColor = {
      Level.LOW: Colors.green,
      Level.MODERATE: Colors.orange,
      Level.HIGH: Colors.red,
      Level.UNDEFINED: Colors.grey,
    };
    Map nutrientsLevelIcons = {
      Level.LOW: LineIcons.check,
      Level.MODERATE: LineIcons.exclamation,
      Level.HIGH: LineIcons.skull,
      Level.UNDEFINED: LineIcons.question,
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
        '${label} - ${value.value.toUpperCase()}',
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
