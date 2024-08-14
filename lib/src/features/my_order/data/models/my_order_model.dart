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
    description = json['description'] ?? "Unknown";
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    } else {
      itemImg = [''];
    }
    date = json['date'] ?? "Unknown";
    title = json['Title'] ?? "Unknown";
    type = json['Type'] ?? "Unknown";
    swapFor = json['Swap For'] ?? "Unknown";
    city = json['City'] ?? "Unknown";
    year = json['Year'] ?? "Unknown";
    condition = json['Condition'] ?? "Unknown";
    price = json['Price'];
    discount = json['discount'];
    discountFrom = json['discount_from'] ?? "Unknown";
    discountTo = json['discount_to'] ?? "Unknown";
    country = json['country'] ?? "Unknown";
    createdAt = json['created_at'] ?? "Unknown";
    updatedAt = json['updated_at'] ?? "Unknown";
    quantity = json['quantity'] ?? 0;
    display = json['display'] ?? "Unknown";
    countrySwap = json['country_swap'] ?? "Unknown";
    citySwap = json['city_swap'] ?? "Unknown";
    status = json['status'] ?? "Unknown";
  }
}
