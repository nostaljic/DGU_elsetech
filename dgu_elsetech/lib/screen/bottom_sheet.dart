import 'package:dgu_elsetech/model/water.dart';
import 'package:dgu_elsetech/style/color.dart';
import 'package:dgu_elsetech/style/typography.dart';
import 'package:flutter/material.dart';
Map<dynamic, dynamic> surround={
  "long": 126.734086,
  "lat": 37.413294,
  "member_id": "",
  "request_date": "",
  "name": "",
  "water_origin": "",
  "fe_origin": 0.0,
  "turbidity": 0.0,
  "date": 1,
  "fe_user": 1.0,
  "mn_user": 0.0,
  "al_user": 0.0,
  "img": "",
  "total": ""
};
List<Map<String, dynamic>> water = [
  {"location": "송파구", "turbidity": 0.08, "chlorine": 0.36, "ph": 6.8}
];
class BottomSheetModal extends StatelessWidget{

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
                borderRadius: BorderRadius.all(Radius.circular(10)))
        ),
        SizedBox(height: height * 0.05),
        _publicData(context, width, true, water),
        _surroundingData(context, width, surround),
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
            child:SizedBox(
              //width: width*0.5,
              child: good == true ?Image.asset("assets/water_smile.png"):Image.asset("assets/elsetech_logo.png"),
            ),
            //color: good == true ? Colors.blue : Colors.red,
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
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //     Container(
      //       padding: EdgeInsets.only(left: 5, right: 5),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(5)),
      //         color: Colors.white,
      //         boxShadow: [
      //           BoxShadow(color: Colors.grey, spreadRadius: 1),
      //         ],
      //       ),
      //       child: Text("수질정보"),
      //     ),
      //     SizedBox(width: 5),
      //     Container(
      //       padding: EdgeInsets.only(left: 5, right: 5),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(5)),
      //         color: Colors.white,
      //         boxShadow: [
      //           BoxShadow(color: Colors.grey, spreadRadius: 1),
      //         ],
      //       ),
      //       child: Text("공급경로"),
      //     ),
      //     SizedBox(width: 5),
      //     Container(
      //       padding: EdgeInsets.only(left: 5, right: 5),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(5)),
      //         color: Colors.white,
      //         boxShadow: [
      //           BoxShadow(color: Colors.grey, spreadRadius: 1),
      //         ],
      //       ),
      //       child: Text("단수정보"),
      //     ),
      //     SizedBox(width: 5),
      //     Container(
      //       padding: EdgeInsets.only(left: 5, right: 5),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(5)),
      //         color: Colors.white,
      //         boxShadow: [
      //           BoxShadow(color: Colors.grey, spreadRadius: 1),
      //         ],
      //       ),
      //       child: Text("관할 사업소"),
      //     )
      //   ],
      // ),
      SizedBox(height: 30),
    ]),
  );
}

Widget _surroundingData(BuildContext context, double width, Map _surround) {
  Size screenSize = MediaQuery.of(context).size;
  double width = screenSize.width;
  double height = screenSize.height;
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
            child:Column(
              children: [
                Container(
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
                            _surround["mn_user"] == 0.0
                                ? "망간(Mn) : ${_surround["mn_user"]}"
                                : "망간(Mn) : ${_surround["mn_user"]}",
                            style: _surround["mn_user"] == 0.0
                                ? mainBlue
                                : mainRed),
                        Text("_surround"),

                      ],
                    )),
                Container(height:20,),
                Container(
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
                            _surround["fe_user"] == 0.0
                                ? "철(Fe) : ${_surround["fe_user"]}"
                                : "철(Fe) : ${_surround["fe_user"]}",
                            style: _surround["fe_user"] == 0.0
                                ? mainBlue
                                : mainRed),
                        Text("_surround"),

                      ],
                    )),
                Container(height:20,),
                Container(
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
                            _surround["al_user"] == 0.0
                                ? "알루미늄(Al) : ${_surround["al_user"]}"
                                : "알루미늄(Al) : ${_surround["al_user"]}",
                            style: _surround["al_user"] == 0.0
                                ? mainBlue
                                : mainRed),
                        Text("_surround"),

                      ],
                    )),
                Container(height:20,),
                Container(

                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                                _surround["mn_user"] == 0.0
                                    ? "망간(Mn) 검출 안전범위."
                                    : "망간(Mn) 검출 경고범위.",
                                style: _surround["mn_user"] == 0.0
                                    ? mainBlue
                                    : mainRed),


                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                                _surround["fe_user"] == 0.0
                                    ? "철(Fe) 검출 안전범위."
                                    : "철(Fe) 검출 경고범위.",
                                style: _surround["fe_user"] == 0.0
                                    ? mainBlue
                                    : mainRed),


                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                                _surround["al_user"] == 0.0
                                    ? "알루미늄(Al) 검출 안전범위."
                                    : "알루미늄(Al) 검출 경고범위.",
                                style: _surround["al_user"] == 0.0
                                    ? mainBlue
                                    : mainRed),


                          ],
                        ),
                      ],
                    )),

              ],
            ),
            // child: ListView.separated(
            //     separatorBuilder: (context, index) => SizedBox(
            //           height: 10,
            //         ),
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     itemCount: _surround.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Container(
            //           padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             boxShadow: [
            //               BoxShadow(color: Colors.grey, spreadRadius: 1),
            //             ],
            //           ),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             crossAxisAlignment: CrossAxisAlignment.end,
            //             children: <Widget>[
            //               Text(
            //                   _surround["mn_user"] == 0.0
            //                       ? "망간(Mn) : ${_surround["mn_user"]}"
            //                       : "망간(Mn) : ${_surround["mn_user"]}",
            //                   style: _surround["mn_user"] == 0.0
            //                       ? mainBlue
            //                       : mainRed),
            //               Text("_surround")
            //             ],
            //           ));
            //     }),
          )
        ],
      ));
}
