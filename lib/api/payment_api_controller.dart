import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/payment.dart';

import '../../prefs/shared_pref_controller.dart';

class PaymentApiController {
  final _token = SharedPrefController().getValueFor(key: PrefKeys.token.name);

  Future<List<Payment>> getPaymentCards() async {
    Uri uri = Uri.parse(ApiSettings.paymentCards.replaceFirst('/{id}', ""));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      final list = jsonObj.map((e) => Payment.fromJson(e)).toList();
      return list;
    }
    return [];
  }

  Future<Apiresponse<Payment>> createNewPaymentCard(
      {required Payment payment}) async {
    Uri uri = Uri.parse(ApiSettings.paymentCards.replaceFirst('/{id}', ""));
    var response = await http.post(
      uri,
      body: payment.toJson(),
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 201) {
        var jsonObj = json["object"];
        return Apiresponse<Payment>(
          message: json["message"],
          status: json["status"],
          model: Payment.fromJson(jsonObj),
        );
      } else {
        return Apiresponse<Payment>(
          message: json["message"],
          status: json["status"],
        );
      }
    }
    return Apiresponse<Payment>(
      message: "Something going wrong!",
      status: false,
    );
  }

  Future<Apiresponse> updatePaymentCard({required Payment payment}) async {
    Uri uri = Uri.parse(
        "${ApiSettings.paymentCards.replaceFirst('{id}', payment.id.toString())}?exp_date=${payment.expDate}");
    var response = await http.put(
      uri,
      body: payment.toJson(),
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return Apiresponse(
        message: json["message"],
        status: json["status"],
      );
    }
    return Apiresponse(
      message: "Something going wrong!",
      status: false,
    );
  }

  Future<Apiresponse> deletePaymentCard({required String id}) async {
    Uri uri = Uri.parse(ApiSettings.paymentCards.replaceFirst('{id}', id));
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
}
