import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easyride/Map.dart';
import 'package:easyride/views/QrCodeGen.dart';
import 'package:flutter/material.dart';

class homePageForAutoDriver extends StatefulWidget {
  // homePage({Key? key}) : super(key: key);

  @override
  _homePageForAutoDriverState createState() => _homePageForAutoDriverState();
}

class _homePageForAutoDriverState extends State<homePageForAutoDriver> {
  int index = 1;
  final screens = [
    Container(),
    mapforuser(),
    qrCodeGenerator(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Easy Ride',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1)),
        actions: [
          IconButton(
              icon: Icon(Icons.person_outline_rounded, color: Colors.white),
              onPressed: () {})
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.amber,
        index: index,
        backgroundColor: Colors.transparent,
        onTap: (int index) {
          // handle index
          setState(() {
            this.index = index;
          });
        },
        items: [
          Icon(Icons.wallet_membership,
              semanticLabel: "Money", color: Colors.white),
          Icon(
            Icons.person_pin_circle_outlined,
            color: Colors.white,
          ),
          Icon(Icons.qr_code_outlined, color: Colors.white)
        ],
      ),
      body: screens[index],
    );
  }
}
