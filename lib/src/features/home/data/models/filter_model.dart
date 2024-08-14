import '../../../../src.export.dart';

class FilterModel {
  bool? status;
  String? error;
  FilterData? data;

  FilterModel({this.status, this.error, this.data});

  FilterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? FilterData.fromJson(json['data']) : null;
  }
}

class FilterData {
  List<FilterResultModel>? data;
  int? lastPage;
  FilterData({this.data});

  FilterData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FilterResultModel>[];
      data = (json['data'] as List<dynamic>)
          .map((v) => FilterResultModel.fromJson(v))
          .toList();
    }
    lastPage = json['last_page'];
  }
}

class FilterResultModel {
  int? id;
  String? description;
  List<String>? itemImg;
  String? date;
  String? title;
  String? tradeSell;
  String? tradeFor;
  String? city;
  String? year;
  String? condition;
  dynamic price;
  dynamic priceAfterDiscount;
  dynamic discount;
  String? discountPercentage;
  UserModel? user;
  CategoryItem? category;
  BrandItem? brand;
  SubCategory? subcategory;
  SectionItemModel? section;

  FilterResultModel(
      {this.id,
      this.description,
      this.itemImg,
      this.date,
      this.title,
      this.tradeSell,
      this.tradeFor,
      this.city,
      this.year,
      this.condition,
      this.price,
      this.user,
      this.category,
      this.brand,
      this.subcategory,
      this.section});

  FilterResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    }

    date = json['date'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    discountPercentage = json['discount_percentage'];
    title = json['Title'];
    tradeSell = json['Trade/Sell'];
    tradeFor = json['Trade For'];
    city = json['City'];
    year = json['Year'];
    condition = json['Condition'];
    price = json['Price'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    category = json['category'] != null
        ? CategoryItem.fromJson(json['category'])
        : CategoryItem.initValues();
    brand = json['brand'] != null ? BrandItem.fromJson(json['section']) : null;
    subcategory = json['subcategory'] != null
        ? SubCategory.fromJson(json['subcategory'])
        : SubCategory.initValues();
    section = json['section'] != null
        ? SectionItemModel.fromJson(json['section'])
        : SectionItemModel.initValues();
  }
}
