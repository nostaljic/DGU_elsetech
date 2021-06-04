// @dart=2.9
import 'dart:async';
import 'package:dgu_elsetech/route.dart';
import 'package:dgu_elsetech/screen/login.dart';
import 'package:dgu_elsetech/screen/payment.dart';
import 'package:dgu_elsetech/screen/paymentScreen.dart';
import 'package:dgu_elsetech/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:dgu_elsetech/widget/main_loading.dart';
import 'package:dgu_elsetech/screen/home.dart';
import 'package:dgu_elsetech/screen/fee_information.dart';
import 'package:dgu_elsetech/screen/analysis_report.dart';
import 'package:dgu_elsetech/api/get_analysis_data.dart';
import 'package:dgu_elsetech/screen/welcome.dart';
import 'package:dgu_elsetech/screen/findPW.dart';
import 'package:dgu_elsetech/screen/request.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Index Map',
      // home: Home(),
      home: SplashScreen(),
      // initialRoute: Routes.home,
      onGenerateRoute: (RouteSettings settings) {
        // ignore: missing_return
        return Routes.fadeThrough(settings, (context) {
          switch (settings.name) {
            case Routes.welcome:
              return WelcomePage(title: 'welcome');
            case Routes.login:
              return LoginPage(title: 'login');
            case Routes.find:
              return FindPWPage(title: 'find');
            case Routes.home:
              return Home();
            case Routes.request:
              return Home(); //분석 페이지 구현 후 수정
            case Routes.analysis:
              return AnalysisReport();
            case Routes.user:
              return RequestScreen();
            case Routes.payment:
              return PaymentScreen();
            case Routes.fee:
              return FeeInfo();
            defalut:
              return SizedBox.shrink();
          }
        });
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(Routes.welcome);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new MainLoading();
  }
}