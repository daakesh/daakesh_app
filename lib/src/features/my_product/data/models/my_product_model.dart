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
  double? priceAfterDiscount;
  String? discountPercentage;
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
  int? rateCount;
  int? offerCount;
  double? averageRating;
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
      this.priceAfterDiscount,
      this.discountPercentage,
      this.citySwap,
      this.user,
      this.category,
      this.brand,
      this.averageRating,
      this.rateCount,
      this.offerCount,
      this.subcategory,
      this.section});

  MyProductItem.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    if (json['itemImg'] != null && (json['itemImg'] as List).isNotEmpty) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    }
    if (json['price_after_discount'] != null) {
      priceAfterDiscount = json['price_after_discount'].toDouble();
    } else {
      priceAfterDiscount = 0.0;
    }
    discountPercentage = json['discount_percentage'];
    description = json['description'] ?? "others";
    date = json['date'] ?? "others";
    title = json['Title'] ?? "others";
    type = json['Type'] ?? "others";
    swapFor = json['Swap For'] ?? "others";
    city = json['City'] ?? "others";
    year = json['Year'] ?? "others";
    condition = json['Condition'] ?? "others";
    price = json['Price'];
    discount = json['discount'];
    discountFrom = json['discount_from'] ?? "others";
    discountTo = json['discount_to'] ?? "others";
    country = json['country'] ?? "others";
    createdAt = json['created_at'] ?? "others";
    updatedAt = json['updated_at'] ?? "others";
    quantity = json['quantity'] ?? 0;
    display = json['display'] ?? "others";
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
    offerCount = json['offers_count'] ?? 0;
    countrySwap = json['country_swap'] ?? "others";
    citySwap = json['city_swap'] ?? "others";
    user = json['user'] != null
        ? UserModel.fromJson(json['user'])
        : UserModel.initValues();
    category = json['category'] != null
        ? MyProductCategory.fromJson(json['category'])
        : MyProductCategory.initValues();
    brand = json['brand'] != null
        ? BrandItem.fromJson(json['brand'])
        : BrandItem.initValues();
    subcategory = json['subcategory'] != null
        ? SubCategory.fromJson(json['subcategory'])
        : SubCategory.initValues();
    section = json['section'] != null
        ? SectionItemModel.fromJson(json['section'])
        : SectionItemModel.initValues();
  }
  MyProductItem.initValues() {
    id = 0;
    itemImg = [];
    priceAfterDiscount = 0.0;
    discountPercentage = "others";
    description = "others";
    date = "others";
    title = "others";
    type = "others";
    swapFor = "others";
    city = "others";
    year = "others";
    condition = "others";
    price = 0.0;
    discount = 0.0;
    discountFrom = "others";
    discountTo = "others";
    country = "others";
    createdAt = "others";
    updatedAt = "others";
    quantity = 0;
    display = "others";
    rateCount = 4;
    averageRating = 3.5;
    countrySwap = "others";
    citySwap = "others";
    user = UserModel.initValues();
    category = MyProductCategory.initValues();
    brand = BrandItem.initValues();
    subcategory = SubCategory.initValues();
    section = SectionItemModel.initValues();
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
    id = json['id'] ?? 0;
    name = json['name'] ?? "others";
    description = json['description'] ?? "others";
    catImg = json['catImg'] ?? "others";
    date = json['date'] ?? "others";
    secID = json['secID'] ?? 0;
    arName = json['arName'] ?? "others";
  }
  MyProductCategory.initValues() {
    id = 0;
    name = "others";
    description = "others";
    catImg = "others";
    date = "others";
    secID = 0;
    arName = "others";
  }
}
