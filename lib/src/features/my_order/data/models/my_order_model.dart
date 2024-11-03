class MyOrderModel {
  bool? status;
  String? error;
  List<MyOrderData>? data;

  MyOrderModel({this.status, this.error, this.data});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <MyOrderData>[];
      data = (json['data'] as List<dynamic>)
          .map((e) => MyOrderData.fromJson(e))
          .toList();
    }
  }
}

class MyOrderData {
  String? orderId;
  dynamic totalPrice;
  List<MyOrderItems>? items;

  MyOrderData({this.orderId, this.totalPrice, this.items});

  MyOrderData.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    totalPrice = json['totalPrice'];
    if (json['items'] != null) {
      items = <MyOrderItems>[];
      items = (json['items'] as List<dynamic>)
          .map((e) => MyOrderItems.fromJson(e))
          .toList();
    }
  }
}

class MyOrderItems {
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
  dynamic discount;
  String? discountFrom;
  String? discountTo;
  String? country;
  String? createdAt;
  String? updatedAt;
  int? quantity;
  String? display;
  String? countrySwap;
  String? citySwap;
  String? status;

  MyOrderItems(
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
      this.status});

  MyOrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    description = json['description'] ?? "others";
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    } else {
      itemImg = [''];
    }
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
    countrySwap = json['country_swap'] ?? "others";
    citySwap = json['city_swap'] ?? "others";
    status = json['status'] ?? "others";
  }
}
