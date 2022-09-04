import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/helpers/api_helpr.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/login.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class AuthApiController with ApiHelper {
  ///  New Api Request:
  ///  1) Convert UPI in APISettings from String to URI.
  ///  2) Detect request method (Get, Post, Put/Patch, Delete).
  ///  3) Crate new api request using http.method(uri).
  ///     => In case the request must have a body, set request body using body param in http.method function.
  ///     => body will request a map of key: value
  ///     => kes are defined by web developer, must be same ase defined in postman
  ///     => values are the data entered from UI.
  ///  4) The created request is async future<Response> that returns a response object.
  ///  5) Ensure that the request completed successfully by checking the status code.
  ///  6) If successfully executed, get the Response body:
  ///     => Covert response body from string to JSON using decode
  Future<ApiResponse> login(
      {required String mobile, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(uri, body: {
      'mobile': mobile,
      'password': password,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Login login = Login.fromJson(json['data']);
        //TODO: Save Login in shared Preferences
        SharedPrefController().save(login);
      }
      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }

  Future<ApiResponse> register(Login login) async {
    print('mohamad : ${login.cityId}');
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      'name': login.name,
      'mobile': login.mobile,
      "password": login.password,
      "gender": login.gender,

      "STORE_API_KEY": ApiSettings.STORE_API_KEY,
      "city_id": login.cityId.toString(),
    });

    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }

  Future<ApiResponse> logout() async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return ApiResponse('Logged out successfully', true);
    }
    return errorResponse;
  }
}
