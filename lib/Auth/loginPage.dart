import 'package:easyride/constant/Navigation.dart';
import 'package:easyride/constant/constant.dart';
import 'package:easyride/views/newAccountPage.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  // LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _dropdownCountry = '+91';
  TextEditingController _phoneNoController = new TextEditingController();
  String otp = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    print(screenHeight);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.08,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10, bottom: 12),
                  child: Text(
                    "Hello!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        letterSpacing: 4),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Welcome to Easy Ride",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          letterSpacing: 4)),
                ),
                SizedBox(
                  height: screenHeight / 3.2,
                ),
                Container(
                  height: screenHeight / 2.1,
                  width: screenWidth,
                  child: Image(
                    image: AssetImage('assets/images/tuk-tuk.png'),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  // Color(0xFF9E7501),
                  Colors.amber,
                  Colors.amber,
                  // Color(0xFFD6B65D),
                ])),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              height: screenHeight / 1.8,
              child: base(screenWidth, screenHeight),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenHeight * 0.04),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container base(double screenWidth, double screenHeight) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: Text(
              'Please Enter your mobile number',
              style: upperStyleText,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            width: screenWidth / 2, //200
            height: screenHeight * 0.05, //32
            child: Text(
              'You will receive a 6 digit code to verify next.',
              style: lowerStyleText,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: screenHeight * 0.08,
            width: double.infinity,
            margin: EdgeInsets.only(
                left: screenWidth * 0.08,
                right: screenWidth * 0.08,
                top: screenWidth * 0.05,
                bottom: screenWidth * 0.05),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CountryCodePicker(
                    initialSelection: "+91",
                    showDropDownButton: true,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _phoneNoController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Colors.black26,
                              letterSpacing: 2.2,
                              fontWeight: FontWeight.w500),
                          hintText: 'Mobile Number'),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          ),
          ButtonTheme(
            child: ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (_phoneNoController.text.length != 10) {
                  Fluttertoast.showToast(msg: 'Invalid Mobile Number');
                  return;
                }
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        OtpVerifactionAlert(context));
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
                'CONTINUE',
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
    );
  }

  OtpVerifactionAlert(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    // String otp = "";
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      insetPadding: EdgeInsets.all(_width * 0.04),
      child: Container(
          height: _height / 1.9,
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
                height: 28,
                child: Text(
                  'Code is sent to ${_dropdownCountry + _phoneNoController.text}',
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
                  setState(() {
                    otp = value;
                  });
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
                    print(otp);
                    if (otp.length != 6) {
                      Fluttertoast.showToast(msg: 'Invalid OTP');
                      return;
                    }
                    print('done');
                    Navigator.push(
                        context, SlideRightRoute(page: newUserDetailsForm()));
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
}
