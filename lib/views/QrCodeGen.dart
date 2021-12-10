import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrCodeGenerator extends StatefulWidget {
  @override
  _qrCodeGeneratorState createState() => _qrCodeGeneratorState();
}

class _qrCodeGeneratorState extends State<qrCodeGenerator> {
  TextEditingController textEditingController = TextEditingController();
  String qr = "EasyRide/AnyUniqueHashCode";
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: qr,
              version: QrVersions.auto,
              size: 200.0,
            ),
            Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Testing Purpose Gen QR',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    margin: EdgeInsets.only(
                      bottom: screenHeight * 0.01,
                      left: screenWidth * 0.08,
                      right: screenWidth * 0.08,
                    )),
                Container(
                    padding: EdgeInsets.all(2),
                    width: double.infinity,
                    child: TextFormField(
                      controller: textEditingController,
                      style: TextStyle(fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.qr_code),
                          hintStyle: TextStyle(
                              color: Colors.black26,
                              letterSpacing: 1.6,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          hintText: 'Write String'),
                    ),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    margin: EdgeInsets.only(
                        left: screenWidth * 0.08,
                        right: screenWidth * 0.08,
                        bottom: screenWidth * 0.05))
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              height: screenHeight * 0.08,
              color: Colors.white,
              child: ButtonTheme(
                child: ElevatedButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    setState(() {
                      qr = textEditingController.text.toString();
                    });
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
                    'Generate Qr',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'QuickSand',
                        letterSpacing: 1.2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
