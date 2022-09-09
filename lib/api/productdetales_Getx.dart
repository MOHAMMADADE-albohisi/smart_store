import 'package:get/get.dart';
import 'package:smart_store/api/home_controller.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/home.dart';
import 'package:smart_store/model_api/products.dart';

class ProductsGetController extends GetxController {
  List<Products> favoriteList = [];
  bool isLoading = false;
  Home? home;

  static ProductsGetController get to => Get.find<ProductsGetController>();

  final ProductsApiController _controller = ProductsApiController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<Products> getProductDetails(String productId) async {
    return await _controller.getProductDetails(productId: productId);
  }
}
