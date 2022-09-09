
import 'package:get/get.dart';
import 'package:smart_store/api/payment_api_controller.dart';
import 'package:smart_store/model_api/api_response.dart';

import 'package:smart_store/model_api/payment.dart';

import '../prefs/shared_pref_controller.dart';

class PaymentGetController extends GetxController{
  List<Payment> list = [];
  bool isLoading = false;
  Payment? defaultPayment;

  final PaymentApiController _controller = PaymentApiController();

  static PaymentGetController get to => Get.find<PaymentGetController>();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getPaymentList();
  }

  void _getPaymentList() async {
    isLoading = true;
    list = await _controller.getPaymentCards();
    isLoading = false;
    update();
  }

  Future<Apiresponse> createNewPayment(Payment payment) async {
    var res = await _controller.createNewPaymentCard(payment: payment);
    if(res.status){
      list.add(res.model!);
      update();
    }
    return Apiresponse(message: res.message, status: res.status,model: res.model);
  }

  Future<Apiresponse<Payment>> updatePayment(Payment payment) async {
    var res = await _controller.updatePaymentCard(payment: payment);
    if(res.status){
      int index = list.indexWhere((element) => element.id == payment.id);
      list[index] = payment;
      update();
    }
    return Apiresponse(message: res.message, status: res.status,model: payment);
  }

  Future<Apiresponse> deletePayment(Payment payment) async {
    var res = await _controller.deletePaymentCard(id: payment.id.toString());
    if(res.status){
      list.remove(payment);
      update();
    }
    return Apiresponse(message: res.message, status: res.status);
  }

  void setDefaultPayment(Payment payment){
    SharedPrefController().saveDefaultPayment(payment);
    defaultPayment = payment;
    update();
  }

}