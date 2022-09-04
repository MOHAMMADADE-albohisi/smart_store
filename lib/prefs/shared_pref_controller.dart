import 'package:shared_preferences/shared_preferences.dart';
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

  void save(Login login) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, login.id);
    await _sharedPreferences.setString(PrefKeys.name.name, login.name);
    await _sharedPreferences.setString(PrefKeys.mobile.name, login.mobile);
    await _sharedPreferences.setString(PrefKeys.gender.name, login.gender);
    await _sharedPreferences.setString(PrefKeys.store_id.name, login.storeId);
    await _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${login.token}');
  }

  T? getValueFor<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T?;
    }
    return null;
  }

  void clear() async {
    _sharedPreferences.clear();
  }
}
