import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:workify/controllers/authServices.dart';
import 'package:workify/theme/theme.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({Key? key}) : super(key: key);

  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  //! set this to false if you want to scan in barcodes.
  bool debug = true;

  ProductResult? productResult;
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Map nutrientsScoreColor = {
    'a': Colors.green,
    'b': Colors.green.shade200,
    'c': Colors.yellow.shade200,
    'd': Colors.yellow,
    'e': Colors.red,
  };

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

  List<Color> novaScoreColor = [
    Colors.green,
    Colors.green.shade400,
    Colors.yellow.shade400,
    Colors.red,
  ];
  List<Color> goodBadScore = [Colors.red, Colors.green];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: SlidingUpPanel(
          maxHeight: MediaQuery.of(context).size.height * .7,
          minHeight: AppBar().preferredSize.height + 10,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0),
          ),
          panel: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: productResult != null
                ? Column(
                    children: [
                      //! slide up indicator!
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
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, .25),
                                    blurRadius: 16.0)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        productResult!.product!.productName.toString(),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .65,
                        child: Scrollbar(
                          child: ListView(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 30, 30, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    productScoreCircle(
                                      score:
                                          productResult!.product!.ecoscoreScore,
                                      scoreTitle: 'Eco\nScore',
                                      color: Colors.green,
                                    ),
                                    productScoreCircle(
                                      score: productResult!.product!.nutriscore,
                                      scoreTitle: 'Nutrients\nScore',
                                      color: nutrientsScoreColor[
                                          productResult!.product!.nutriscore],
                                    ),
                                    productScoreCircle(
                                      score: productResult!
                                          .product!.nutriments!.novaGroup,
                                      scoreTitle: 'Processed\nScore',
                                      color: novaScoreColor[productResult!
                                              .product!.nutriments!.novaGroup! -
                                          1],
                                    ),
                                    productScoreCircle(
                                      score: productResult!
                                                  .product!
                                                  .ingredientsAnalysisTags!
                                                  .veganStatus ==
                                              'VeganStatus: isTrue'
                                          ? 'Y'
                                          : 'N',
                                      scoreTitle: 'Vegan\nStatus',
                                      color: goodBadScore[productResult!
                                                  .product!
                                                  .ingredientsAnalysisTags!
                                                  .veganStatus ==
                                              'VeganStatus: isTrue'
                                          ? 1
                                          : 0],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 10),
                                  Text('Nutrition facts'),
                                  DataTable(
                                    sortColumnIndex: 0,
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                        'Nutrition Facts',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Per serving',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                    ],
                                    rows: [
                                      DataRow(
                                        cells: [
                                          DataCell(Text('Calories')),
                                          DataCell(Text(
                                              '${(productResult!.product!.nutriments!.energyServing! / 4.2).round()}.0 g')),
                                        ],
                                      ),
                                      DataRow(
                                        cells: [
                                          DataCell(Text('Fat')),
                                          DataCell(Text(
                                              '${productResult!.product!.nutriments!.fatServing} g')),
                                        ],
                                      ),
                                      DataRow(
                                        cells: [
                                          DataCell(Text('Saturated Fat')),
                                          DataCell(Text(
                                              '${productResult!.product!.nutriments!.saturatedFatServing} g')),
                                        ],
                                      ),
                                      DataRow(
                                        cells: [
                                          DataCell(Text('Carbs')),
                                          DataCell(Text(
                                              '${productResult!.product!.nutriments!.carbohydratesServing} g')),
                                        ],
                                      ),
                                      DataRow(
                                        cells: [
                                          DataCell(Text('| - Sugars')),
                                          DataCell(Text(
                                              '${productResult!.product!.nutriments!.sugarsServing} g')),
                                        ],
                                      ),
                                      DataRow(
                                        cells: [
                                          DataCell(Text('Protein')),
                                          DataCell(Text(
                                              '${productResult!.product!.nutriments!.proteinsServing} g')),
                                        ],
                                      ),
                                      DataRow(
                                        cells: [
                                          DataCell(Text('Caffine')),
                                          DataCell(Text(
                                              '${productResult!.product!.nutriments!.caffeineServing} g')),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Text('Images'),
                              ),
                              productResult!.product!.images == null
                                  ? Text('No images to display')
                                  : Container(
                                      height: 200,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext ctx, int index) {
                                          return Container(
                                            padding: EdgeInsets.all(5),
                                            height: 180,
                                            width: 180,
                                            child: Image.network(
                                              productResult!
                                                  .product!.images![index].url!,
                                              fit: BoxFit.contain,
                                            ),
                                          );
                                        },
                                        itemCount: productResult!
                                            .product!.images!.length,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
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
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, .25),
                                    blurRadius: 16.0)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('Scan In a Product Barcode'),
                    ],
                  ),
          ),
          body: _buildQrView(context),
        ));
  }

  Column productScoreCircle(
      {score: String, scoreTitle: String, color: Colors}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: score == null
              ? Text(
                  '?',
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  '${score}',
                  style: TextStyle(color: Colors.white),
                ),
        ),
        SizedBox(height: 5),
        Text(
          scoreTitle,
          textScaleFactor: .8,
        )
      ],
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
    //getProductResult(qrCode: 'asfd');

    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
        getProductResult(qrCode: scanData.code);
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
    String resultString = result!.code.toString();
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
