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
    this.userName = "Unknown",
    this.itemImage = const [''],
    this.title = "Unknown",
    this.swapCity = "Unknown",
    this.swapCountry = "Unknown",
    this.offerCount = 0,
    this.date = "2024-05-01 20:27:02",
    this.sectionName = "Null",
    this.sectionArName = "بدون",
    this.brandName = "Null",
    this.brandArName = "بدون",
    this.modelName = "Unknown",
    this.categoryName = "Null",
    this.categoryArName = "بدون",
    this.year = "2024",
    this.description = "Unknown",
    this.subID = 0,
    this.citySwap = "Unknown",
    this.countrySwap = "Unknown",
    this.discountPercentage = "0%",
    this.price,
  });
}
