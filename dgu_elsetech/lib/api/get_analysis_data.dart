import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Future<String> getCsrftoken() async {
//   var response =
//   await http.get(Uri.encodeFull('http://10.0.2.2:8000/admin/'));
//   var csrftoken =
//   response.headers.remove('set-cookie').substring(10, 74); //csrf 64 chars
//   return csrftoken;
// }

postRequest() async {
  String url = 'http://10.0.2.2:8000/admin/get_water_info/analysisdata/';

  var response = await http.post(Uri.encodeFull(url), headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded',
  }, body: <String, String>{
    'sql': 'select * from AnalysisData'
  }).then((response) {
    print(utf8.decode(response.bodyBytes));
  });
  return response;
}

Future<http.Response> postRequest_user(user) async {
  String url = 'http://10.0.2.2:8000/';

  http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: <String, String>{
      "sql": "select * from AnalysisData where name='${user}'"
    },
  );
  return response;
}
