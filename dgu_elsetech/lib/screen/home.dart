import 'package:dgu_elsetech/screen/bottom_sheet.dart';
import 'package:dgu_elsetech/widget/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:dgu_elsetech/api/get_analysis_data.dart';
import 'package:dgu_elsetech/widget/box_decoration.dart';

final List<Map<String, dynamic>> water = [
  {"location": "남동구", "turbidity": 0.06, "chlorine": 0.35, "ph": 6.5},
  {"location": "동작구", "turbidity": 0.07, "chlorine": 0.36, "ph": 6.8},
  {"location": "송파구", "turbidity": 0.08, "chlorine": 0.37, "ph": 7.0},
];
final List<Map<dynamic, dynamic>> marker_info = [
  {
    "public_ph": 0.3,
    "public_rc": 0.4,
    "public_tb": 0.5,
    "long": 127.0317674,
    "lat": 37.6658609,
    "member_id": "test_id",
    "request_date": "2021-05-20",
    "name": "박승일",
    "water_origin": "000 정수장",
    "fe_origin": 0.0,
    "turbidity": 0.0,
    "date": 1,
    "fe_user": 1.0,
    "mn_user": 0.0,
    "al_user": 0.0,
    "img": "이미지 URL",
    "total": "경고"
  },
  {
    "public_ph": 0.3,
    "public_rc": 0.4,
    "public_tb": 0.5,
    "long": 126.9227004,
    "lat": 37.6176125,
    "member_id": "test_id",
    "request_date": "2021-05-20",
    "name": "박승일",
    "water_origin": "000 정수장",
    "fe_origin": 0.0,
    "turbidity": 0.0,
    "date": 1,
    "fe_user": 0.0,
    "mn_user": 2.0,
    "al_user": 0.0,
    "img": "이미지 URL",
    "total": "안전"
  },
  {
    "public_ph": 0.3,
    "public_rc": 0.7,
    "public_tb": 0.5,
    "long": 126.834086,
    "lat": 37.412294,
    "member_id": "test_id",
    "request_date": "2021-05-20",
    "name": "박승일",
    "water_origin": "000 정수장",
    "fe_origin": 0.0,
    "turbidity": 0.0,
    "date": 1,
    "fe_user": 0.0,
    "mn_user": 0.0,
    "al_user": 3.0,
    "img": "이미지 URL",
    "total": "경고"
  },
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //var a =postRequest();
  Set<Marker> _createMarker(markers) {
    Set<Marker> _Marker = {};

    var lat, long, waterState, total;
    var _kMapCenter;

    for (int i = 0; i < markers.length; i++) {
      long = markers[i]['long'];
      lat = markers[i]['lat'];
      waterState = markers[i]['total'] == '안전' ? true : false;
      total = markers[i]['total'];
      print(long);
      print(lat);
      print(waterState);
      _kMapCenter = LatLng(lat, long);
      _Marker.add(Marker(
          markerId: MarkerId("${i}" + markers[i]['request_date']),
          position: _kMapCenter,
          icon: BitmapDescriptor.fromAsset(
              waterState ? 'assets/sizuku.png' : 'assets/dirty_sizuku.png'),
          infoWindow: InfoWindow(title: total),
          onTap: () {
            print(i);
            //setState(() {
            surround = marker_info[i];
            //});
          }));
    }

    return _Marker;
  }

  Map<dynamic, dynamic> mk = {
    "long": 126.734086,
    "lat": 37.413294,
    "member_id": "test_id",
    "request_date": "2021-05-20",
    "name": "박일",
    "water_origin": "000 정수장",
    "fe_origin": 0.0,
    "turbidity": 0.0,
    "date": 1,
    "fe_user": 1.0,
    "mn_user": 0.0,
    "al_user": 0.0,
    "img": "이미지 URL",
    "total": "경고"
  };

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
