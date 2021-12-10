import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easyride/Map.dart';
import 'package:easyride/views/QrScan.dart';
import 'package:easyride/views/QrViewHandler.dart';
import 'package:flutter/material.dart';

class homePageForUser extends StatefulWidget {
  // homePageForUser({Key? key}) : super(key: key);

  @override
  _homePageForUserState createState() => _homePageForUserState();
}

class _homePageForUserState extends State<homePageForUser> {
  int index = 1;
  final userScreen = [
    mapforuser(),
    qrViewHandler(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Easy Ride',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1)),
      ),
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.amber,
        index: index,
        backgroundColor: Colors.transparent,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        items: [
          Icon(
            Icons.person_pin_circle_outlined,
            color: Colors.white,
          ),
          Icon(Icons.qr_code, semanticLabel: "Money", color: Colors.white),
          Icon(Icons.drive_eta_sharp, color: Colors.white)
        ],
      ),
      body: userScreen[index],
    ));
  }
}
