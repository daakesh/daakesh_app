import 'package:daakesh/src/features/features.export.dart';

class HandmadeModel {
  bool? status;
  String? error;
  HandmadeData? data;

  HandmadeModel({
    this.status,
    this.error,
    this.data,
  });

  HandmadeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? HandmadeData.fromJson(json['data']) : null;
  }
}

class HandmadeData {
  int? lastPage;
  List<HandmadeItem>? handmadeItemList;

  HandmadeData({
    this.lastPage,
    this.handmadeItemList,
  });

  HandmadeData.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    if (json['data'] != null) {
      handmadeItemList = <HandmadeItem>[];
      handmadeItemList = (json['data'] as List<dynamic>).map((e) => HandmadeItem.fromJson(e)).toList();
    }
  }
}

class HandmadeItem {
  int? id;
  String? description;
  dynamic itemImg;
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
  SectionItemModel? section;
  UserModel? user;
  CategoryItem? category;
  BrandItem? brand;
  SubCategory? subcategory;
  HandmadeItem(
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
      this.section,
      this.user,
      this.category,
      this.brand,
      this.subcategory});

  HandmadeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    itemImg = json['itemImg'];
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
    section = json['section'] != null ? SectionItemModel.fromJson(json['section']) : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    category = json['category'] != null ? CategoryItem.fromJson(json['category']) : null;
    brand = json['brand'] != null ? BrandItem.fromJson(json['brand']) : null;
    subcategory = json['subcategory'] != null ? SubCategory.fromJson(json['subcategory']) : null;




  }
}
