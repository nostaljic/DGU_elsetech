import 'package:flutter/material.dart';
import 'package:dgu_elsetech/style/color.dart';
import 'package:dgu_elsetech/widget/header.dart';
import 'package:dgu_elsetech/widget/box_decoration.dart';
import 'package:dgu_elsetech/widget/content_paragraph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dgu_elsetech/widget/line_chart.dart';

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
        "title": "1월 분석 보고서",
        "time": DateTime.utc(2021, 1, 15, 12, 00, 00),
      },
      {
        "title": "2월 분석 보고서",
        "time": DateTime.utc(2021, 2, 15, 12, 00, 00),
      },{
        "title": "3월 분석 보고서",
        "time": DateTime.utc(2021, 3, 15, 12, 00, 00),
      },
      {
        "title": "4월 분석 보고서",
        "time": DateTime.utc(2021, 4, 15, 12, 00, 00),
      },
      {
        "title": "5월 분석 보고서",
        "time": DateTime.utc(2021, 5, 15, 12, 00, 00),
      },
      {
        "title": "6월 분석 보고서",
        "time": DateTime.utc(2021, 6, 15, 12, 00, 00),
      }
    ];
    return CustomHeader(body:
    Column(
      children: [
        CustomedBox(height:size.height*0.4,
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
        CustomedBox(height:size.height*0.4,child:
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
                Text("월간 분석 추이",style:TextStyle(fontSize: size.width*0.05,fontWeight: FontWeight.bold),),
                Icon(Icons.description_outlined)
              ],
            ),
            Row(
                children: [
                  Container(alignment: AlignmentDirectional.topStart,
                    height: size.height * 0.02, width: rowwidth,),
                ]),
            LineChartAnalysis(),





          ],
        )
        )

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
                child: Text(analysisReport[index]['title'],
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


