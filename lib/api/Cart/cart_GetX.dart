
import 'package:get/get.dart';
import 'package:smart_store/api/Cart/cart_db_controoler.dart';
import 'package:smart_store/helpers/cart_respons.dart';
import 'package:smart_store/model_api/cart.dart';

class CartGetxContriller extends GetxController {
  RxList<Cart> cartsItems = <Cart>[].obs;
  RxBool loading = false.obs;

  static CartGetxContriller get to => Get.find<CartGetxContriller>();

  @override
  void onInit() {
    read();
    super.onInit();
  }

  final CartDbController _dbController = CartDbController();
  double total = 0;
  double quantity = 0;

  Future<processResponse> create(Cart cart) async {
    int index =
    cartsItems.indexWhere((element) => element.productId == cart.productId);

    if (index == -1) {
      int newRowId = await _dbController.create(cart);
      if (newRowId != 0) {
        total += cart.total;
        quantity += 1;
        cart.id = newRowId;
        cartsItems.add(cart);
      }
      return getResponse(newRowId != 0);
    } else {
      int newCount = cartsItems[index].count + 1;
      return changeQuantity(index, newCount);
    }
  }

  void read() async {
    loading.value = true;
    cartsItems.value = await _dbController.read();
    for (Cart cart in cartsItems) {
      total += cart.total;
      quantity += cart.count;
    }
    loading.value = false;
  }

  Future<processResponse> changeQuantity(int index, int count) async {
    bool isDelete = count == 0;
    Cart cart = cartsItems[index];
    bool result = isDelete
        ? await _dbController.delete(cart.id)
        : await _dbController.update(cart);
    if (result) {
      if (isDelete) {
        total -= cart.total;
        quantity -= 1;
        cartsItems.removeAt(index);
      } else {
        cart.count = count;
        cart.total = cart.price * cart.count;
        total += cart.total;
        quantity += 1;
        cartsItems[index] = cart;
      }
    }
    return getResponse(result);
  }

  Future<processResponse> clear() async {
    bool cleared = await _dbController.clear();
    if (cleared) {
      total = 0;
      quantity = 0;
      cartsItems.clear();
    }
    return getResponse(cleared);
  }

  processResponse getResponse(bool success) {
    return processResponse(
      message:
      success ? 'Operation Completed successfully' : 'Operation failed',
      success: success,
    );
  }
}
