import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/model_api/addres.dart';
import 'package:smart_store/model_api/api_response.dart';

import '../../prefs/shared_pref_controller.dart';
import '../prefs/shared_pref_controller.dart';

class AddressApiController {
  final _token = SharedPrefController().getValueFor(key: PrefKeys.token.name);

  Future<List<Address>> getAddresses() async {
    Uri uri = Uri.parse(ApiSettings.addresses.replaceFirst('/{id}', ""));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      final list = jsonObj.map((e) => Address.fromJson(e)).toList();
      return list;
    }
    return [];
  }

  Future<Apiresponse> createNewAddress({required Address address}) async {
    Uri uri = Uri.parse(ApiSettings.addresses.replaceFirst('/{id}', ""));
    var response = await http.post(
      uri,
      body: address.toJson(),
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return Apiresponse<Address>(
          message: json["message"],
          status: json["status"],
          model: Address.fromJson(json["object"]));
    }
    return Apiresponse<Address>(
        message: "Something going wrong!", status: false);
  }

  Future<Apiresponse> deleteAddress({required String id}) async {
    Uri uri = Uri.parse(ApiSettings.addresses.replaceFirst('{id}', id));
    var response = await http.delete(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return Apiresponse(message: json["message"], status: true);
    }
    return Apiresponse(message: "Something going wrong!", status: false);
  }

  Future<Apiresponse<Address>> updateAddress({required Address address}) async {
    String queryString = Uri(queryParameters: address.toJson()).query;
    var requestUrl = Uri.parse(
        "${ApiSettings.addresses.replaceFirst('{id}', address.id.toString())}?$queryString");
    var response = await http.put(
      requestUrl,
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return Apiresponse<Address>(
          message: json["message"], status: json["status"]);
    }
    return Apiresponse<Address>(
        message: "Something going wrong!", status: false);
  }
}
