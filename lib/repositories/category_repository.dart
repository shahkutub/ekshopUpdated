import 'dart:convert';

import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:active_ecommerce_flutter/data_model/category_response.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';

import '../data_model/category_responsev1.dart';

class CategoryRepository {
  Future<CategoryResponse> getCategories({parent_id = 0}) async {
    Uri url =
        Uri.parse("${AppConfig.BASE_URL}/categories?parent_id=${parent_id}");
    final response = await http.get(url, headers: {
      "App-Language": app_language.$,
    });
    // print("${AppConfig.BASE_URL}/categories?parent_id=${parent_id}");
    // print(response.body.toString());
    return categoryResponseFromJson(response.body);
  }

  Future<List<CategoryV1>> getFeturedCategories() async {
    final List<CategoryV1> categoryList = [];
    Uri url = Uri.parse(AppConfig.BASE_URLV1 +
        "product/general_categorie/list?user_id=" +
        merchant_id.$);
    final response = await http.get(
      url,
      headers: {
        "App-Language": app_language.$,
      },
    );
    print(response.body.toString());
    for (Map<String, dynamic> slider in json.decode(response.body)['data']) {
      categoryList.add(CategoryV1.fromJson(slider));
    }
    return categoryList;
  }

  Future<CategoryResponse> getTopCategories() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/categories/top");
    final response = await http.get(url, headers: {
      "App-Language": app_language.$,
    });
    return categoryResponseFromJson(response.body);
  }

  Future<CategoryResponse> getFilterPageCategories() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/filter/categories");
    final response = await http.get(url, headers: {
      "App-Language": app_language.$,
    });
    return categoryResponseFromJson(response.body);
  }
}
