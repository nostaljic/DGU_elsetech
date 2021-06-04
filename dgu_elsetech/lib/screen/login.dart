import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dgu_elsetech/screen/signup.dart';
import 'package:dgu_elsetech/widget/container.dart';
import 'package:dgu_elsetech/screen/home.dart';
import 'package:dgu_elsetech/route.dart';
import 'package:dgu_elsetech/screen/findPW.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

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
          Navigator.pushNamed(context, 'home');
        }
        // Route route = MaterialPageRoute(builder: (context) => Home());
        // Navigator.pushReplacement(context, route);
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
                colors: [Color(0xff60A0D1), Color(0xff81b8e2)])),
        child: Text(
          '시작하기',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Route route = MaterialPageRoute(
            builder: (context) => SignUpPage(
                  title: 'signup',
                ));
        Navigator.pushReplacement(context, route);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Text(
              '회원가입',
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

  Widget _findPassword() {
    return InkWell(
      onTap: () {
        Route route = MaterialPageRoute(
            builder: (context) => FindPWPage(
                  title: 'find',
                ));
        Navigator.pushReplacement(context, route);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        alignment: Alignment.centerRight,
        child: Text(
          '비밀번호찾기',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff60A0D1)),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: '로그인',
          style: TextStyle(color: Colors.black, fontSize: 30),
        )
      ]),
    );
  }

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
      // decoration: InputDecoration(
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

  // Widget _emailPasswordWidget() {
  //   return Column(
  //     children: <Widget>[
  //       _entryField("이메일"),
  //       _entryField("비밀번호", isPassword: true),
  //     ],
  //   );
  // }

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
              Spacer(flex: 5),
              _title(),
              Spacer(flex: 1),
              _emailForm(),
              Spacer(flex: 1),
              _pwForm(),
              Spacer(flex: 1),
              _submitButton(),
              Spacer(flex: 1),
              _findPassword(),
              _divider(),
              Spacer(flex: 2),
              _createAccountLabel(),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final height = MediaQuery.of(context).size.height;
  //   return Scaffold(
  //       resizeToAvoidBottomInset: true,
  //       body: Container(
  //         height: height,
  //         child: Form(
  //           key: formKey,
  //           child: SingleChildScrollView(
  //             child: Positioned(
  //                 top: -height * .15,
  //                 right: -MediaQuery.of(context).size.width * .4,
  //                 child: BezierContainer()),
  //             Child: Column(
  //               padding: EdgeInsets.symmetric(horizontal: 20),
  //               child: SingleChildScrollView(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: <Widget>[
  //                     SizedBox(height: height * .2),
  //                     _title(),
  //                     SizedBox(height: 50),
  //                     _emailPasswordWidget(),
  //                     SizedBox(height: 20),
  //                     _submitButton(),
  //                     SizedBox(height: 10),
  //                     _findPassword(),
  //                     _divider(),
  //                     SizedBox(height: height * .055),
  //                     _createAccountLabel(),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Positioned(top: 40, left: 0, child: _backButton()),
  //           ),
  //         ),
  //       ));
  // }
}

