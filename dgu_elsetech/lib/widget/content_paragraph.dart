import 'package:flutter/material.dart';
class ContentParagraph extends StatefulWidget {
  final title;
  final paragraph;
  ContentParagraph({@required this.title,this.paragraph});
  @override
  _ContentParagraphState createState() => _ContentParagraphState();
}

class _ContentParagraphState extends State<ContentParagraph> {
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
    final Size size = MediaQuery
        .of(context)
        .size;
    double rowwidth = size.width * 0.974;

    return Row(
      children: [
        Column(
          children: [
            //Container(width:rowwidth*0.0001,),
                  Row(
                      children: [
                        Container(alignment: AlignmentDirectional.topStart,
                          height: size.height * 0.02, width: rowwidth,),
                      ]),
                  Row(
                    children: [
                      Container(width:rowwidth*0.05,),
                      Container(
                      width: rowwidth*0.7,
                          child: Text(widget.title,style: TextStyle(fontSize: size.width*0.05,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(width: rowwidth * 0.7,
                          child: Divider(color: Colors.black, thickness: 1.0))
                    ],
                  ),
                  Row(
                    children: [
                      new Container(
                        width: rowwidth * 0.7,
                        margin: const EdgeInsets.all(0.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                        ),
                        child: Text(
                            widget.paragraph,style: TextStyle(fontSize: size.width*0.045,fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                ]
            ),
      ],
    );

  }
}