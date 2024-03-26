import 'package:daakesh/src/features/authentication/authentication.export.dart';

class CartModel {
  bool? status;
  String? error;
  List<CartData>? data;

  CartModel({this.status, this.error, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <CartData>[];
      data = (json['data'] as List<dynamic>).map((v) => CartData.fromJson(v)).toList();
    }
  }


}

class CartData {
  int? id;
  UserModel? user;
  MyCartItem? item;


  CartData({
    this.id,
    this.user,
    this.item,
  });

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ?  UserModel.fromJson(json['user']) : null;
    item = json['item'] != null ?  MyCartItem.fromJson(json['item']) : null;
  }
}

class MyCartItem {
  int? id;
  String? description;
  List<String>? itemImg;
  String? date;
  int? count;
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
  String? display;
  String? countrySwap;
  String? citySwap;


  MyCartItem({
    this.id,
    this.description,
    this.itemImg,
    this.date,
    this.title,
    this.type,
    this.count,
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
  });

  MyCartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if(json['itemImg'] != null){
      itemImg = <String>[];
      itemImg = (json['itemImg']as List<dynamic>).map((e) => e.toString()).toList();
    }
    count = 1;
    description = json['description'];
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
  }


}