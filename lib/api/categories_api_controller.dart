import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/login.dart';
import 'package:smart_store/model_api/CategoryApi.dart';
import 'package:smart_store/model_api/DataSubCategore.dart';
import 'package:smart_store/model_api/products.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class CategoreApiContloller {
  Future<ApiResponse<List<CategoryApi>>> getCategory() async {
    Uri uri = Uri.parse(ApiSettings.categories);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor(key: PrefKeys.token.name),
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var jsonList = json["list"] as List;
      List<CategoryApi> list =
          jsonList.map((e) => CategoryApi.fromJson(e)).toList();

      return ApiResponse<List<CategoryApi>>(
          json["message"], json["status"], list);
    }
    return ApiResponse('Something went wrong,try again!', false);
  }

  Future<ApiResponse<List<DataSubCategore>>> getSubCategories(
      {required String categoryId}) async {
    Uri uri = Uri.parse(
        ApiSettings.sub_categories.replaceFirst('{id}', categoryId.toString()));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor(key: PrefKeys.token.name),
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      print("jjss ${jsonObj}");
      print('Test1111112: ${jsonObj.length}');
      List<DataSubCategore> list =
          jsonObj.map((e) => DataSubCategore.fromJson(e)).toList();

      return ApiResponse<List<DataSubCategore>>(
          json["message"], json["status"], list);
    }
    return ApiResponse('Something went wrong,try again!', false);
  }

  Future<ApiResponse<List<products>>> getproducts(
      {required String SubCategorieId}) async {
    Uri uri = Uri.parse(
        ApiSettings.products.replaceFirst('{id}', SubCategorieId.toString()));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor(key: PrefKeys.token.name),
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      print("qqqqqqqqqqqq ${jsonObj}");
      print('wwwwwwwwwwwwww: ${jsonObj.length}');
      List<products> list = jsonObj.map((e) => products.fromJson(e)).toList();

      return ApiResponse<List<products>>(json["message"], json["status"], list);
    }
    return ApiResponse('Something went wrong,try again!', false);
  }


}
