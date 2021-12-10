import 'dart:async';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '';
import 'package:location/location.dart';

class mapforuser extends StatefulWidget {
  // mapforuser({Key? key}) : super(key: key);

  @override
  _mapforuserState createState() => _mapforuserState();
}

class _mapforuserState extends State<mapforuser> {
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  GoogleMapController _controller;
  Location location = new Location();
  LatLng _center = const LatLng(27.22, 78.02424);
  _animateToUser() async {
    var pos = await location.getLocation();
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(pos.latitude, pos.longitude), zoom: 17.0)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 15),
          )
        ],
      ),
    );
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
    _animateToUser();
  }
}
