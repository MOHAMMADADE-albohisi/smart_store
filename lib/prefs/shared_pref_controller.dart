import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_store/model_api/addres.dart';
import 'package:smart_store/model_api/login.dart';

enum PrefKeys {
  loggedIn,
  id,
  name,
  email,
  mobile,
  gender,
  city_id,
  store_id,
  token
}

enum AddressPrefKeys { name, info, id, contactNumber, cityId, cityName }

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveDefaultAddress(Address address) {
    _sharedPreferences.setString(AddressPrefKeys.info.name, address.info);
    _sharedPreferences.setInt(AddressPrefKeys.id.name, address.id ?? 0);
    _sharedPreferences.setString(AddressPrefKeys.name.name, address.name);
    _sharedPreferences.setString(
        AddressPrefKeys.contactNumber.name, address.contactNumber);
    _sharedPreferences.setInt(AddressPrefKeys.cityId.name, address.cityId);
  }

  void save(Login login) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, login.id);
    await _sharedPreferences.setString(PrefKeys.name.name, login.name);
    await _sharedPreferences.setString(PrefKeys.mobile.name, login.mobile);
    await _sharedPreferences.setString(PrefKeys.gender.name, login.gender);
    await _sharedPreferences.setString(PrefKeys.store_id.name, login.storeId);
    await _sharedPreferences.setString(
        PrefKeys.token.name, 'Bearer ${login.token}');
  }

  T? getValueFor<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T?;
    }
    return null;
  }

  T? getValuefor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  void clear() async {
    _sharedPreferences.clear();
  }
}
