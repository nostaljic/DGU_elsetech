import 'package:http/http.dart' as http;

Future<http.Response> postRequest() async {
  String url = 'https://10.0.2.2:8000/get_water_info/';

  http.Response response = await http.post(
    url,
    headers: <String, String> {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: <String, String> {
      "sql":"select * from AnalysisData"
    },
  );
  return response;
}
Future<http.Response> postRequest_user(user) async {
  String url = 'http://10.0.2.2:8000/';

  http.Response response = await http.post(
    url,
    headers: <String, String> {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: <String, String> {
      "sql":"select * from AnalysisData where name='${user}'"
    },
  );
  return response;
}
