import 'package:daakesh/src/features/features.export.dart';

class TodayItemModel {
  bool? status;
  String? error;
  TodayItemData? data;

  TodayItemModel({
    this.status,
    this.error,
    this.data,
  });

  TodayItemModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? TodayItemData.fromJson(json['data']) : null;
  }
}

class TodayItemData {
  int? lastPage;
  List<TodayItem>? todayItemList;

  TodayItemData({
    this.lastPage,
    this.todayItemList,
  });

  TodayItemData.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    if (json['data'] != null) {
      todayItemList = <TodayItem>[];
      todayItemList = (json['data'] as List<dynamic>)
          .map((e) => TodayItem.fromJson(e))
          .toList();
    }
  }
}

class TodayItem {
  int? id;
  String? description;
  List<String>? itemImg;
  String? date;
  dynamic priceAfterDiscount;
  String? discountPercentage;
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

  int? rateCount;
  double? averageRating;

  SectionItemModel? section;
  UserModel? user;
  CategoryItem? category;
  BrandItem? brand;
  SubCategory? subcategory;
  TodayItem(
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
      this.rateCount,
      this.averageRating,
      this.discountTo,
      this.country,
      this.section,
      this.user,
      this.category,
      this.brand,
      this.subcategory});

  TodayItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    }
    priceAfterDiscount = json['price_after_discount'];
    discountPercentage = json['discount_percentage'];
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
    rateCount = json['rate_count'];
    if (json['avarageRating'] is int) {
      averageRating = json['avarageRating'].toDouble();
    }
    if (json['avarageRating'] is String) {
      averageRating = double.parse(json['avarageRating']);
    }
    //json['avarageRating'] ?? 0.0;
    section = json['section'] != null
        ? SectionItemModel.fromJson(json['section'])
        : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    category = json['category'] != null
        ? CategoryItem.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? BrandItem.fromJson(json['brand']) : null;
    subcategory = json['subcategory'] != null
        ? SubCategory.fromJson(json['subcategory'])
        : null;
  }
}
