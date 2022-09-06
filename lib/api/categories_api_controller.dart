import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/login.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class CategoreApiContloller {
  Future<ApiResponse<List<CategoryApi>>> getCategory() async {
    Uri uri = Uri.parse('https://smart-store.mr-dev.tech/api/categories');
    print('Test: ${uri}');
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor(key: PrefKeys.token.name),
    });
    if (response.statusCode == 200) {
      print('Test: ${response.body}');
      var json = jsonDecode(response.body);
      var jsonList = json["list"] as List;
      List<CategoryApi> list =
          jsonList.map((e) => CategoryApi.fromJson(e)).toList();

      return ApiResponse<List<CategoryApi>>(
          json["message"], json["status"], list);
    }
    return ApiResponse('Something went wrong,try again!', false);
  }
}

class SubCategoryController {
  Future<List<DataSubCategore>> getSubCategory() async {
    Uri uri = Uri.parse(ApiSettings.sub_categories);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print('Tesstttt: ${response.body}');
      var dataJsonObject = json['data'] as List;
      return dataJsonObject
          .map((jsonObject) => DataSubCategore.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
}



