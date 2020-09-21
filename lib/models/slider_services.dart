import 'dart:async' show Future;
import 'package:hsfx/http/http_manager.dart';

import 'slider.dart';

class SliderServices {
  static Future<List<HSlider>> loadSlider() async {
    List<HSlider> sliderList = List();
    final jsonResponse = await HttpManager().requestSlider();
    var slidersFromJson = jsonResponse['data'] as List;
    sliderList = slidersFromJson.map((e) => HSlider.fromJson(e)).toList();
    return sliderList;
  }
}

