import '../../../../src.export.dart';

class SearchModel {
  bool? status;
  String? error;
  SearchData? data;

  SearchModel({this.status, this.error, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? SearchData.fromJson(json['data']) : null;
  }
}

class SearchData {
  List<SearchResultModel>? data;
  int? lastPage;
  SearchData({this.data});

  SearchData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SearchResultModel>[];
      data = (json['data'] as List<dynamic>)
          .map((v) => SearchResultModel.fromJson(v))
          .toList();
    }
    lastPage = json['last_page'];
  }
}

class SearchResultModel {
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
  UserModel? user;
  CategoryItem? category;
  BrandItem? brand;
  SubCategory? subcategory;
  SectionItemModel? section;

  SearchResultModel(
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

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    }
    date = json['date'];
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
        : null;
    brand = json['brand'] != null ? BrandItem.fromJson(json['section']) : null;
    subcategory = json['subcategory'] != null
        ? SubCategory.fromJson(json['subcategory'])
        : null;
    section = json['section'] != null
        ? SectionItemModel.fromJson(json['section'])
        : null;
  }
}
