import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/order/createprder.dart';
import 'package:smart_store/model_api/order/faqs.dart';
import 'package:smart_store/model_api/order/order_detiles.dart';
import 'package:smart_store/model_api/order/orders.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';



class OrderApiController {
  final _token = SharedPrefController().getValueFor(key: PrefKeys.token.name);

  Future<Apiresponse<List<Order>>> getOredersList() async {
    Uri uri = Uri.parse(ApiSettings.orders.replaceFirst('/{id}', ""));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      final list = jsonObj.map((e) => Order.fromJson(e)).toList();
      return Apiresponse<List<Order>>(
        message: json["message"],
        status: json["status"],
        model: list,
      );
    }
    return Apiresponse<List<Order>>(
      message: "Something going wrong!",
      status: false,
    );
  }

  Future<Apiresponse<OrderDetails>> getOrderDetails(
      {required String id}) async {
    Uri uri = Uri.parse(ApiSettings.orders.replaceFirst('{id}', id));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });
    print("state ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonObj = json["data"];
      var data = OrderDetails.fromJson(jsonObj);
      return Apiresponse<OrderDetails>(
        message: json["message"],
        status: json["status"],
        model: data,
      );
    }
    return Apiresponse<OrderDetails>(
      message: "Something going wrong!",
      status: false,
    );
  }

  Future<Apiresponse> createOrder({required CreateOrder order}) async {
    Uri uri = Uri.parse(ApiSettings.orders.replaceFirst('/{id}', ""));
    var response = await http.post(
      uri,
      body: {
        "payment_type" : order.paymentType,
        "address_id" : order.addressId,
        "cart" : order.cartList
      },
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return Apiresponse(
        message: json["message"],
        status: true,
      );
    }
    return Apiresponse(
      message: "Something going wrong!",
      status: false,
    );
  }


  Future<List<Faq>> getFaqs() async {
    Uri uri = Uri.parse(ApiSettings.faqs);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      final list = jsonObj.map((e) => Faq.fromJson(e)).toList();
      return list;
    }
    return [];
  }
}