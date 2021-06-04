import 'dart:io';

import 'package:http/http.dart' as http;

postRequest() async {
  String url = 'http://10.0.2.2:8000/admin/get_water_info/analysisdata/';

  await http.post(url, headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
    HttpHeaders.authorizationHeader: 'csrf_token'
  }, body: {
    'sql': 'select * from AnalysisData'
  }).then((response) {
    print(response.body);
  });
  //return response;
}

Future<http.Response> postRequest_user(user) async {
  String url = 'http://10.0.2.2:8000/';

  http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      'X-CSRF-TOKEN': 'csrf_token',
    },
    body: <String, String>{
      "sql": "select * from AnalysisData where name='${user}'"
    },
  );
  return response;
}
