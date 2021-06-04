import 'package:dgu_elsetech/screen/bottom_sheet.dart';
import 'package:dgu_elsetech/widget/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:dgu_elsetech/api/get_analysis_data.dart';
import 'package:dgu_elsetech/widget/box_decoration.dart';



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
      long = markers[i]['longitude'];
      lat = markers[i]['latitude'];
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

  Future<Position> getLocation() async {
    Position position =
        // ignore: deprecated_member_use
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    return position;
  }

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    postRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Future<Position> nowpos = getLocation();
    var lat = 0.0;
    var long = 0.0;
    var nowLoc = CameraPosition(
      target: LatLng(37.606991, 127.0232185),
      zoom: 10,
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
