// @dart=2.9
import 'package:dgu_elsetech/route.dart';
import 'package:dgu_elsetech/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:dgu_elsetech/widget/main_loading.dart';
import 'package:dgu_elsetech/screen/home.dart';
import 'package:dgu_elsetech/screen/fee_information.dart';
import 'package:dgu_elsetech/screen/analysis_report.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Index Map',
      home: Home(),
      initialRoute: Routes.home,
      onGenerateRoute: (RouteSettings settings) {
        return Routes.fadeThrough(settings, (context) {
          switch (settings.name) {
            case Routes.home:
              return Home();
            case Routes.request:
              return Home(); //분석 페이지 구현 후 수정
            case Routes.analysis:
              return AnalysisReport();
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