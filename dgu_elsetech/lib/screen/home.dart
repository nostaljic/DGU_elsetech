import 'package:dgu_elsetech/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Completer<GoogleMapController> _controller = Completer();

  static final gwanghwamun = CameraPosition(
    target: LatLng(37.575929, 126.976849),
    zoom: 3.0,
  );
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return CustomHeader(
        body: Center(
        child: Container(
          alignment: AlignmentDirectional.topCenter,
          width: size.width*0.9,
          height: size.height*0.5,
          color: Colors.amber,

          child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: gwanghwamun,
          onMapCreated: (GoogleMapController controller) {
      _controller.complete(controller);
    },
            compassEnabled: true,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,
          ),
        ),
        ),
    );
  }
}