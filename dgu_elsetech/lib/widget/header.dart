import 'package:dgu_elsetech/route.dart';
import 'package:dgu_elsetech/style/color.dart';
import 'package:dgu_elsetech/style/typography.dart';
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
        body: Stack(
          children: <Widget>[
            Background(),
            widget.body,
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
                  Container(
                    width: width,
                    padding: EdgeInsets.fromLTRB(
                        width * 0.05, width * 0.1, width * 0.05, 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('서비스', style: drawerBold),
                          Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          //주변 지역 정보
                          ListTile(
                            title: Row(children: <Widget>[
                              Text("주변 지역 정보", style: drawerBold),
                              Icon(Icons.map, color: Colors.black, size: 25),
                            ]),
                            subtitle:
                                Text("지도에서 수질 정보를 받아보세요", style: drawerBlue),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 0.8),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onTap: () {
                              Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      Navigator.defaultRouteName));
                              Navigator.pushNamed(context, Routes.home);
                            },
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          //필터 분석 요청
                          ListTile(
                            title: Row(children: <Widget>[
                              Text("필터 분석 요청", style: drawerBold),
                              Icon(Icons.science_outlined,
                                  color: Colors.black, size: 25),
                            ]),
                            subtitle:
                                Text("최고의 기술로 안심하고 물을 드세요", style: drawerBlue),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 0.8),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onTap: () {
                              Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      Navigator.defaultRouteName));
                              Navigator.pushNamed(context, Routes.user);
                            },
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          //필터 분석 보고서
                          ListTile(
                            title: Row(children: <Widget>[
                              Text("필터 분석 보고서", style: drawerBold),
                              Icon(Icons.description_outlined,
                                  color: Colors.black, size: 25),
                            ]),
                            subtitle: Text("분석 서비스의 결과 보고서를 받아보세요",
                                style: drawerBlue),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 0.8),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onTap: () {
                              Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      Navigator.defaultRouteName));
                              Navigator.pushNamed(context, Routes.analysis);
                            },
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          //요금 안내
                          ListTile(
                            title: Row(children: <Widget>[
                              Text("요금 안내", style: drawerBold),
                              Icon(Icons.payment,
                                  color: Colors.black, size: 25),
                            ]),
                            subtitle: Text("서비스를 통해 더 많은 정보를 받아보세요",
                                style: drawerBlue),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 0.8),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onTap: () {
                              Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      Navigator.defaultRouteName));
                              Navigator.pushNamed(context, Routes.fee);
                            },
                          ),

                          Padding(
                            padding: EdgeInsets.only(bottom: width * 0.1),
                          ),
                          Text("개인 설정", style: drawerBold),
                          Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          _loginLogoutWidget(context, '', height),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _loginLogoutWidget(BuildContext context, String auth, double height) {
  return Container(
    height: height * 0.12,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(auth == '' ? "지금 로그인 하고 더 많은 정보를 받아보세요" : "", style: drawerBlue),
        Expanded(child: Container()),
        Row(
          children: <Widget>[
            Expanded(child: Container()),
            TextButton(
                onPressed: () {}, //기능 구현 필요,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(208, 233, 251, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(width: 18),
                    Text(auth == '' ? "로그인" : "로그아웃", style: drawerBlue),
                    SizedBox(width: 10),
                    Icon(auth == '' ? Icons.login : Icons.logout,
                        color: Color.fromRGBO(0, 60, 255, 1)),
                    SizedBox(width: 18),
                  ],
                ))
          ],
        )
      ],
    ),
  );
}
