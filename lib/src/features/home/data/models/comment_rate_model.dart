import 'package:daakesh/src/features/authentication/authentication.export.dart';

class CommentRateModel {
  bool? status;
  String? error;
  CommentModelData? data;
  CommentRateModel({this.status, this.error, this.data});
  CommentRateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data =
        json['data'] != null ? CommentModelData.fromJson(json['data']) : null;
  }
}

class CommentModelData {
  int? lastPage;
  List<CommentRateModelItem>? commentRateModelItem;

  CommentModelData({
    this.lastPage,
    this.commentRateModelItem,
  });

  CommentModelData.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    if (json['data'] != null) {
      commentRateModelItem = <CommentRateModelItem>[];
      commentRateModelItem = (json['data'] as List<dynamic>)
          .map((e) => CommentRateModelItem.fromJson(e))
          .toList();
    }
  }
}

class CommentRateModelItem {
  int? id;
  String? commentDesc;
  String? date;
  UserModel? user;
  Item? item;

  CommentRateModelItem(
      {this.id, this.commentDesc, this.date, this.user, this.item});

  CommentRateModelItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commentDesc = json['commentDesc'];
    date = json['date'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
  }
}

class Item {
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
  dynamic display;
  String? countrySwap;
  String? citySwap;
  String? storeType;
  dynamic priceAfterDiscount;
  String? discountPercentage;
  List<Rate>? rate;

  Item(
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
      this.storeType,
      this.priceAfterDiscount,
      this.discountPercentage,
      this.rate});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    }
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
    storeType = json['store_type'];
    priceAfterDiscount = json['price_after_discount'];
    discountPercentage = json['discount_percentage'];
    if (json['rate'] != null) {
      rate = <Rate>[];
      rate =
          (json['rate'] as List<dynamic>).map((e) => Rate.fromJson(e)).toList();
    }
  }
}

class Rate {
  int? id;
  int? rateValue;
  UserModel? user;

  Rate({this.id, this.rateValue, this.user});

  Rate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rateValue = json['rateValue'] ?? 0;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
}
