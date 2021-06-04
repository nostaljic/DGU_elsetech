import 'package:flutter/material.dart';
import 'package:dgu_elsetech/widget/container.dart';
import 'package:dgu_elsetech/screen/login.dart';
import 'package:dgu_elsetech/route.dart';


class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _nameController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  bool isChecked = false;
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        if (formKey.currentState!.validate()) {
          // 정상
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)
                ),
                title: new Text("환영합니다!"),
                content: SingleChildScrollView(child:new Text("회원가입이 완료 되었습니다.")),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("닫기"),
                    onPressed: () {
                      // Route route = MaterialPageRoute(builder: (context) => LoginPage(title: 'login',));
                      // Navigator.pushReplacement(context, route);
                      Navigator.pushNamed(context, 'login');
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff60A0D1), Color(0xff9acbf1)])),
        child: Text(
          '가입하기',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
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
              title: new Text("개인정보 이용약관"),
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
        padding: EdgeInsets.all(5),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text(
              '개인정보 이용약관 및 서비스 이용약관에 동의합니다',
              style: TextStyle(
                  color: Color(0xff60A0D1),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          children: [
            TextSpan(
              text: '회원가입',
              style: TextStyle(color: Colors.black, fontSize: 30),
            )
          ]),
    );
  }

  // Widget _emailPasswordWidget() {
  //   return Column(
  //     children: <Widget>[
  //       _entryField("이름"),
  //       _entryField("이메일"),
  //       _entryField("비밀번호", isPassword: true),
  //     ],
  //   );
  // }

  InputDecoration getTextFieldDeco(String hint) {
    return InputDecoration(
      hintText: hint,
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: Colors.grey, width: 1),
      //   borderRadius: BorderRadius.circular(12),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: Colors.grey, width: 1),
      //   borderRadius: BorderRadius.circular(12),
      // ),
      fillColor: Colors.grey[100],
      filled: true,
    );
  }

  TextFormField _emailForm() {
    return TextFormField(
      controller: _emailController,
      decoration: getTextFieldDeco("이메일"),
      // decoration: InputDecoration(
      //   labelText: "이메일",
      //   labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      //   hintText: 'email@email.com',
      // ),
      validator: (value) {
        if(value!.isEmpty || !value.contains('@')){
          return '이메일을 입력하세요.';
        }
        return null;
      },
    );
  }

  TextFormField _pwForm() {
    return TextFormField(
      controller: _pwController,
      decoration: getTextFieldDeco("비밀번호"),
    // InputDecoration(
      //   labelText: "비밀번호",
      //   labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      // ),
      validator: (value) {
        if (value!.isEmpty) {
          return '비밀번호를 입력하세요.';
        }
        return null;
      },
    );
  }

  TextFormField _nameForm() {
    return TextFormField(
      controller: _nameController,
      decoration: getTextFieldDeco("이름"),
      validator: (value) {
        if (value!.isEmpty) {
          return '이름을 입력하세요.';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Spacer(flex: 4),
              _title(),
              Spacer(flex: 2),
              _nameForm(),
              Spacer(flex: 1),
              _emailForm(),
              Spacer(flex: 1),
              _pwForm(),
              Spacer(flex: 1),
              _submitButton(),
              Spacer(flex: 1),
              _loginAccountLabel(),
              Spacer(flex: 3),
            ],
          ),
        ),
        // Positioned(top: 40, left: 0, child: _backButton()),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   final height = MediaQuery.of(context).size.height;
  //   return Scaffold(
  //     resizeToAvoidBottomInset: true,
  //     body: Container(
  //       height: height,
  //       child: Stack(
  //         children: <Widget>[
  //           Positioned(
  //             top: -MediaQuery.of(context).size.height * .15,
  //             right: -MediaQuery.of(context).size.width * .4,
  //             child: BezierContainer(),
  //           ),
  //           Container(
  //             padding: EdgeInsets.symmetric(horizontal: 20),
  //             child: SingleChildScrollView(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   SizedBox(height: height * .2),
  //                   _title(),
  //                   SizedBox(
  //                     height: 50,
  //                   ),
  //                   _emailPasswordWidget(),
  //                   SizedBox(
  //                     height: 20,
  //                   ),
  //                   _submitButton(),
  //                   SizedBox(height: height * .14),
  //                   _loginAccountLabel(),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Positioned(top: 40, left: 0, child: _backButton()),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
