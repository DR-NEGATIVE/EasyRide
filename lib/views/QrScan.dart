import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  // homePageForUser({Key? key}) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final qrkey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  Barcode barcode;
  bool flashStatus = true;
  bool qrOpen = false;
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            buildQrView(context),
            SizedBox(
              height: 10,
            ),
            Positioned(
              child: QrBar(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrkey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderLength: 20,
          borderWidth: 10,
          borderRadius: 10,
          borderColor: Colors.amber,
          cutOutSize: MediaQuery.of(context).size.width * 0.8),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((event) {
      setState(() {
        this.barcode = event;
        // fluttevent.code
        controller.stopCamera();
        Fluttertoast.showToast(msg: event.code.toString());
      });
    });
  }

  QrBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              flashStatus ? Icons.flash_on : Icons.flash_off,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                controller.toggleFlash();
                flashStatus = !flashStatus;
              });
            },
          ),
          Text(
            'Easy Ride',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          IconButton(
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  // Container qrOpenStatus(var context) {
  //   var screenWidth = MediaQuery.of(context).size.width;
  //   var screenHeight = MediaQuery.of(context).size.height;
  //   return Container(
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             height: screenHeight / 4,
  //             child: Image(
  //               image: AssetImage('assets/images/qrScan.png'),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 18,
  //           ),
  //           ButtonTheme(
  //             child: ElevatedButton(
  //               onPressed: () {
  //                 setState(() {
  //                   qrOpen = true;
  //                 });
  //               },
  //               style: ButtonStyle(
  //                 padding: MaterialStateProperty.all(EdgeInsets.only(
  //                   top: 0,
  //                 )),
  //                 minimumSize: MaterialStateProperty.all(
  //                     Size(screenWidth * 0.84, screenHeight * 0.08)),
  //                 backgroundColor: MaterialStateProperty.all(Colors.amber),
  //               ),
  //               child: Text(
  //                 'Open Qr Scanner ',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w700,
  //                     fontFamily: 'QuickSand',
  //                     letterSpacing: 1.2),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
