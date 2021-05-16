import 'package:flutter/material.dart';
import 'package:dgu_elsetech/style/color.dart';
import 'package:dgu_elsetech/widget/header.dart';
import 'package:dgu_elsetech/widget/box_decoration.dart';
import 'package:dgu_elsetech/widget/content_paragraph.dart';
class FeeInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    double rowwidth = size.width * 0.974;

    return CustomHeader(body: CustomedBox(child:
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
              Text("요금 안내",style:TextStyle(fontSize: size.width*0.05,fontWeight: FontWeight.bold),),
              Icon(Icons.monetization_on_outlined)
            ],
          ),


        ContentParagraph(title: "정수기 필터 분석 서비스",
          paragraph: "서비스 소개\n\nLorem ipsum is a pseudo-Latin\ntext used in web design, typog\nraphy, layout, and printing in\nplace of English to emphasise\ndesign elements over content.",),
        ContentParagraph(title: "서비스 가격",
          paragraph: "절차라던가 그런거 설명 ~\nlorem ipsum is a pseudo-Latin\ntext used\n\n\t30,000(원)",),
        ContentParagraph(title: "연간 구독료",
          paragraph: "1회 분석과 차이점 서술\nlorem ipsum is a pseudo-Latin\ntext used\n\n\t100,000(원)",),


      ],
    )
    ),
    );
  }
}