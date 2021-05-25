import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dgu_elsetech/style/color.dart';
class MainLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent, //0xff080838
      body: Stack(
        children: [
          Background()
          ,Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: size.height*0.05),
              child: SizedBox(
                width: size.width*0.5,
                child: Image.asset("assets/elsetech_logo.png"),
    ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _loading(BuildContext context) {
  final Size size = MediaQuery.of(context).size;

  return Scaffold(
    backgroundColor: Colors.transparent, //0xff080838
    body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff60A0D1), Color(0xffD9EFFF)],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                )
            )
        )
        ,Container(
          alignment: AlignmentDirectional.center,
          child: SizedBox(
            width: size.width*0.5,
            child: Image.asset("assets/elsetech_logo.png"),
          ),
        ),
      ],
    ),
  );
}

