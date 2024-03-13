import 'package:image_picker/image_picker.dart';

class AddProModel{
   String? userID;
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
   List<XFile>? itemImg;

  AddProModel({
      this.userID,
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
      this.itemImg
  });
}
