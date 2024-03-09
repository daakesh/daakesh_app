import '../../../../src.export.dart';

class SwapSearchModel {
  bool? status;
  String? error;
  SwapSearchData? data;

  SwapSearchModel({this.status, this.error, this.data});

  SwapSearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? SwapSearchData.fromJson(json['data']) : null;
  }
}

class SwapSearchData {
  List<SwapSearchResultModel>? data;
  int? lastPage;
  SwapSearchData({this.data});

  SwapSearchData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SwapSearchResultModel>[];
      data = (json['data'] as List<dynamic>).map((v) => SwapSearchResultModel.fromJson(v)).toList();
    }
    lastPage = json['last_page'];

  }

}

class SwapSearchResultModel {
  int? id;
  String? description;
  String? itemImg;
  String? date;
  String? title;
  String? tradeSell;
  String? tradeFor;
  String? city;
  String? year;
  String? condition;
  int? price;
  UserModel? user;
  CategoryItem? category;
  BrandItem? brand;
  SubCategory? subcategory;
  SectionItemModel? section;

  SwapSearchResultModel(
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

  SwapSearchResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    itemImg = json['itemImg'];
    date = json['date'];
    title = json['Title'];
    tradeSell = json['Trade/Sell'];
    tradeFor = json['Trade For'];
    city = json['City'];
    year = json['Year'];
    condition = json['Condition'];
    price = json['Price'].toInt();
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    category = json['category'] != null ? CategoryItem.fromJson(json['category']) : null;
    brand = json['brand'] != null ? BrandItem.fromJson(json['section']) : null;
    subcategory = json['subcategory']!= null ? SubCategory.fromJson(json['subcategory']) : null;
    section = json['section'] != null ? SectionItemModel.fromJson(json['section']) : null;
  }

}


