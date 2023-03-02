

import 'dart:convert';

FindMerchantByStore findMerchantByStoreFromJson(String str) => FindMerchantByStore.fromJson(json.decode(str));

String loginResponseToJson(FindMerchantByStore data) => json.encode(data.toJson());

class FindMerchantByStore {
    List<Data> data;
    bool success;

    FindMerchantByStore({this.data, this.success});

    factory FindMerchantByStore.fromJson(Map<String, dynamic> json) {
        return FindMerchantByStore(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null,
            success: json['success'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['success'] = this.success;
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Data {
    int v;
    String id;
    String api_token;
    String createdAt;
    bool document_updated;
    String email;
    int email_otp;
    bool email_verified;
    String image;
    bool is_admin;
    bool is_customer;
    bool is_merchant;
    String language;
    List<Object> login_info;
    String merchant_type_id;
    String merchant_type_name;
    bool muktopath_user;
    String name;
    String password;
    String phone;
    int phone_otp;
    bool phone_verified;
    String phonecode;
    List<Object> profile_in_verification_fields;
    String profile_status;
    String provider;
    List<Object> role_ids;
    List<Object> roles;
    String salt;
    int status;
    String store_name;
    String store_url;
    int total_canceled_order;
    int total_delivered_order;
    int total_order;
    int total_pending_order;
    int total_wallet_point;
    String type;
    String updatedAt;
    bool verified;

    Data({this.v, this.id, this.api_token, this.createdAt, this.document_updated, this.email, this.email_otp, this.email_verified, this.image, this.is_admin, this.is_customer, this.is_merchant, this.language, this.login_info, this.merchant_type_id, this.merchant_type_name, this.muktopath_user, this.name, this.password, this.phone, this.phone_otp, this.phone_verified, this.phonecode, this.profile_in_verification_fields, this.profile_status, this.provider, this.role_ids, this.roles, this.salt, this.status, this.store_name, this.store_url, this.total_canceled_order, this.total_delivered_order, this.total_order, this.total_pending_order, this.total_wallet_point, this.type, this.updatedAt, this.verified});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            v: json['__v'],
            id: json['_id'],
            api_token: json['api_token'],
            createdAt: json['createdAt'],
            document_updated: json['document_updated'],
            email: json['email'],
            email_otp: json['email_otp'],
            email_verified: json['email_verified'],
            image: json['image'],
            is_admin: json['is_admin'],
            is_customer: json['is_customer'],
            is_merchant: json['is_merchant'],
            language: json['language'],
            merchant_type_id: json['merchant_type_id'],
            merchant_type_name: json['merchant_type_name'],
            muktopath_user: json['muktopath_user'],
            name: json['name'],
            password: json['password'],
            phone: json['phone'],
            phone_otp: json['phone_otp'],
            phone_verified: json['phone_verified'],
            phonecode: json['phonecode'],
            profile_status: json['profile_status'],
            provider: json['provider'],
            salt: json['salt'],
            status: json['status'],
            store_name: json['store_name'],
            store_url: json['store_url'],
            total_canceled_order: json['total_canceled_order'],
            total_delivered_order: json['total_delivered_order'],
            total_order: json['total_order'],
            total_pending_order: json['total_pending_order'],
            total_wallet_point: json['total_wallet_point'],
            type: json['type'],
            updatedAt: json['updatedAt'],
            verified: json['verified'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['__v'] = this.v;
        data['_id'] = this.id;
        data['api_token'] = this.api_token;
        data['createdAt'] = this.createdAt;
        data['document_updated'] = this.document_updated;
        data['email'] = this.email;
        data['email_otp'] = this.email_otp;
        data['email_verified'] = this.email_verified;
        data['image'] = this.image;
        data['is_admin'] = this.is_admin;
        data['is_customer'] = this.is_customer;
        data['is_merchant'] = this.is_merchant;
        data['language'] = this.language;
        data['merchant_type_id'] = this.merchant_type_id;
        data['merchant_type_name'] = this.merchant_type_name;
        data['muktopath_user'] = this.muktopath_user;
        data['name'] = this.name;
        data['password'] = this.password;
        data['phone'] = this.phone;
        data['phone_otp'] = this.phone_otp;
        data['phone_verified'] = this.phone_verified;
        data['phonecode'] = this.phonecode;
        data['profile_status'] = this.profile_status;
        data['provider'] = this.provider;
        data['salt'] = this.salt;
        data['status'] = this.status;
        data['store_name'] = this.store_name;
        data['store_url'] = this.store_url;
        data['total_canceled_order'] = this.total_canceled_order;
        data['total_delivered_order'] = this.total_delivered_order;
        data['total_order'] = this.total_order;
        data['total_pending_order'] = this.total_pending_order;
        data['total_wallet_point'] = this.total_wallet_point;
        data['type'] = this.type;
        data['updatedAt'] = this.updatedAt;
        data['verified'] = this.verified;

        return data;
    }
}