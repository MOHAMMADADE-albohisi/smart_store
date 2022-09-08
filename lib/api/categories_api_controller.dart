// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/CategoryApi.dart';
import 'package:smart_store/model_api/DataSubCategore.dart';
import 'package:smart_store/model_api/products.dart';
import 'package:smart_store/model_api/productsDetails.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class CategoreApiContloller {
  Future<ApiResponse<List<Categories>>> getCategory() async {
    Uri uri = Uri.parse(ApiSettings.categories);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor(key: PrefKeys.token.name),
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var jsonList = json["list"] as List;
      List<Categories> list =
          jsonList.map((e) => Categories.fromJson(e)).toList();

      return ApiResponse<List<Categories>>(
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
      List<DataSubCategore> list =
          jsonObj.map((e) => DataSubCategore.fromJson(e)).toList();

      return ApiResponse<List<DataSubCategore>>(
          json["message"], json["status"], list);
    }
    return ApiResponse('Something went wrong,try again!', false);
  }

  Future<ApiResponse<List<Products>>> getproducts(
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

      List<Products> list = jsonObj.map((e) => Products.fromJson(e)).toList();

      return ApiResponse<List<Products>>(json["message"], json["status"], list);
    }
    return ApiResponse('Something went wrong,try again!', false);
  }

  Future<ApiResponse<List<productsDetails>>> productsDeta(
      {required String productsDetaId}) async {
    Uri uri = Uri.parse(ApiSettings.productsDeta
        .replaceFirst('{id}', productsDetaId.toString()));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor(key: PrefKeys.token.name),
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;

      List<productsDetails> object =
          jsonObj.map((e) => productsDetails.fromJson(e)).toList();

      return ApiResponse<List<productsDetails>>(
          json["message"], json["status"], json["object"]);
    }
    return ApiResponse('Something went wrong,try again!', false);
  }
}
