import '../../../../src.export.dart';

class CartModel {
  bool? status;
  String? error;
  CartData? data;

  CartModel({this.status, this.error, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? CartData.fromJson(json['data']) : null;
  }
}

class CartData {
  dynamic totalPrice;
  List<CartItem>? cart;
  CartData({
    this.totalPrice,
    this.cart,
  });

  CartData.fromJson(Map<String, dynamic> json) {
    totalPrice = json['total_price'];
    if (json['cart'] != null) {
      cart = <CartItem>[];
      cart = (json['cart'] as List<dynamic>)
          .map((v) => CartItem.fromJson(v))
          .toList();
    }
  }
}

class CartItem {
  int? id;
  int? quantity;
  String? country;
  String? address;
  UserModel? user;
  MyCartItem? item;

  CartItem({
    this.id,
    this.user,
    this.item,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    country = json['country'];
    address = json['address'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    item = json['item'] != null ? MyCartItem.fromJson(json['item']) : null;
  }
}

class MyCartItem {
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
  dynamic priceAfterDiscount;
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
  String? discountPercentage;

  MyCartItem({
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
    this.createdAt,
    this.updatedAt,
    this.quantity,
    this.display,
    this.countrySwap,
    this.citySwap,
    this.discountPercentage,
    this.priceAfterDiscount,
  });

  MyCartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    }
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
    discountPercentage = json['discount_percentage'];
    priceAfterDiscount = json['price_after_discount'];
  }
}
