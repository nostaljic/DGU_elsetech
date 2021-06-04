import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
List<Map<dynamic, dynamic>> marker_info = [];
//  {
//     "public_ph": 0.3,
//     "public_rc": 0.4,
//     "public_tb": 0.5,
//     "longitude": 127.0317674,
//     "latitude": 37.6658609,
//     "member_id": "test_id",
//     "request_date": "2021-05-20",
//     "name": "박승일",
//     "water_origin": "000 정수장",
//     "fe_origin": 0.0,
//     "turbidity": 0.0,
//     "date": 1,
//     "fe_user": 1.0,
//     "mn_user": 0.0,
//     "al_user": 0.0,
//     "img": "이미지 URL",
//     "total": "경고"
//   },
//   {
//     "public_ph": 0.3,
//     "public_rc": 0.4,
//     "public_tb": 0.5,
//     "longitude": 126.9227004,
//     "latitude": 37.6176125,
//     "member_id": "test_id",
//     "request_date": "2021-05-20",
//     "name": "박승일",
//     "water_origin": "000 정수장",
//     "fe_origin": 0.0,
//     "turbidity": 0.0,
//     "date": 1,
//     "fe_user": 0.0,
//     "mn_user": 2.0,
//     "al_user": 0.0,
//     "img": "이미지 URL",
//     "total": "안전"
//   },
//   {
//     "public_ph": 0.3,
//     "public_rc": 0.7,
//     "public_tb": 0.5,
//     "longitude": 126.834086,
//     "latitude": 37.412294,
//     "member_id": "test_id",
//     "request_date": "2021-05-20",
//     "name": "박승일",
//     "water_origin": "000 정수장",
//     "fe_origin": 0.0,
//     "turbidity": 0.0,
//     "date": 1,
//     "fe_user": 0.0,
//     "mn_user": 0.0,
//     "al_user": 3.0,
//     "img": "이미지 URL",
//     "total": "경고"
//   },
postRequest() async {
  var url = Uri.parse('http://10.0.2.2:8000/get_water_info/?sql=select * from AnalysisData');

  http.Response response = await http.get(url);
  try {
    if (response.statusCode == 200) {
      String data = response.body;

      List<Map<dynamic,dynamic>> list =[];
      Map jsonObject = json.decode(data);
      for(int i=0; i<jsonObject.length;i++){
        Map jsonObject1 = json.decode(json.encode(jsonObject["data${i}"]));
        list.add(jsonObject1);
      }
      print(list[0]['member_id']);
      marker_info=list;
      return list;
    } else {
      return 'failed';
    }
  } catch (e) {
    return 'failed';
  }
}

