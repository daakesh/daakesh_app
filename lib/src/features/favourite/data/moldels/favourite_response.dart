class FavouriteResponseModelDataItem {
  int? id;
  String? userID;
  String? description;
  int? catID;
  List<String?>? itemImg;
  int? secID;
  String? subID;
  String? brandID;
  String? date;
  String? Title;
  String? Type;
  String? SwapFor;
  String? City;
  String? Year;
  String? Condition;
  String? Price;
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
  String? storeType;
  String? priceAfterDiscount;
  String? discountPercentage;
  String? offersCount;

  FavouriteResponseModelDataItem({
    this.id,
    this.userID,
    this.description,
    this.catID,
    this.itemImg,
    this.secID,
    this.subID,
    this.brandID,
    this.date,
    this.Title,
    this.Type,
    this.SwapFor,
    this.City,
    this.Year,
    this.Condition,
    this.Price,
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
    this.offersCount,
  });
  FavouriteResponseModelDataItem.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userID = json['userID']?.toString();
    description = json['description']?.toString();
    catID = json['catID']?.toInt();
    if (json['itemImg'] != null) {
      final v = json['itemImg'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      itemImg = arr0;
    }
    secID = json['secID']?.toInt();
    subID = json['subID']?.toString();
    brandID = json['brandID']?.toString();
    date = json['date']?.toString();
    Title = json['Title']?.toString();
    Type = json['Type']?.toString();
    SwapFor = json['Swap For']?.toString();
    City = json['City']?.toString();
    Year = json['Year']?.toString();
    Condition = json['Condition']?.toString();
    Price = json['Price']?.toString();
    discount = json['discount']?.toString();
    discountFrom = json['discount_from']?.toString();
    discountTo = json['discount_to']?.toString();
    country = json['country']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    quantity = json['quantity']?.toString();
    display = json['display']?.toString();
    countrySwap = json['country_swap']?.toString();
    citySwap = json['city_swap']?.toString();
    storeType = json['store_type']?.toString();
    priceAfterDiscount = json['price_after_discount']?.toString();
    discountPercentage = json['discount_percentage']?.toString();
    offersCount = json['offers_count'].toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userID'] = userID;
    data['description'] = description;
    data['catID'] = catID;
    if (itemImg != null) {
      final v = itemImg;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['itemImg'] = arr0;
    }
    data['secID'] = secID;
    data['subID'] = subID;
    data['brandID'] = brandID;
    data['date'] = date;
    data['Title'] = Title;
    data['Type'] = Type;
    data['Swap For'] = SwapFor;
    data['City'] = City;
    data['Year'] = Year;
    data['Condition'] = Condition;
    data['Price'] = Price;
    data['discount'] = discount;
    data['discount_from'] = discountFrom;
    data['discount_to'] = discountTo;
    data['country'] = country;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['quantity'] = quantity;
    data['display'] = display;
    data['country_swap'] = countrySwap;
    data['city_swap'] = citySwap;
    data['store_type'] = storeType;
    data['price_after_discount'] = priceAfterDiscount;
    data['discount_percentage'] = discountPercentage;
    return data;
  }
}

class FavouriteResponseModelDataUser {
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
  String? rememberToken;

  FavouriteResponseModelDataUser({
    this.id,
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
    this.whatsappNumber,
    this.rememberToken,
  });
  FavouriteResponseModelDataUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    phoneNumber = json['phoneNumber']?.toString();
    password = json['password']?.toString();
    active = json['active']?.toInt();
    userType = json['userType']?.toString();
    token = json['token']?.toString();
    email = json['email']?.toString();
    img = json['img']?.toString();
    deviceToken = json['deviceToken']?.toString();
    country = json['country']?.toString();
    city = json['city']?.toString();
    location = json['location']?.toString();
    nikname = json['nikname']?.toString();
    whatsappNumber = json['whatsappNumber']?.toString();
    rememberToken = json['remember_token']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['active'] = active;
    data['userType'] = userType;
    data['token'] = token;
    data['email'] = email;
    data['img'] = img;
    data['deviceToken'] = deviceToken;
    data['country'] = country;
    data['city'] = city;
    data['location'] = location;
    data['nikname'] = nikname;
    data['whatsappNumber'] = whatsappNumber;
    data['remember_token'] = rememberToken;
    return data;
  }
}

