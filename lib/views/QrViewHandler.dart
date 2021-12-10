import 'package:easyride/constant/Navigation.dart';
import 'package:easyride/views/QrScan.dart';
import 'package:flutter/material.dart';

class qrViewHandler extends StatefulWidget {
  // qrViewHandler({Key? key}) : super(key: key);

  @override
  _qrViewHandlerState createState() => _qrViewHandlerState();
}

class _qrViewHandlerState extends State<qrViewHandler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: qrOpenStatus(context));
  }

  Container qrOpenStatus(var context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenHeight / 4,
              child: Image(
                image: AssetImage('assets/images/qrScan.png'),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            ButtonTheme(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, SlideRightRoute(page: QrScanner()));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                    top: 0,
                  )),
                  minimumSize: MaterialStateProperty.all(
                      Size(screenWidth * 0.84, screenHeight * 0.08)),
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
                child: Text(
                  'Open Qr Scanner ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'QuickSand',
                      letterSpacing: 1.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
