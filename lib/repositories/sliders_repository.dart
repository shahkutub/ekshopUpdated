import 'dart:convert';

import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/data_model/slider_responsev1.dart';
import 'package:http/http.dart' as http;
import 'package:active_ecommerce_flutter/data_model/slider_response.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';

class SlidersRepository {
  Future<List<SliderV1>> getSliders() async {
    final List<SliderV1> sliderList = [];
    Uri url = Uri.parse(
        "http://192.168.68.127:8081/ekshop/theme/slider/list?user_id=63fa3cd15595d06245a950ed");
    final response = await http.get(
      url,
      headers: {
        "App-Language": app_language.$,
      },
    );
    print(response.body.toString());
    for (Map<String, dynamic> slider in json.decode(response.body)['data']) {
      sliderList.add(SliderV1.fromJson(slider));
    }
    return sliderList;
  }

  Future<SliderResponse> getBannerOneImages() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/banners-one");
    final response = await http.get(
      url,
      headers: {
        "App-Language": app_language.$,
      },
    );
    /*print(response.body.toString());
    print("sliders");*/
    return sliderResponseFromJson(response.body);
  }

  Future<SliderResponse> getBannerTwoImages() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/banners-two");
    final response = await http.get(
      url,
      headers: {
        "App-Language": app_language.$,
      },
    );
    /*print(response.body.toString());
    print("sliders");*/
    return sliderResponseFromJson(response.body);
  }

  Future<SliderResponse> getBannerThreeImages() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/banners-three");
    final response = await http.get(
      url,
      headers: {
        "App-Language": app_language.$,
      },
    );
    /*print(response.body.toString());
    print("sliders");*/
    return sliderResponseFromJson(response.body);
  }
}
