import 'package:dgu_elsetech/style/color.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  final body;
  CustomHeader({@required this.body});
  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  void intiState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeBlue,
      endDrawer: Drawer(),
    );
  }
}
