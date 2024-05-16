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
    id = json['id'] ?? 0;
    description = json['description'] ?? "Unknown";
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    } else {
      itemImg = [''];
    }
    priceAfterDiscount = json['price_after_discount'] ?? 0.0;
    discountPercentage = json['discount_percentage'] ?? "0%";
    date = json['date'] ?? "Unknown";
    title = json['Title'] ?? "Unknown";
    type = json['Type'] ?? "Unknown";
    swapFor = json['Swap For'] ?? "Unknown";
    city = json['City'] ?? "Unknown";
    year = json['Year'] ?? "Unknown";
    condition = json['Condition'] ?? "Unknown";
    price = json['Price'];
    discount = json['discount'] ?? 0.0;
    discountFrom = json['discount_from'] ?? "Unknown";
    discountTo = json['discount_to'] ?? "Unknown";
    country = json['country'] ?? "Jordan";
    rateCount = json['rate_count'] ?? 0;
    if (json['avarageRating'] != null) {
      if (json['avarageRating'] is int) {
        averageRating = json['avarageRating'].toDouble();
      }
      if (json['avarageRating'] is String) {
        averageRating = double.parse(json['avarageRating']);
      }
    } else {
      averageRating = 0.0;
    }

    //json['avarageRating'] ?? 0.0;
    section = json['section'] != null
        ? SectionItemModel.fromJson(json['section'])
        : SectionItemModel.initValues();
    user = json['user'] != null
        ? UserModel.fromJson(json['user'])
        : UserModel.initValues();
    category = json['category'] != null
        ? CategoryItem.fromJson(json['category'])
        : CategoryItem.initValues();
    brand = json['brand'] != null
        ? BrandItem.fromJson(json['brand'])
        : BrandItem.initValues();
    subcategory = json['subcategory'] != null
        ? SubCategory.fromJson(json['subcategory'])
        : SubCategory.initValues();
  }
}
