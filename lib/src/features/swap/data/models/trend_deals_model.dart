import 'package:daakesh/src/features/features.export.dart';

class TrendDealsModel {
  bool? status;
  String? error;
  TrendDealsData? data;

  TrendDealsModel({
    this.status,
    this.error,
    this.data,
  });

  TrendDealsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? TrendDealsData.fromJson(json['data']) : null;
  }
}

class TrendDealsData {
  int? lastPage;
  List<TrendDealsItem>? trendDealsData;

  TrendDealsData({
    this.lastPage,
    this.trendDealsData,
  });

  TrendDealsData.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    if (json['data'] != null) {
      trendDealsData = <TrendDealsItem>[];
      trendDealsData = (json['data'] as List<dynamic>)
          .map((e) => TrendDealsItem.fromJson(e))
          .toList();
    }
  }
}

class TrendDealsItem {
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
  String? countrySwap;
  String? citySwap;
  int? offerCount;
  SectionItemModel? section;
  UserModel? user;
  CategoryItem? category;
  BrandItem? brand;
  SwapSubCategory? subcategory;
  bool? isFavorite;
  String? longitude;
  String? latitude;
  TrendDealsItem({
    this.id,
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
    this.subcategory,
    this.isFavorite,
    this.latitude,
    this.longitude,
  });

  TrendDealsItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    } else {
      itemImg = [''];
    }
    description = json['description'] ?? "others";
    date = json['date'] ?? "others";
    title = json['Title'] ?? "others";
    type = json['Type'] ?? "others";
    swapFor = json['Swap For'] ?? "others";
    city = json['City'] ?? "others";
    year = json['Year'] ?? "others";
    condition = json['Condition'] ?? "others";
    price = json['Price'] ?? "others";
    discount = json['discount'];
    discountFrom = json['discount_from'] ?? "others";
    discountTo = json['discount_to'] ?? "others";
    country = json['country'] ?? "others";
    countrySwap = json['country_swap'] ?? "others";
    citySwap = json['city_swap'] ?? "others";
    offerCount = json['offers_count'] ?? 0;
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
        ? SwapSubCategory.fromJson(json['subcategory'])
        : SwapSubCategory.initValues();

    isFavorite = json['isFavorite'] ?? false;
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
  }
}