class FavouriteResponseModelData {
/*
{
  "id": 5,
  "user": {
    "id": "b7b34010-9275-49ee-b6f7-96f934679ef3",
    "name": "Mohammed Kansan",
    "phoneNumber": "+96278016493",
    "password": "$2y$12$6oZZhYYbmrVMUpXBEruoxe3/dTqJnxuu/yBq5FOIo0PnMpa58IQea",
    "active": 1,
    "userType": "Normal",
    "token": "eMa7c34HAOH9ZvsazJageBikn4MqZanhwVKhPWPI2MPlNN49MHP867N3wfcH",
    "email": "Knanmhmd364@gmail.com",
    "img": null,
    "deviceToken": null,
    "country": "الأردن",
    "city": "اربد",
    "location": "اربد شارع الثلاثين",
    "nikname": null,
    "whatsappNumber": "+96278016493",
    "remember_token": null
  },
  "item": {
    "id": 364,
    "userID": "f7fad9ff-795c-4f06-b7be-3d86b933fe99",
    "description": "فرشتين مجوزة ومفردة تفصيل اسفنج ضغط عالي وطبي للتبديل في مجلس بحاله جيدة\nتواصل 0787776268",
    "catID": 63,
    "itemImg": [
      "https://daakesh.com/Images/Items/item_fa2tRCGNYJ0O5WVh4Ame.png"
    ],
    "secID": 58,
    "subID": null,
    "brandID": null,
    "date": "2025-02-04",
    "Title": "فرشة",
    "Type": "Swap",
    "Swap For": "TV",
    "City": "Amman",
    "Year": "2025",
    "Condition": "NEW",
    "Price": null,
    "discount": null,
    "discount_from": "2025-02-04",
    "discount_to": "2025-02-04",
    "country": "Jordan",
    "created_at": "2025-02-04T15:14:10.000000Z",
    "updated_at": "-000001-11-30T00:00:00.000000Z",
    "quantity": null,
    "display": "Public",
    "country_swap": "Jordan",
    "city_swap": "Amman",
    "store_type": "Other",
    "price_after_discount": null,
    "discount_percentage": "0%"
  },
  "category": null,
  "sub_category": null,
  "brand": null
} 
*/

  int? id;
  FavouriteResponseModelDataUser? user;
  FavouriteResponseModelDataItem? item;
  String? category;
  String? subCategory;
  String? brand;

  FavouriteResponseModelData({
    this.id,
    this.user,
    this.item,
    this.category,
    this.subCategory,
    this.brand,
  });
  FavouriteResponseModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    user = (json['user'] != null)
        ? FavouriteResponseModelDataUser.fromJson(json['user'])
        : null;
    item = (json['item'] != null)
        ? FavouriteResponseModelDataItem.fromJson(json['item'])
        : null;
    category = json['category']?.toString();
    subCategory = json['sub_category']?.toString();
    brand = json['brand']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (item != null) {
      data['item'] = item!.toJson();
    }
    data['category'] = category;
    data['sub_category'] = subCategory;
    data['brand'] = brand;
    return data;
  }
}

class FavouriteResponseModel {
/*
{
  "status": true,
  "error": null,
  "data": [
    {
      "id": 5,
      "user": {
        "id": "b7b34010-9275-49ee-b6f7-96f934679ef3",
        "name": "Mohammed Kansan",
        "phoneNumber": "+96278016493",
        "password": "$2y$12$6oZZhYYbmrVMUpXBEruoxe3/dTqJnxuu/yBq5FOIo0PnMpa58IQea",
        "active": 1,
        "userType": "Normal",
        "token": "eMa7c34HAOH9ZvsazJageBikn4MqZanhwVKhPWPI2MPlNN49MHP867N3wfcH",
        "email": "Knanmhmd364@gmail.com",
        "img": null,
        "deviceToken": null,
        "country": "الأردن",
        "city": "اربد",
        "location": "اربد شارع الثلاثين",
        "nikname": null,
        "whatsappNumber": "+96278016493",
        "remember_token": null
      },
      "item": {
        "id": 364,
        "userID": "f7fad9ff-795c-4f06-b7be-3d86b933fe99",
        "description": "فرشتين مجوزة ومفردة تفصيل اسفنج ضغط عالي وطبي للتبديل في مجلس بحاله جيدة\nتواصل 0787776268",
        "catID": 63,
        "itemImg": [
          "https://daakesh.com/Images/Items/item_fa2tRCGNYJ0O5WVh4Ame.png"
        ],
        "secID": 58,
        "subID": null,
        "brandID": null,
        "date": "2025-02-04",
        "Title": "فرشة",
        "Type": "Swap",
        "Swap For": "TV",
        "City": "Amman",
        "Year": "2025",
        "Condition": "NEW",
        "Price": null,
        "discount": null,
        "discount_from": "2025-02-04",
        "discount_to": "2025-02-04",
        "country": "Jordan",
        "created_at": "2025-02-04T15:14:10.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "quantity": null,
        "display": "Public",
        "country_swap": "Jordan",
        "city_swap": "Amman",
        "store_type": "Other",
        "price_after_discount": null,
        "discount_percentage": "0%"
      },
      "category": null,
      "sub_category": null,
      "brand": null
    }
  ]
} 
*/

  bool? status;
  String? error;
  List<FavouriteResponseModelData>? data;

  FavouriteResponseModel({
    this.status,
    this.error,
    this.data,
  });
  FavouriteResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error']?.toString();
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <FavouriteResponseModelData>[];
      v.forEach((v) {
        arr0.add(FavouriteResponseModelData.fromJson(v));
      });
      data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['error'] = error;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['data'] = arr0;
    }
    return data;
  }
}
