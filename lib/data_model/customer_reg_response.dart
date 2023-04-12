
import 'dart:convert';

customer_reg_response customer_reg_responseFromJson(String str) => customer_reg_response.fromJson(json.decode(str));

String userByTokenResponseToJson(customer_reg_response data) => json.encode(data.toJson());

class customer_reg_response {
    String msg;
    bool success;

    customer_reg_response({this.msg, this.success});

    factory customer_reg_response.fromJson(Map<String, dynamic> json) {
        return customer_reg_response(
            msg: json['msg'], 
            success: json['success'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['msg'] = this.msg;
        data['success'] = this.success;
        return data;
    }
}