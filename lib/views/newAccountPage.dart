import 'package:easyride/constant/Navigation.dart';
import 'package:easyride/constant/tempNav.dart';
import 'package:flutter/material.dart';

class newUserDetailsForm extends StatefulWidget {
  @override
  _newUserDetailsFormState createState() => _newUserDetailsFormState();
}

class _newUserDetailsFormState extends State<newUserDetailsForm> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.amber, Colors.white]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenHeight / 4.5,
              width: screenWidth / 4.5,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            Container(
              width: screenWidth,
              height: screenHeight / 1.6,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.06),
                child: ListView(
                  children: [
                    EntityBlock(screenHeight, screenWidth, 'Full Name',
                        Icons.edit, 'John Doe'),
                    EntityBlock(screenHeight, screenWidth, 'Email', Icons.email,
                        'Negative@email.com'),
                    EntityBlock(screenHeight, screenWidth, 'Adress',
                        Icons.place, '3rd House from Railway'),
                    EntityBlock(screenHeight, screenWidth, 'Pincode',
                        Icons.pin_drop_outlined, '281401'),
                    EntityBlock(screenHeight, screenWidth, 'Country',
                        Icons.flag, 'India'),
                    EntityBlock(screenHeight, screenWidth, 'State', Icons.map,
                        'Uttar Pradesh'),
                    EntityBlock(screenHeight, screenWidth, 'City',
                        Icons.map_outlined, 'Agra')
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.1),
                      topRight: Radius.circular(screenWidth * 0.1))),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              height: screenHeight * 0.08,
              color: Colors.white,
              child: ButtonTheme(
                child: ElevatedButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.push(context, SlideRightRoute(page: tempNav()));
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
            ),
          ],
        ),
      ),
    );
  }

  Column EntityBlock(double screenHeight, double screenWidth, String entName,
      var icon, var hintText) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              '$entName',
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
              style: TextStyle(fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(icon),
                  hintStyle: TextStyle(
                      color: Colors.black26,
                      letterSpacing: 1.6,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  hintText: '$hintText'),
            ),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            margin: EdgeInsets.only(
                left: screenWidth * 0.08,
                right: screenWidth * 0.08,
                bottom: screenWidth * 0.05))
      ],
    );
  }
}
