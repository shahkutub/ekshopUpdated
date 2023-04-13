

import 'dart:convert';

CustomerInformationResponse customer_info_responseFromJson(String str) => CustomerInformationResponse.fromJson(json.decode(str));

//String userByTokenResponseToJson(customer_reg_response data) => json.encode(data.toJson());


class CustomerInformationResponse {
  DataCustomerInfo data;
    bool success;

    CustomerInformationResponse({this.data, this.success});

    factory CustomerInformationResponse.fromJson(Map<String, dynamic> json) {
        return CustomerInformationResponse(
            data: json['data'] != null ? DataCustomerInfo.fromJson(json['data']) : null,
            success: json['success'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['success'] = this.success;
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}

class DataCustomerInfo {
    String id;
    String email;
    String name;
    String phone;

    DataCustomerInfo({this.id, this.email, this.name, this.phone});

    factory DataCustomerInfo.fromJson(Map<String, dynamic> json) {
        return DataCustomerInfo(
            id: json['_id'],
            email: json['email'],
            name: json['name'],
            phone: json['phone'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['_id'] = this.id;
        data['email'] = this.email;
        data['name'] = this.name;
        data['phone'] = this.phone;
        return data;
    }
}