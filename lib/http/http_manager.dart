import 'dart:convert';

import 'package:hsfx/http/api.dart';
import 'package:http/http.dart' as http;

class HttpManager {

  Future<dynamic> requestSlider() async {
    return await get(API.SLIDERS);
  }

  Future<String> requestHomeCourse () async {

    var url = "http://edu.huashifengxing.com/api/v2/index/banners";
    var response = await http.get(url);
    return response.body;
  }

  Future<dynamic> get(String uri, {Map<String, String> headers}) async {
    try {
      http.Response response = await http.get(API.BASE_URL + uri, headers: headers);
      final statusCode = response.statusCode;
      if (statusCode != 200) {
        print("网络请求错误，请重试！");
        return '';
      }

      final responseBody = response.body;
      var result = json.decode(responseBody);

      if (result['code'] != 0) {
        print(result['message']);
        return '';
      }

      return result;
    } on Exception catch(e) {
      print('[uri=$uri]exception e=${e.toString()}');
      return '';
    }
  }

  Future<dynamic> post(String uri, {Map<String, String> headers, body}) async {
    try {
      http.Response response = await http.post(API.BASE_URL + uri, headers: headers, body: body);
      final statusCode = response.statusCode;
      if (statusCode != 200) {
        print("网络请求错误，请重试！");
        return '';
      }

      final responseBody = response.body;
      var result = json.decode(responseBody);
      if (result['code'] != 0) {
        print(result['message']);
        return '';
      }

      return result;
    } on Exception catch(e) {
      print('[uri=$uri]exception e=${e.toString()}');
      return '';
    }
  }


}