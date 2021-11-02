import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import '../_widgets/productResultView/productNutritionTab.dart';
import '../_widgets/productResultView/productOverviewTab.dart';

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
                ProductNutritionTab(product: product),
                ProductOverViewTab(product: product),
                ProductNutritionTab(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
