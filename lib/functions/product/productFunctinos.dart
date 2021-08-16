import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:openfoodfacts/model/ProductResult.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/ProductQueryConfigurations.dart';
import 'package:workify/services/authServices.dart';

Future<ProductResult?> GetProductResult({qrCode: String, onSuccess: Function}) async {
  log('starting ===================== OPENAPITRACK');
  String resultString = qrCode;
  var newProductResult = await OpenFoodAPIClient.getProduct(ProductQueryConfiguration(resultString,
      language: OpenFoodFactsLanguage.ENGLISH, fields: [ProductField.ALL]));

  log('ending ===================== OPENAPITRACK');

  if (newProductResult == 1) {
    return newProductResult;
  } else {
    onSuccess;
    return newProductResult;
  }
}

sendProductResults({productResult: Product}) async {
  await FirebaseFirestore.instance
      .collection('UserInfo')
      .doc(AuthServices.userUID)
      .collection('UserAddedProduct')
      .doc(productResult!.product!.productName)
      .set(productResult!.product!.toData())
      .then(
        (value) => FirebaseFirestore.instance
            .collection('UserInfo')
            .doc(AuthServices.userUID)
            .collection('UserAddedProduct')
            .doc(productResult!.product!.productName)
            .update(productResult!.product!.nutriments!.toData()),
      );
}
