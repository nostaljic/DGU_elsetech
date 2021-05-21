import 'package:dgu_elsetech/model/water.dart';
import 'package:dgu_elsetech/style/color.dart';
import 'package:dgu_elsetech/style/typography.dart';
import 'package:flutter/material.dart';

class BottomSheetModal extends StatelessWidget {
  List<Map<String, dynamic>> _water = [
    {"location": "송파구", "turbidity": 0.08, "chlorine": 0.36, "ph": 6.8}
  ];

  List<Map<String, dynamic>> _surround = [
    {"good": true, "distance": "100m"},
    {"good": false, "distance": "140m"},
    {"good": true, "distance": "200m"},
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Column(
      children: <Widget>[
        SizedBox(height: height * 0.01),
        Container(
            width: width * 0.1,
            height: height * 0.01,
            decoration: BoxDecoration(
                color: themeBlue,
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        SizedBox(height: height * 0.05),
        _publicData(context, width, true, _water),
        _surroundingData(context, width, _surround),
      ],
    );
  }
}

Widget _publicData(BuildContext context, double width, bool good, List _water) {
  return Container(
    padding: EdgeInsets.only(left: width * 0.12),
    width: width,
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(good == true ? "마시기 적합" : "마시기 부적합",
          style: good == true ? mainBlue : mainRed),
      SizedBox(height: 15),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width * 0.25,
            height: width * 0.25,
            color: good == true ? Colors.blue : Colors.red,
          ),
          SizedBox(width: width * 0.05),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("-탁도:", style: subBlack),
                  SizedBox(width: 43),
                  Text(_water[0]["turbidity"].toString() + " NTU",
                      style: subBlack),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Text("-잔류염소:", style: subBlack),
                  SizedBox(width: 15),
                  Text(_water[0]["chlorine"].toString() + " mg/L",
                      style: subBlack),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Text("-pH:", style: subBlack),
                  SizedBox(width: 53),
                  Text(_water[0]["ph"].toString(), style: subBlack),
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1),
              ],
            ),
            child: Text("수질정보"),
          ),
          SizedBox(width: 5),
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1),
              ],
            ),
            child: Text("공급경로"),
          ),
          SizedBox(width: 5),
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1),
              ],
            ),
            child: Text("단수정보"),
          ),
          SizedBox(width: 5),
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1),
              ],
            ),
            child: Text("관할 사업소"),
          )
        ],
      ),
      SizedBox(height: 30),
    ]),
  );
}

Widget _surroundingData(BuildContext context, double width, List _surround) {
  return Container(
      padding: EdgeInsets.only(left: width * 0.12, right: width * 0.12),
      width: width,
      child: Column(
        children: <Widget>[
          Text("선택 지역의 정수기 필터 검사 정보", style: mainBlack),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1),
              ],
            ),
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _surround.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, spreadRadius: 1),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                              _surround[index]["good"] == true
                                  ? "음용에 적합함"
                                  : "음용에 부적합함",
                              style: _surround[index]["good"] == true
                                  ? mainBlue
                                  : mainRed),
                          Text(_surround[index]["distance"])
                        ],
                      ));
                }),
          )
        ],
      ));
}
