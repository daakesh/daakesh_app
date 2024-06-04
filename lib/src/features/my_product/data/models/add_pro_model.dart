import 'package:image_picker/image_picker.dart';

class AddProModel {
  String? userID;
  String? proId;
  String? title;
  String? description;
  String? secID;
  String? catID;
  String? subID;
  String? brandID;
  String? tradeOrSell;
  String? tradeFor;
  String? price;
  String? condition;
  String? city;
  String? year;
  String? discountFrom;
  String? discountTo;
  String? discount;
  String? country;
  String? quantity;
  String? display;
  String? countrySwap;
  String? citySwap;
  List<XFile>? itemFileImg;
  List<String>? itemImageList;

  AddProModel(
      {this.userID,
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
      this.discountFrom,
      this.discountTo,
      this.discount,
      this.country,
      this.quantity,
      this.display,
      this.countrySwap,
      this.citySwap,
      this.itemFileImg,
      this.itemImageList});

  Map<String, dynamic> addItemToJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID.toString();
    data['description'] = description.toString();
    data['catID'] = catID.toString();
    data['secID'] = secID.toString();
    if (subID != null && subID!.isNotEmpty && subID != "-1") {
      data['subID'] = subID;
    } else {
      data['subID'] = null;
    }
    if (brandID != null && brandID!.isNotEmpty && brandID != "-1") {
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
    data['discount_from'] = discountFrom.toString();
    data['discount_to'] = discountTo.toString();
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

    if (subID != null && subID!.isNotEmpty && subID != "-1") {
      data['subID'] = subID;
    } else {
      data['subID'] = null;
    }
    if (brandID != null && brandID!.isNotEmpty && brandID != "-1") {
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
    data['discount_from'] = discountFrom.toString();
    data['discount_to'] = discountTo.toString();
    data['discount'] = discount.toString();
    data['country'] = country.toString();
    data['quantity'] = quantity.toString();
    data['display'] = display.toString();
    data['country_swap'] = countrySwap.toString();
    data['city_swap'] = citySwap.toString();
    //data['itemImg'] = itemImageList!.join(',');
    return data;
  }
}
