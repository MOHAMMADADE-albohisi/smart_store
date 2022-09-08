class Login {
  late int id;
  late String name;
  String? email;
  late String mobile;
  late String gender;
  late bool active;
  late bool verified;
  late String cityId;
  late String storeId;
  String? fcmToken;
  late String token;
  late String tokenType;
  late String refreshToken;

  late String password;
  late String STORE_API_KEY;

  City? city;
  Store? store;

  Login();

  Login.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    active = json['active'];
    verified = json['verified'];
    cityId = json['city_id'];
    storeId = json['store_id'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }
}

class City {
  late int id;
  late String nameEn;
  late String nameAr;

  City();

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson(City city) {
    final map = <String, dynamic>{};
    map['id'] = city.id;
    map['name_en'] = city.nameEn;
    map['name_ar'] = city.nameAr;
    return map;
  }
}

class Store {
  late int id;
  late dynamic name;
  late dynamic storeName;
  late dynamic email;
  dynamic? emailVerifiedAt;
  late dynamic mobile;
  late dynamic storeUuid;
  late dynamic cityId;
  dynamic? verificationCode;
  late dynamic active;
  late dynamic verified;
  late dynamic firebaseKey;
  dynamic? image;
  late dynamic address;
  dynamic? facebook;
  dynamic? instagram;
  late dynamic createdAt;
  late dynamic updatedAt;

  Store();

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    storeName = json['store_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    storeUuid = json['store_uuid'];
    cityId = json['city_id'];
    verificationCode = json['verification_code'];
    active = json['active'];
    verified = json['verified'];
    firebaseKey = json['firebase_key'];
    image = json['image'];
    address = json['address'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}





