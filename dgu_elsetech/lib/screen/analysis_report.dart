import 'package:flutter/material.dart';
import 'package:dgu_elsetech/style/color.dart';
import 'package:dgu_elsetech/widget/header.dart';
import 'package:dgu_elsetech/widget/box_decoration.dart';
import 'package:dgu_elsetech/widget/content_paragraph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dgu_elsetech/widget/line_chart.dart';
import 'package:dgu_elsetech/api/get_analysis_data.dart';

class AnalysisReport extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    double rowwidth = size.width * 0.974;
    final List<Map<dynamic, dynamic>> monthlyReports = [
      {
      "date": "2018-01-02",
      "open": 170.16,
      "high": 172.3,
      "low": 169.26,
      "close": 172.26,
      "adjusted_close": 167.1997,
      "volume": 25555934
      },
    ];
    final List<Map<dynamic, dynamic>> analysisReports = [
      {
        "long": 126.734086,
        "lat": 37.413294,
        "member_id": "test_id",
        "request_date": "2021-05-20",
        "name": "박승일",
        "water_origin": "000 정수장",
        "fe_origin": 0.0,
        "turbidity": 0.0,
        "date": 1,
        "fe_user": 0.0,
        "mn_user": 0.0,
        "al_user": 0.0,
        "img": "이미지 URL",
        "total": "경고"
      },
      {
        "long": 127.639311,
        "lat": 37.411294,
        "member_id": "test_id",
        "request_date": "2021-05-20",
        "name": "박승일",
        "water_origin": "000 정수장",
        "fe_origin": 0.0,
        "turbidity": 0.0,
        "date": 1,
        "fe_user": 0.0,
        "mn_user": 0.0,
        "al_user": 0.0,
        "img": "이미지 URL",
        "total": "안전"
      },
    ];
    return CustomHeader(body:
    Column(
      children: [
        CustomedBox(height:size.height*0.8,
            child:
            Column(
              children: [
                Row(
                    children: [
                      Container(alignment: AlignmentDirectional.topStart,
                        height: size.height * 0.02, width: rowwidth,),
                    ]),

                Row(
                  children: [
                    Container(width: size.width * 0.1),
                    Text("필터 분석 보고서",style:TextStyle(fontSize: size.width*0.05,fontWeight: FontWeight.bold),),
                    Icon(Icons.description_outlined)
                  ],
                ),
                Row(
                    children: [
                      Container(alignment: AlignmentDirectional.topStart,
                        height: size.height * 0.02, width: rowwidth,),
                    ]),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(

                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: analysisReports.length,
                          itemBuilder: (BuildContext context, int index) {
                            return analysisReporting(context,index,analysisReports);
                          }
                      ),
                    ),
                  ),
                ),
              ],
            ),

        ),
        // CustomedBox(height:size.height*0.4,child:
        // Column(
        //   children: [
        //     Row(
        //         children: [
        //           Container(alignment: AlignmentDirectional.topStart,
        //             height: size.height * 0.02, width: rowwidth,),
        //         ]),
        //     Row(
        //       children: [
        //         Container(width: size.width * 0.1),
        //         Text("월간 분석 추이",style:TextStyle(fontSize: size.width*0.05,fontWeight: FontWeight.bold),),
        //         Icon(Icons.description_outlined)
        //       ],
        //     ),
        //     Row(
        //         children: [
        //           Container(alignment: AlignmentDirectional.topStart,
        //             height: size.height * 0.02, width: rowwidth,),
        //         ]),
        //     LineChartAnalysis(),
        //
        //
        //
        //
        //
        //   ],
        // )
        // )

      ],

    ),
    );
  }
}

Widget analysisReporting(BuildContext context, int index ,List<Map<dynamic, dynamic>> analysisReport) {
  final Size size = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: () {
      print(index.toString() + "번의 분석 보고서가 눌렸습니다.");
      //postRequest().then((value)=>print(value));

      //보고서 다운로드 루틴
    },
    child: Container(
      padding: EdgeInsets.all(size.height * 0.01),
      width: size.width * 0.9,
      height: size.height * 0.1,
      color: Colors.transparent,
      child: new Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox( width: size.width * 0.2,
                child: Icon(Icons.description)),
            SizedBox(
                width: size.width * 0.6,
                child: Text("${analysisReport[index]['request_date']} 분석 보고서",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.025))),


          ],
        ),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius:
          new BorderRadius.all(Radius.circular(15.0)),
          border:
          Border.all(color: Color(0xff707070), width: 1.0),
        ),
      ),
    ),
  );
}


