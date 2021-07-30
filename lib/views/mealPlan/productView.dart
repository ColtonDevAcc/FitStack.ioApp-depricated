import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:workify/theme/theme.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(LineIcons.arrowLeft, color: Colors.black),
        ),
        backgroundColor: Apptheme.mainCardColor,
        title: Text(
          product.productName!,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
