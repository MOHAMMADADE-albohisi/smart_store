import 'package:get/get.dart';
import 'package:smart_store/api/addres_getX_controller.dart';
import 'package:smart_store/model_api/addres.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class AddressGetController extends GetxController {
  List<Address> list = [];
  late bool isLoading = false;
  Address? defaultAddress;

  final AddressApiController _controller = AddressApiController();

  static AddressGetController get to => Get.find<AddressGetController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getAddressList();
  }

  void setDefaultValue(Address address){
    defaultAddress = address;
    update();
  }

  Future<Apiresponse> createNewAddress(Address address) async {
    var res = await _controller.createNewAddress(address: address);
    if (res.status) {
      list.add(res.model!);
    }
    update();
    return res;
  }

  Future<Apiresponse<Address>> updateAddress(Address address) async {
    var res = await _controller.updateAddress(address: address);
    if (res.status) {
      int index = list.indexWhere((element) => address.id == element.id);
      list[index] = address;
    }
    update();
    return res;
  }

  Future<Apiresponse> deleteAddress(int index) async {
    String id = list[index].id.toString();
    var res = await _controller.deleteAddress(id: id);
    if (res.status) {
      list.removeAt(index);
    }
    update();
    return res;
  }



  void _getAddressList() async {
    isLoading = true;
    list = await _controller.getAddresses();
    isLoading = false;
    update();
  }
}
