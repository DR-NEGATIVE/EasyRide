import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';

var lowerStyleText = TextStyle(
    fontFamily: 'QuickSand',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xFF6A6C7B));
var upperStyleText = TextStyle(
    fontFamily: 'QuickSand',
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 20);
var dropdownStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'QuickSand',
    fontWeight: FontWeight.w400,
    fontSize: 16);
var dropdownStyleNew = TextStyle(
    color: Colors.black12,
    fontFamily: 'QuickSand',
    fontWeight: FontWeight.w400,
    fontSize: 16);
OtpVerifactionAlert(BuildContext context) {
  double _height = MediaQuery.of(context).size.height;
  double _width = MediaQuery.of(context).size.width;
  String otp = "";
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    insetPadding: EdgeInsets.all(_width * 0.04),
    child: Container(
        height: _height / 2,
        width: _width,
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              height: _height / 8,
              child: Image(
                image: AssetImage('assets/images/password.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: Text(
                'OTP Verification',
                style: upperStyleText,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: 200,
              height: 28,
              child: Text(
                'Code is sent to +919876543210',
                style: lowerStyleText,
                textAlign: TextAlign.center,
              ),
            ),
            PinCodeTextField(
              length: 6,
              appContext: context,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(3),
                inactiveFillColor: Colors.amber,
                selectedFillColor: Colors.amber,
                activeColor: Colors.amber,
                inactiveColor: Colors.white,
                selectedColor: Colors.amber,
                activeFillColor: Colors.white,
              ),
              enableActiveFill: true,
              onChanged: (String value) {
                // print(otpController);
                otp = value;
                print(otp);
              },
            ),
            Container(
                margin: EdgeInsets.all(8),
                child: RichText(
                    text: TextSpan(
                        text: 'Didn’t receive the code? ',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            letterSpacing: 1.5,
                            fontSize: 14,
                            color: Colors.black26,
                            fontWeight: FontWeight.w400),
                        children: [
                      TextSpan(
                          text: 'Request Again',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ))
                    ]))),
            ButtonTheme(
              child: ElevatedButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (otp.length != 6) {
                    print(otp);
                    Fluttertoast.showToast(msg: 'Invalid OTP');
                    return;
                  }
                  // if (_controller.text.length != 10) {
                  //   print('Invalid No');
                  //   Fluttertoast.showToast(msg: 'invalid PhoneNo');

                  //   return;
                  // }
                  // DataBase().loginUser(
                  //     _dropdownCountry + _controller.text, context);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                    top: 0,
                  )),
                  minimumSize: MaterialStateProperty.all(
                      Size(_width * 0.84, _height * 0.08)),
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
                child: Text(
                  'Verify & Proceed',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'QuickSand',
                      letterSpacing: 1),
                ),
              ),
            ),
          ],
        )),
  );
}
