import 'package:dgu_elsetech/screen/bottom_sheet.dart';
import 'package:dgu_elsetech/widget/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

import 'package:dgu_elsetech/widget/box_decoration.dart';

Set<Marker> _createMarker(markers){
  Set<Marker> _Marker={};

  var lat, long, waterState, address;
  var _kMapCenter;

  for(int i=0;i<markers.length;i++){

    long = markers[i]['long'];
    lat = markers[i]['lat'];
    waterState = markers[i]['state'];
    address= markers[i]['address'];
    print(long);print(lat);print(waterState);
    _kMapCenter = LatLng(lat,long);
    _Marker.add(
        Marker(
          markerId: MarkerId("marker_1"),
          position: _kMapCenter,
          icon:BitmapDescriptor.fromAsset(waterState? 'assets/sizuku.png':'assets/dirty_sizuku.png'),
          infoWindow: InfoWindow(title:address),
        )
    );
  }


  return _Marker;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<dynamic, dynamic>> marker_info = [
    {
      "long": 126.734086,
      "lat": 37.413294,
      "state": true,
      "address":"서울시 동작구"
    },
    {
      "long": 	127.639311,
      "lat": 37.413294,
      "state": false,
      "address":"서울시 동작구"
    },{
      "long": 126.534095,
      "lat": 37.413305,
      "state": true,
      "address":"서울시 동작구"
    },
    {
      "long": 126.434080,
      "lat": 37.413290,
      "state": false,
      "address":"서울시 동작구"
    },
    {
      "long": 126.334075,
      "lat": 37.413290,
      "state": true,
      "address":"서울시 관악구"
    },
    {
      "long": 126.234080,
      "lat": 37.413294,
      "state": true,
      "address":"서울시 관악구"
    }
  ];
  Future<Position> getLocation() async {
    Position position =
        // ignore: deprecated_member_use
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    return position;
  }

  Completer<GoogleMapController> _controller = Completer();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Future<Position> nowpos = getLocation();
    var lat = 0.0;
    var long = 0.0;
    var nowLoc = CameraPosition(
      target: LatLng(37.413294, 126.734086),
      zoom: 13,
    );

    return CustomHeader(
        body: Stack(
      children: <Widget>[
        Center(
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  heightFactor: 1.0,
                  widthFactor: 1.0,
                  child: nowLoc != null
                      ? SizedBox(
                          width: size.width * 0.98,
                          height: size.height * 0.82,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: nowLoc,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                              },
                            markers: _createMarker(marker_info),
                            compassEnabled: true,
                            zoomGesturesEnabled: true,
                            rotateGesturesEnabled: true,
                            scrollGesturesEnabled: true,
                            tiltGesturesEnabled: true,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                          ),
                        )
                      : null,
                ))),
        SizedBox.expand(
            child: DraggableScrollableSheet(
                initialChildSize: 0.05,
                minChildSize: 0.05,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, spreadRadius: 1),
                        ],
                      ),
                      child: SingleChildScrollView(
                          controller: scrollController,
                          child: BottomSheetModal()));
                })),
      ],
    ));
  }
}

/*
*
          *
          *
          * */
