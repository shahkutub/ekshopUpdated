
import 'dart:convert';


CountryListResponse countryListResponseFromJson(String str) => CountryListResponse.fromJson(json.decode(str));


class CountryListResponse {
    List<CountryData> country_data;

    CountryListResponse({this.country_data});

    factory CountryListResponse.fromJson(Map<String, dynamic> json) {
        return CountryListResponse(
            country_data: json['data'] != null ? (json['data'] as List).map((i) => CountryData.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.country_data != null) {
            data['data'] = this.country_data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class CountryData {
    String bn_name;
    String created_at;
    int id;
    String name;
    String url;

    CountryData({this.bn_name, this.created_at, this.id, this.name, this.url});

    factory CountryData.fromJson(Map<String, dynamic> json) {
        return CountryData(
            bn_name: json['bn_name'],
            created_at: json['created_at'],
            id: json['id'],
            name: json['name'],
            url: json['url'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['bn_name'] = this.bn_name;
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['name'] = this.name;
        data['url'] = this.url;
        return data;
    }
}