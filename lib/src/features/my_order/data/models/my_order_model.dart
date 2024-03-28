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
  int? totalPrice;
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
  String? discount;
  String? discountFrom;
  String? discountTo;
  String? country;
  String? createdAt;
  String? updatedAt;
  String? quantity;
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
    id = json['id'];
    description = json['description'];
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg = (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    }
    else{
      itemImg = [''];
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
    status = json['status'];
  }
}
