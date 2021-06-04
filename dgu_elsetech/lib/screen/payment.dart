import 'package:flutter/material.dart';
import 'package:dgu_elsetech/screen/analysis/background.dart';
import 'package:dgu_elsetech/screen/analysis/rounded_button.dart';
import 'package:dgu_elsetech/screen/analysis/rounded_input_field.dart';
import 'package:dgu_elsetech/style/typography.dart';

class Payment extends StatefulWidget {
  Payment({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool isChecked_a = false;
  bool isChecked_w = false;

  Widget _analysisServices() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0)
              ),
              title: new Text("분석 서비스 이용 동의"),
              content: SingleChildScrollView(child:new Text("~~약관내용~~")),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("닫기"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.all(2),
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Checkbox(
              value: isChecked_a,
              onChanged: (value) {
                setState(() {
                  isChecked_a = value!;
                });
              },
            ),
            Text(
              '분석 서비스 이용 동의',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _waterInformation() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0)
              ),
              title: new Text("수질 정보 이용 동의"),
              content: SingleChildScrollView(child:new Text("~~약관내용~~")),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("닫기"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.all(2),
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Checkbox(
              value: isChecked_w,
              onChanged: (value) {
                setState(() {
                  isChecked_w = value!;
                });
              },
            ),
            Text(
              '수질정보 공개 동의',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget _paymentInfo() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.6,
      height: size.height *0.1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: kPrimaryColor,
          child: Text(
            '예금주명 신한 120-000-000000',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
          },
        ),
      ),
    );
  }

  Widget _submitInfo() {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        width: size.width * 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: kPrimaryColor,
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              // 정상
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    title: new Text("감사합니다!"),
                    content:
                    SingleChildScrollView(child: new Text("수질분석요청이 전달되었습니다.\n아래 계좌번호로 입금해주세요 :)\n\n입금계좌 : 신한 120-000-000000\n예금주 : @@@\n입금 금액 : 30,000원\n")),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text("닫기"),
                        onPressed: () {
                          // Route route = MaterialPageRoute(builder: (context) => LoginPage(title: 'login',));
                          // Navigator.pushReplacement(context, route);
                          Navigator.pushNamed(context, 'home');
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              '수질 분석 요청',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "결제",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: size.height * 0.1),
            Text(
              "무통장입금                                                        ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            _paymentInfo(),
            Text(
              "                                                      금액  30,000원",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: size.height * 0.2),
            _analysisServices(),
            _waterInformation(),
            SizedBox(height: size.height * 0.03),
            Text(
              "결제 확인까지 시간이 소요됩니다.",
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(height: size.height * 0.01),
            _submitInfo(),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
