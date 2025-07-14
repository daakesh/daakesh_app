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
  bool? isFavorite;
  String? longitude;
  String? latitude;
  TodayItem({
    this.id,
    this.description,
    this.itemImg,
    this.date,
    this.title,
    this.type,
    this.swapFor,
    this.city,
    this.year,
    this.priceAfterDiscount,
    this.discountPercentage,
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
    this.subcategory,
    this.isFavorite,
    this.latitude,
    this.longitude,
  });
  TodayItem.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    description = json['description'] ?? "others";
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    } else {
      itemImg = [''];
    }
    // Handle priceAfterDiscount with proper type conversion
    final priceAfterDiscountValue = json['price_after_discount'];
    if (priceAfterDiscountValue is int) {
      priceAfterDiscount = priceAfterDiscountValue.toDouble();
    } else if (priceAfterDiscountValue is double) {
      priceAfterDiscount = priceAfterDiscountValue;
    } else if (priceAfterDiscountValue is String) {
      priceAfterDiscount = double.tryParse(priceAfterDiscountValue) ?? 0.0;
    } else {
      priceAfterDiscount = 0.0;
    }

    discountPercentage = json['discount_percentage'] ?? "0%";
    date = json['date'] ?? "others";
    title = json['Title'] ?? "others";
    type = json['Type'] ?? "others";
    swapFor = json['Swap For'] ?? "others";
    city = json['City'] ?? "others";
    year = json['Year'] ?? "others";
    condition = json['Condition'] ?? "others";
    price = json['Price'];

    // Handle discount with proper type conversion
    final discountValue = json['discount'];
    if (discountValue is int) {
      discount = discountValue.toDouble();
    } else if (discountValue is double) {
      discount = discountValue;
    } else if (discountValue is String) {
      discount = double.tryParse(discountValue) ?? 0.0;
    } else {
      discount = 0.0;
    }

    discountFrom = json['discount_from'] ?? "others";
    discountTo = json['discount_to'] ?? "others";
    country = json['country'] ?? "Jordan";
    rateCount = json['rate_count'] ?? 0;

    // Handle averageRating with comprehensive type conversion
    final avgRatingValue = json['avarageRating'];
    if (avgRatingValue != null) {
      if (avgRatingValue is int) {
        averageRating = avgRatingValue.toDouble();
      } else if (avgRatingValue is double) {
        averageRating = avgRatingValue;
      } else if (avgRatingValue is String) {
        averageRating = double.tryParse(avgRatingValue) ?? 0.0;
      } else {
        averageRating = 0.0;
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

    // Fix isFavorite assignment to handle int or bool
    final fav = json['isFavorite'];
    if (fav is bool) {
      isFavorite = fav;
    } else if (fav is int) {
      isFavorite = fav == 1;
    } else {
      isFavorite = false;
    }

    // Handle latitude and longitude with null safety
    latitude = json['latitude']?.toString() ?? "0.0";
    longitude = json['longitude']?.toString() ?? "0.0";
  }
  TodayItem copyWith({
    int? id,
    String? description,
    List<String>? itemImg,
    String? date,
    dynamic priceAfterDiscount,
    String? discountPercentage,
    String? title,
    String? type,
    String? swapFor,
    String? city,
    String? year,
    String? condition,
    dynamic price,
    double? discount,
    String? discountFrom,
    String? discountTo,
    String? country,
    int? rateCount,
    double? averageRating,
    SectionItemModel? section,
    UserModel? user,
    CategoryItem? category,
    BrandItem? brand,
    SubCategory? subcategory,
    bool? isFavorite,
    String? latitude,
    String? longitude,
  }) {
    return TodayItem(
      id: id ?? this.id,
      description: description ?? this.description,
      itemImg: itemImg ?? this.itemImg,
      date: date ?? this.date,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      title: title ?? this.title,
      type: type ?? this.type,
      swapFor: swapFor ?? this.swapFor,
      city: city ?? this.city,
      year: year ?? this.year,
      condition: condition ?? this.condition,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      discountFrom: discountFrom ?? this.discountFrom,
      discountTo: discountTo ?? this.discountTo,
      country: country ?? this.country,
      rateCount: rateCount ?? this.rateCount,
      averageRating: averageRating ?? this.averageRating,
      section: section ?? this.section,
      user: user ?? this.user,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      subcategory: subcategory ?? this.subcategory,
      isFavorite: isFavorite ?? this.isFavorite,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
