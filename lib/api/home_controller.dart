import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/helpers/api_helpr.dart';
import 'package:smart_store/model_api/home.dart';
import 'package:smart_store/model_api/products.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class ProductsApiController with ApiHelper {
  Future<void> product() async {
    Future<List<Products>> getProducts({required int subCategoryId}) async {
      String token =
          SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
      Uri uri = Uri.parse(
          ApiSettings.home.replaceFirst('{id}', subCategoryId.toString()));
      var response = await http.get(uri, headers: {
        HttpHeaders.authorizationHeader: token,
        HttpHeaders.acceptHeader: 'application/json',
      });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var dataJsonObject = json['list'] as List;
        return dataJsonObject
            .map((jsonObject) => Products.fromJson(jsonObject))
            .toList();
      }
      return [];
    }
  }

  Future<Products> getProductDetails({required String productId}) async {
    Uri uri =
        Uri.parse(ApiSettings.productsDeta.replaceFirst('{id}', productId));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor(key: PrefKeys.token.name),
    });

    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      var jsonObj = json["object"] as Map<String, dynamic>;
      Products product = Products.fromJson(jsonObj);
      return product;
    }
    return Products();
  }

  Future<Home> getHomeData() async {
    Uri uri = Uri.parse(ApiSettings.home);
    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor(key: PrefKeys.token.name),
    });

    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return Home.fromJson(json["data"]);
    }
    return Home();
  }
}
