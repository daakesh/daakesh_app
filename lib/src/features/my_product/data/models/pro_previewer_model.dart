class ProPreviewerModel {
  int? itemId;
  String? userName;
  List<String>? itemImage;
  String? title;
  String? swapCity;
  String? swapCountry;
  int? offerCount;
  String? date;
  String? brandName;
  String? brandArName;
  String? sectionName;
  String? sectionArName;
  String? modelName;
  String? categoryName;
  String? categoryArName;
  String? year;
  String? description;
  double? averageRating;
  int? rateCount;
  dynamic priceAfterDiscount;
  int? categoryID;
  int? subID;
  String? citySwap;
  String? countrySwap;
  String? discountPercentage;
  dynamic price;

  ProPreviewerModel({
    this.averageRating = 0,
    this.rateCount = 0,
    this.priceAfterDiscount = 0,
    this.categoryID = 0,
    this.itemId = 0,
    this.userName = "others",
    this.itemImage = const [''],
    this.title = "others",
    this.swapCity = "others",
    this.swapCountry = "others",
    this.offerCount = 0,
    this.date = "2024-05-01 20:27:02",
    this.sectionName = "others",
    this.sectionArName = "بدون",
    this.brandName = "others",
    this.brandArName = "بدون",
    this.modelName = "others",
    this.categoryName = "others",
    this.categoryArName = "بدون",
    this.year = "2024",
    this.description = "others",
    this.subID = 0,
    this.citySwap = "others",
    this.countrySwap = "others",
    this.discountPercentage = "0%",
    this.price,
  });
}
