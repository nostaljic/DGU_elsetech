import 'package:flutter/material.dart';
const themeBlue = Color.fromRGBO(96, 160, 209, 1);

class Background extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff60A0D1), Color(0xffD9EFFF)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
            )
        )
    );
  }
}