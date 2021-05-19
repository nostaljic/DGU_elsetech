import 'package:flutter/material.dart';
class CustomedBox extends StatefulWidget {
  final child,width,height;
  CustomedBox({@required this.child,this.width,this.height});
  @override
  _CustomedBoxState createState() => _CustomedBoxState();
}

class _CustomedBoxState extends State<CustomedBox> {
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
    return Container(
      width: widget.width,
      height: widget.height,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
        child:widget.child


    );
  }
}