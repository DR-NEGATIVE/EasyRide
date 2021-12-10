import 'package:easyride/constant/Navigation.dart';
import 'package:easyride/views/homaPageForAutoDriver.dart';
import 'package:easyride/views/homePageForUser.dart';
import 'package:flutter/material.dart';

class tempNav extends StatelessWidget {
  // const tempNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, SlideRightRoute(page: homePageForUser()));
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
                  'User View',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'QuickSand',
                      letterSpacing: 1.2),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ButtonTheme(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, SlideRightRoute(page: homePageForAutoDriver()));
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
                  'Driver View',
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
