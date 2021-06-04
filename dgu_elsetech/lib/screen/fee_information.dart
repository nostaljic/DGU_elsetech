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
          paragraph: "서비스 소개\n\n배관 스케일 유발물질 '철, 망간, \n알루미늄'을 대상으로 수거된 \n정수기 폐필터의 누적된 오염물질을 분석합니다.\n",),
        ContentParagraph(title: "서비스 가격",
          paragraph: "분석 요청서를 작성하고 \n업체로 정수기 필터를 보내주세요.\n\n\t30,000(원)",),
        ContentParagraph(title: "연간 구독료",
          paragraph: "3개월에 한번씩 주기적으로 분석을 실시합니다.\n\n\t100,000(원)",),


      ],
    )
    ),
    );
  }
}