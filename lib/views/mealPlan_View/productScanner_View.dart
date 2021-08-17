import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/model/IngredientsAnalysisTags.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'productDetails_View.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({Key? key}) : super(key: key);

  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  //! set this to false if you want to scan in barcodes.
  bool debug = true;

  Map veganScore = {
    VeganStatus.VEGAN: "Vegan",
    VeganStatus.MAYBE_VEGAN: "Maybe",
    VeganStatus.NON_VEGAN: "Non-Vegan",
    VeganStatus.VEGAN_STATUS_UNKNOWN: "Unknown",
  };
  IconData cameraState = LineIcons.pause;

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
      body: SlidingUpPanel(
        maxHeight: MediaQuery.of(context).size.height * .7,
        minHeight: AppBar().preferredSize.height + 10,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
        panel: productResult != null
            ? ProductDetails_View(product: productResult!.product!)
            : Column(
                children: [
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
                          boxShadow: [
                            BoxShadow(color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16.0)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Scan In a Product Barcode'),
                ],
              ),
        body: _buildQrView(context),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea =
        (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400)
            ? 150.0
            : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: scanArea),
            onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      LineIcons.times,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          await controller?.pauseCamera();
                          if (cameraState == LineIcons.pause) {
                            await controller?.pauseCamera();
                            setState(() {
                              controller!.pauseCamera();
                              cameraState = LineIcons.play;
                            });
                          } else {
                            await controller?.pauseCamera();
                            setState(() {
                              controller!.resumeCamera();
                              cameraState = LineIcons.pause;
                            });
                          }
                        },
                        child: Icon(
                          cameraState,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          LineIcons.heart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          LineIcons.plus,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onQRViewCreated(QRViewController controller) async {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() async {
        controller.pauseCamera();
        cameraState = LineIcons.play;
        // productResult = await GetProductResult(qrCode: scanData.code); //use scanData.code
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
