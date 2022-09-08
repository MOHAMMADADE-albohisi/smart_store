
class productsDetails {
  int? id;
  String? nameEn;
  String? nameAr;
  String? infoEn;
  String? infoAr;
  String? price;
  String? quantity;
  String? overalRate;
  String? subCategoryId;
  int? productRate;
  Null? offerPrice;
  bool? isFavorite;
  String? imageUrl;
  List<Images>? images;
  SubCategory? subCategory;

  productsDetails(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.infoEn,
        this.infoAr,
        this.price,
        this.quantity,
        this.overalRate,
        this.subCategoryId,
        this.productRate,
        this.offerPrice,
        this.isFavorite,
        this.imageUrl,
        this.images,
        this.subCategory});

  productsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    subCategory = json['sub_category'] != null
        ? new SubCategory.fromJson(json['sub_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['info_en'] = this.infoEn;
    data['info_ar'] = this.infoAr;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['overal_rate'] = this.overalRate;
    data['sub_category_id'] = this.subCategoryId;
    data['product_rate'] = this.productRate;
    data['offer_price'] = this.offerPrice;
    data['is_favorite'] = this.isFavorite;
    data['image_url'] = this.imageUrl;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.toJson();
    }
    return data;
  }
}

class Images {
  int? id;
  String? objectId;
  String? url;
  String? imageUrl;

  Images({this.id, this.objectId, this.url, this.imageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object_id'] = this.objectId;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class SubCategory {
  int? id;
  String? nameEn;
  String? nameAr;
  String? categoryId;
  String? image;
  String? imageUrl;

  SubCategory(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.categoryId,
        this.image,
        this.imageUrl});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    categoryId = json['category_id'];
    image = json['image'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    return data;
  }
}