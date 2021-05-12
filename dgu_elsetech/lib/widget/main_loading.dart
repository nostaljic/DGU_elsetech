import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.cyan, //0xff080838
      body: Container(
        alignment: AlignmentDirectional.center,
        height: size.height,
        child: SvgPicture.asset("assets/main_logo.svg",
              alignment: Alignment.center,
              width: size.width * 0.5,
              height: size.height * 0.3),
        ),
      );
  }
}
