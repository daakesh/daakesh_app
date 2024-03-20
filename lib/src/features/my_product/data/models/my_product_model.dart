import '../../../../src.export.dart';

class MyProductModel {
  bool? status;
  String? error;
  MyProductData? data;

  MyProductModel({this.status, this.error, this.data});

  MyProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? MyProductData.fromJson(json['data']) : null;
  }

}

class MyProductData {
  int? lastPage;
  List<MyProductItem>? myProductListData;
  MyProductData({
    this.lastPage,
    this.myProductListData,
  });

  MyProductData.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    if (json['data'] != null) {
      myProductListData = <MyProductItem>[];
      myProductListData = (json['data'] as List<dynamic>)
          .map((v) => MyProductItem.fromJson(v))
          .toList();
    }
  }


}

class MyProductItem {
  int? id;
  String? description;
  List<String>? itemImg;
  String? date;
  String? title;
  String? type;
  String? swapFor;
  String? city;
  String? year;
  String? condition;
  dynamic price;
  double? discount;
  String? discountFrom;
  String? discountTo;
  String? country;
  String? createdAt;
  String? updatedAt;
  int? quantity;
  String? display;
  String? countrySwap;
  String? citySwap;
  UserModel? user;
  MyProductCategory? category;
  BrandItem? brand;
  SubCategory? subcategory;
  SectionItemModel? section;

  MyProductItem(
      {this.id,
        this.description,
        this.itemImg,
        this.date,
        this.title,
        this.type,
        this.swapFor,
        this.city,
        this.year,
        this.condition,
        this.price,
        this.discount,
        this.discountFrom,
        this.discountTo,
        this.country,
        this.createdAt,
        this.updatedAt,
        this.quantity,
        this.display,
        this.countrySwap,
        this.citySwap,
        this.user,
        this.category,
        this.brand,
        this.subcategory,
        this.section});

  MyProductItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if(json['itemImg'] != null){
      itemImg = <String>[];
      itemImg = (json['itemImg']as List<dynamic>).map((e) => e.toString()).toList();
    }
    description = json['description'];
    date = json['date'];
    title = json['Title'];
    type = json['Type'];
    swapFor = json['Swap For'];
    city = json['City'];
    year = json['Year'];
    condition = json['Condition'];
    price = json['Price'];
    discount = json['discount'];
    discountFrom = json['discount_from'];
    discountTo = json['discount_to'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    quantity = json['quantity'];
    display = json['display'];
    countrySwap = json['country_swap'];
    citySwap = json['city_swap'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    category = json['category'] != null ? MyProductCategory.fromJson(json['category']) : null;
    brand = json['brand'] != null ? BrandItem.fromJson(json['brand']) : null;
    subcategory = json['subcategory'] != null ?  SubCategory.fromJson(json['brand']) : null;
    section = json['section'] != null ? SectionItemModel.fromJson(json['section']) : null;
  }


}


class MyProductCategory {
  int? id;
  String? name;
  String? description;
  String? catImg;
  String? date;
  int? secID;
  String? arName;

  MyProductCategory(
      {this.id,
        this.name,
        this.description,
        this.catImg,
        this.date,
        this.secID,
        this.arName});

  MyProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    catImg = json['catImg'];
    date = json['date'];
    secID = json['secID'];
    arName = json['arName'];
  }
}

