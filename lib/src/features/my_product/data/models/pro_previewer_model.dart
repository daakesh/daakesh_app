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
    this.date = "Unknown",
    this.brandName = "Unknown",
    this.brandArName = "Unknown",
    this.modelName = "Unknown",
    this.categoryName = "Unknown",
    this.categoryArName = "Unknown",
    this.year = "2024",
    this.description = "Unknown",
    this.subID = 0,
    this.citySwap = "Unknown",
    this.countrySwap = "Unknown",
  });
}
