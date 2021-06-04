import 'package:flutter/material.dart';
import 'package:dgu_elsetech/screen/analysis/background.dart';
import 'package:dgu_elsetech/screen/analysis/rounded_button.dart';
import 'package:dgu_elsetech/screen/analysis/rounded_input_field.dart';
import 'package:dgu_elsetech/style/typography.dart';
import 'package:dgu_elsetech/screen/payment.dart';

class Body extends StatefulWidget {
  Body({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime.now();

  _selectFirstDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: firstDate, // Refer step 1
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != firstDate)
      setState(() {
        firstDate = picked;
      });
  }
  _selectSecondDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: lastDate, // Refer step 1
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != lastDate)
      setState(() {
        lastDate = picked;
      });
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
              "수질 분석 요청",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: size.height * 0.06),
            Text(
              "번호",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RoundedInputField(
              icon: Icons.phone_android,
              hintText: "010-0000-0000",
              onChanged: (value) {},
            ),
            Text(
              "위치",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RoundedInputField(
              icon: Icons.water_damage,
              hintText: "서울 송파구 백제고분로00길 0-0",
              onChanged: (value) {},
            ),
            Text(
              "정수기업체",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RoundedInputField(
              icon: Icons.location_city,
              hintText: "코웨이",
              onChanged: (value) {},
            ),
            Text(
              "정수기모델명",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RoundedInputField(
              icon: Icons.water_sharp,
              hintText: "C-1000",
              onChanged: (value) {},
            ),
            Text(
              "사용기간",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: Color(0xFF363B64),
                      onPressed: () => _selectFirstDate(context),
                      // onPressed: () {
                      //   Future<DateTime> future = showDatePicker(
                      //     context: context,
                      //     initialDate: DateTime.now(),
                      //     firstDate: DateTime(2010),
                      //     lastDate: DateTime(2050),
                      //     builder: (BuildContext context, Widget child) {
                      //       return Theme(
                      //         data: ThemeData.dark(),
                      //         child: child,
                      //       );
                      //     },
                      //   );
                      // },
                      child: Text(
                        "${firstDate.toLocal()}".split(' ')[0],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "~",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: Color(0xFF363B64),
                      onPressed: () => _selectSecondDate(context),
                      // Future<DateTime> future = showDatePicker(
                      //   context: context,
                      //   initialDate: DateTime.now(),
                      //   firstDate: DateTime(2010),
                      //   lastDate: DateTime(2050),
                      //   builder: (BuildContext context, Widget child) {
                      //     return Theme(
                      //       data: ThemeData.dark(),
                      //       child: child,
                      //     );
                      //   },
                      // );
                      // },
                      child: Text(
                        "${lastDate.toLocal()}".split(' ')[0],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "사용인원수",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RoundedInputField(
              icon: Icons.people,
              hintText: "4",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "다음",
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
