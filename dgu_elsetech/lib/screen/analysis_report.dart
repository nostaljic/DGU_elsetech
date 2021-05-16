import 'package:flutter/material.dart';
import 'package:dgu_elsetech/style/color.dart';
import 'package:dgu_elsetech/widget/header.dart';
import 'package:dgu_elsetech/widget/box_decoration.dart';
import 'package:dgu_elsetech/widget/content_paragraph.dart';

class AnalysisReport extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    double rowwidth = size.width * 0.974;

    return CustomHeader(body: ListView(
      children: [
        CustomedBox(height:size.height*0.5,child:
        ListView(
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


          ],
        )
        ),CustomedBox(height:size.height*0.4,child:
        ListView(
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


          ],
        )
        )

      ],

    ),
    );
  }
}