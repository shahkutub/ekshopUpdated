
import '../app_config.dart';
import '../data_model/country_list_response.dart';
import 'package:http/http.dart' as http;

import '../helpers/shared_value_helper.dart';

class LocationRepository{

  Future<CountryListResponse> getCountryListResponse() async{
    Uri url = Uri.parse('${AppConfig.BASE_URLV1}mastering/');

    final response = await http.get(url,headers: {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "App-Language": app_language.$,
    },);
    print("CountryListResponse ${response.body}");
    return countryListResponseFromJson(response.body);
  }


  Future<CountryListResponse> getDivisionListResponse(int id) async{
    Uri url = Uri.parse('${AppConfig.BASE_URLV1}mastering/countries/'+id.toString());

    final response = await http.get(url,headers: {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "App-Language": app_language.$,
    },);
    print("CountryListResponse ${response.body}");
    return countryListResponseFromJson(response.body);
  }

  Future<CountryListResponse> getDistrictListResponse(int id) async{
    Uri url = Uri.parse('${AppConfig.BASE_URLV1}mastering/divisions/'+id.toString());

    final response = await http.get(url,headers: {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "App-Language": app_language.$,
    },);
    print("CountryListResponse ${response.body}");
    return countryListResponseFromJson(response.body);
  }

  Future<CountryListResponse> getUpozilaListResponse(int id) async{
    Uri url = Uri.parse('${AppConfig.BASE_URLV1}mastering/districts/'+id.toString());

    final response = await http.get(url,headers: {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "App-Language": app_language.$,
    },);
    print("CountryListResponse ${response.body}");
    return countryListResponseFromJson(response.body);
  }

  Future<CountryListResponse> getUpListResponse(int id) async{
    Uri url = Uri.parse('${AppConfig.BASE_URLV1}mastering/upazilas/'+id.toString());

    final response = await http.get(url,headers: {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "App-Language": app_language.$,
    },);
    print("CountryListResponse ${response.body}");
    return countryListResponseFromJson(response.body);
  }

}