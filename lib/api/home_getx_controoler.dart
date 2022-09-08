
import 'package:get/get.dart';
import 'package:smart_store/api/home_controller.dart';
import 'package:smart_store/model_api/home.dart';


class HomeGetController extends GetxController {
  Home? home;

  static HomeGetController get to => Get.find<HomeGetController>();

  @override
  void onInit() {
    read();
    super.onInit();
  } // List<Product> products = <Product>[];


  void read() async {
    home = await ProductsApiController().getHomeData();
    update();
  }

}
