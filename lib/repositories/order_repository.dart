import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/data_model/review_submit_response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:active_ecommerce_flutter/data_model/order_mini_response.dart';
import 'package:active_ecommerce_flutter/data_model/order_detail_response.dart';
import 'package:active_ecommerce_flutter/data_model/order_item_response.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';

class OrderRepository {
  Future<OrderMiniResponse> getOrderList(
      {page = 1, payment_status = "", delivery_status = ""}) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/purchase-history" +
        "?page=${page}&payment_status=${payment_status}&delivery_status=${delivery_status}");
    print("url:" +url.toString());
    print("token:" +access_token.$);
    final response = await http.get(url,headers: {
      "Authorization": "Bearer ${access_token.$}",
      "App-Language": app_language.$,
        });

    print("res:${response.body}");
    return orderMiniResponseFromJson(response.body);
  }

  Future<OrderDetailResponse> getOrderDetails({@required int id = 0}) async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/purchase-history-details/" + id.toString());

    final response = await http.get(url,headers: {
      "Authorization": "Bearer ${access_token.$}",
          "App-Language": app_language.$,
        });
    //print("url:" +url.toString());
    print(response.body);
    return orderDetailResponseFromJson(response.body);
  }

  Future<OrderItemResponse> getOrderItems({@required int id = 0}) async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/purchase-history-items/" + id.toString());
    final response = await http.get(url,headers: {
      "Authorization": "Bearer ${access_token.$}",
      "App-Language": app_language.$,
        });

    return orderItemlResponseFromJson(response.body);
  }

  Future submitOrder(String pickup,String customer_name,
      String customer_email,String customer_mobile,String customer_alternative_mobile,
      String country,String country_id,String division,String district,String upazila,
      String customer_mail_addr,String discount_amount,String vat,String grand_total,
      String shipping_cost,String total_amount,String merchant,String store,String customer_info,
      String product,String payment_type,String api_from,) async {
    var map = new Map<String, dynamic>();
    map['pickup'] = pickup;
    map['customer_name'] = customer_name;
    map['customer_email'] = customer_email;
    map['customer_mobile'] = customer_mobile;
    map['customer_alternative_mobile'] = customer_alternative_mobile;
    map['country'] = country;
    map['country_id'] = country_id;
    map['division'] = division;
    map['district'] = district;
    map['upazila'] = upazila;
    map['customer_mail_addr'] = customer_mail_addr;
    map['discount_amount'] = discount_amount;
    map['vat'] = vat;
    map['grand_total'] = grand_total;
    map['shipping_cost'] = shipping_cost;
    map['total_amount'] = total_amount;
    map['merchant'] = merchant;
    map['store'] = store;
    map['customer_info'] = customer_info;
    map['product'] = product;
    map['payment_type'] = payment_type;
    map['api_from'] = api_from;

    print(map);
    Uri url = Uri.parse("${AppConfig.BASE_URLV1}order/create");
    final response = await http.post(url,
        headers: {
          "Accept": "*/*",
         // "Content-Type": "application/json",
          "App-Language": app_language.$,
        },
        body: map);
    print(response.body.toString());
    //return St(response.body);
    // return response.body.toString();
  }


}
