import 'package:dgu_elsetech/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: themeBlue,
        appBar: new AppBar(
          backgroundColor: themeBlue,
          elevation: 0,
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu_open,
                    color: Color.fromRGBO(199, 221, 235, 1),
                    size: width * 0.09),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
        ),
        endDrawer: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          child: Drawer(
            child: Container(
              height: height,
              child: Column(
                children: <Widget>[
                  Container(
                    width: width,
                    height: height / 5,
                    color: themeBlue,
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Builder(
                          builder: (context) => IconButton(
                            icon: SvgPicture.asset("assets/menu_close.svg",
                                width: width * 0.1, height: width * 0.1),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
