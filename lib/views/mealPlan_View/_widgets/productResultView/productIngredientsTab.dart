import 'package:flutter/material.dart';
import 'package:openfoodfacts/model/Product.dart';
import 'productresultCips.dart';

class ProductIngredientsTab extends StatelessWidget {
  final Product product;
  const ProductIngredientsTab({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}
