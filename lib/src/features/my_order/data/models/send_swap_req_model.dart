class SendReceiveSwapReqModel {
  bool? status;
  String? error;
  SendSwapData? data;

  SendReceiveSwapReqModel({this.status, this.error, this.data});

  SendReceiveSwapReqModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? SendSwapData.fromJson(json['data']) : null;
  }
}

class SendSwapData {
  List<SendReceiveSwapReqItem>? data;
  int? lastPage;
  SendSwapData({
    this.data,
    this.lastPage,
  });

  SendSwapData.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    if (json['data'] != null) {
      data = <SendReceiveSwapReqItem>[];
      data = (json['data'] as List<dynamic>)
          .map((e) => SendReceiveSwapReqItem.fromJson(e))
          .toList();
    }
  }
}

class SendReceiveSwapReqItem {
  int? id;
  int? sourceItem;
  int? offerItem;
  SourceUser? sourceUser;
  OfferUser? offerUser;
  int? approved;
  String? note;
  String? status;
  String? offerId;
  String? createdAt;
  String? updatedAt;
  SourceItems? sourceItems;
  OfferItems? offerItems;

  SendReceiveSwapReqItem(
      {this.id,
      this.sourceItem,
      this.offerItem,
      this.sourceUser,
      this.offerUser,
      this.approved,
      this.note,
      this.status,
      this.offerId,
      this.createdAt,
      this.updatedAt,
      this.sourceItems,
      this.offerItems});

  SendReceiveSwapReqItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sourceItem = json['source_item'];
    offerItem = json['offer_item'];
    sourceUser = json['source_user'] != null
        ? SourceUser.fromJson(json['source_user'])
        : null;
    offerUser = json['offer_user'] != null
        ? OfferUser.fromJson(json['offer_user'])
        : null;
    approved = json['approved'];
    note = json['note'];
    status = json['status'];
    offerId = json['offer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sourceItems = json['source_items'] != null
        ? SourceItems.fromJson(json['source_items'])
        : null;
    offerItems = json['offer_items'] != null
        ? OfferItems.fromJson(json['offer_items'])
        : null;
  }
}

class SourceUser {
  String? id;
  String? name;
  String? phoneNumber;
  String? password;
  int? active;
  String? userType;
  String? token;
  String? email;
  String? img;
  String? deviceToken;
  String? country;
  String? city;
  String? location;
  String? nikname;
  String? whatsappNumber;

  SourceUser(
      {this.id,
      this.name,
      this.phoneNumber,
      this.password,
      this.active,
      this.userType,
      this.token,
      this.email,
      this.img,
      this.deviceToken,
      this.country,
      this.city,
      this.location,
      this.nikname,
      this.whatsappNumber});

  SourceUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    active = json['active'];
    userType = json['userType'];
    token = json['token'];
    email = json['email'];
    img = json['img'];
    deviceToken = json['deviceToken'];
    country = json['country'];
    city = json['city'];
    location = json['location'];
    nikname = json['nikname'];
    whatsappNumber = json['whatsappNumber'];
  }
}

class OfferUser {
  String? id;
  String? name;
  String? phoneNumber;
  String? password;
  int? active;
  String? userType;
  String? token;
  String? email;
  String? img;
  String? deviceToken;
  String? country;
  String? city;
  String? location;
  String? nikname;
  String? whatsappNumber;

  OfferUser(
      {this.id,
      this.name,
      this.phoneNumber,
      this.password,
      this.active,
      this.userType,
      this.token,
      this.email,
      this.img,
      this.deviceToken,
      this.country,
      this.city,
      this.location,
      this.nikname,
      this.whatsappNumber});

  OfferUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    active = json['active'];
    userType = json['userType'];
    token = json['token'];
    email = json['email'];
    img = json['img'];
    deviceToken = json['deviceToken'];
    country = json['country'];
    city = json['city'];
    location = json['location'];
    nikname = json['nikname'];
    whatsappNumber = json['whatsappNumber'];
  }
}

class SourceItems {
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
  dynamic quantity;
  String? display;
  String? countrySwap;
  String? citySwap;
  String? storeType;
  dynamic priceAfterDiscount;
  String? discountPercentage;

  SourceItems(
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
      this.discountPercentage});

  SourceItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    if (json['itemImg'] != null) {
      itemImg = <String>[];
      itemImg =
          (json['itemImg'] as List<dynamic>).map((e) => e.toString()).toList();
    } else {
      itemImg = <String>[];
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
  }
}

class OfferItems {
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
  dynamic quantity;
  String? display;
  String? countrySwap;
  String? citySwap;
  String? storeType;
  dynamic priceAfterDiscount;
  String? discountPercentage;

  OfferItems(
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
      this.discountPercentage});

  OfferItems.fromJson(Map<String, dynamic> json) {
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
  }
}
