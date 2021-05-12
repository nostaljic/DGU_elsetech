// @dart=2.9
import 'package:dgu_elsetech/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:dgu_elsetech/widget/main_loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CustomHeader(body: Container()),
    );
  }
}
