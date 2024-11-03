import 'package:image_picker/image_picker.dart';

class AddProModel {
  String? userID;
  String? proId;
  String? title;
  String? description;
  int? secID;
  int? catID;
  int? subID;
  int? brandID;
  String? tradeOrSell;
  String? tradeFor;
  String? price;
  String? condition;
  String? city;
  String? year;

  String? discount;
  String? country;
  String? quantity;
  String? display;
  String? countrySwap;
  String? citySwap;
  List<XFile>? itemFileImg;
  List<String>? itemImageList;
  List<String>? oldItemImageList;

  AddProModel({
    this.userID,
    this.proId,
    this.title,
    this.description,
    this.secID,
    this.catID,
    this.subID,
    this.brandID,
    this.tradeOrSell,
    this.tradeFor,
    this.price,
    this.condition,
    this.city,
    this.year,
    this.discount,
    this.country,
    this.quantity,
    this.display,
    this.countrySwap,
    this.citySwap,
    this.itemFileImg,
    this.itemImageList,
    this.oldItemImageList,
  });

  Map<String, dynamic> addItemToJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID.toString();
    data['description'] = description.toString();
    data['catID'] = catID.toString();
    data['secID'] = secID.toString();
    if (subID != null && subID != 1000) {
      data['subID'] = subID;
    } else {
      data['subID'] = null;
    }
    if (brandID != null && brandID != 1000) {
      data['brandID'] = brandID;
    } else {
      data['brandID'] = null;
    }
    data['title'] = title.toString();
    data['tradeOrSell'] = tradeOrSell.toString();
    data['tradeFor'] = tradeFor.toString();
    data['price'] = price.toString();
    data['condition'] = condition.toString();
    data['city'] = city.toString();
    data['year'] = year.toString();
    data['discount'] = discount.toString();
    data['country'] = country.toString();
    data['quantity'] = quantity.toString();
    data['display'] = display.toString();
    data['country_swap'] = countrySwap.toString();
    data['city_swap'] = citySwap.toString();
    data['itemImg'] = itemImageList!.join(',');
    return data;
  }

  Map<String, dynamic> editItemToJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = proId.toString();
    data['description'] = description.toString();
    data['catID'] = catID.toString();
    data['secID'] = secID.toString();

    if (subID != null && subID != 1000) {
      data['subID'] = subID;
    } else {
      data['subID'] = null;
    }
    if (brandID != null && brandID != 1000) {
      data['brandID'] = brandID;
    } else {
      data['brandID'] = null;
    }
    data['title'] = title.toString();
    data['type'] = tradeOrSell.toString();
    data['price'] = price.toString();
    data['condition'] = condition.toString();
    data['city'] = city.toString();
    data['year'] = year.toString();

    data['discount'] = discount.toString();
    data['country'] = country.toString();
    data['quantity'] = quantity.toString();
    data['display'] = display.toString();
    data['country_swap'] = countrySwap.toString();
    data['city_swap'] = citySwap.toString();
    if (oldItemImageList!.isNotEmpty) {
      itemImageList!.addAll(oldItemImageList!);
    }
    if (itemImageList!.isNotEmpty && itemImageList != null) {
      data['itemImg'] = itemImageList!.join(',');
    }

    return data;
  }
}
