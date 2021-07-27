import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:workify/controllers/authServices.dart';
import 'package:workify/theme/theme.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({Key? key}) : super(key: key);

  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  ProductResult? productResult;
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            getProductResult(qrCode: 'todo'); //! pass qr result code

            showBottomSheet(
                context: context,
                builder: (context) {
                  Map nutrientsToGet = {
                    'Sodium':
                        productResult!.product!.nutriments!.sodium.toString(),
                    'Saturated Fat': productResult!
                        .product!.nutriments!.saturatedFat
                        .toString(),
                    'Sugars':
                        productResult!.product!.nutriments!.sugars.toString(),
                    'Salts': productResult!.product!.nutriments!.salt.toString()
                  };

                  Map nutrientScoreColor = {
                    'a': Colors.green,
                    'b': Colors.green.shade600,
                    'c': Colors.yellow,
                    'd': Colors.orange.shade400,
                    'e': Colors.red
                  };

                  return Container(
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(LineIcons.arrowDown,
                                    color: Colors.black),
                              ),
                              Text(
                                productResult!.product!.brands.toString() +
                                    ": " +
                                    productResult!.product!.productName
                                        .toString()
                                        .toUpperCase(),
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                  color: Apptheme.mainButonColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10)
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: NetworkImage(
                                      productResult!.product!.imageFrontSmallUrl
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: nutrientScoreColor[
                                          productResult!.product!.nutriscore],
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Nutrients Score',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          productResult!.product!.nutriscore
                                              .toString()
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              child: Container(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Text('Addatives'),
                          Container(
                            height: productResult!
                                    .product!.additives!.names.length
                                    .toDouble() *
                                18,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.zero,
                              itemCount: productResult!
                                  .product!.additives!.names.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Text(
                                      productResult!
                                          .product!.additives!.names[index],
                                      style: TextStyle(
                                        color: Apptheme.secondaryAccent,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              child: Container(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Text('Nutrient Levels per 100 g/100ml'),
                          Container(
                            height: MediaQuery.of(context).size.height * .215,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.zero,
                              itemCount: 26,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Text(
                                      productResult!.product!.nutriments!
                                          .toData()
                                          .entries
                                          .map((e) => '${e.key}: ${e.value}')
                                          .toList()[index],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Apptheme.mainCardColor,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                tooltip: 'Search',
                icon: const Icon(
                  LineIcons.lightningBolt,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                },
                tooltip: 'Favorite',
                icon: const Icon(
                  Icons.flip_camera_ios,
                  color: Colors.black,
                ),
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: const Icon(
                  LineIcons.pause,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              productResult == null
                  ? Text('Scan the product barcode')
                  : Text(
                      'Product Name: ' +
                          productResult!.product!.productName.toString(),
                    ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'QR CODE SCANNER',
          style: TextStyle(
            color: Apptheme.mainButonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            LineIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        backgroundColor: Apptheme.mainCardColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: _buildQrView(context),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  Future<ProductResult?> getProductResult({qrCode: String}) async {
    log('starting ===================== OPENAPITRACK');
    String resultString =
        '01223004'; //! TODO: change this to result!.code.toString()
    var newProductResult = await OpenFoodAPIClient.getProduct(
        ProductQueryConfiguration(resultString,
            language: OpenFoodFactsLanguage.ENGLISH,
            fields: [ProductField.ALL]));

    log('ending ===================== OPENAPITRACK');

    if (newProductResult == 1) {
      print("Error retreiving the product : ${productResult!.status}");
      return newProductResult;
    } else {
      setState(() {
        productResult = newProductResult;
      });
      sendProductResults();
      return newProductResult;
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  sendProductResults() async {
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
}
