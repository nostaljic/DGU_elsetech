import 'package:flutter/material.dart';
import 'package:dgu_elsetech/widget/header.dart';
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
}