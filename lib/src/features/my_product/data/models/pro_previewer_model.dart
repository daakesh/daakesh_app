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
  String? modelName;
  String? categoryName;
  String? year;
  String? description;
  double? averageRating;
  int? rateCount;
  dynamic priceAfterDiscount;
  int? categoryID;

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
    this.modelName = "Unknown",
    this.categoryName = "Mac Cosmetics",
    this.year = "2024",
    this.description = "Unknown",
  });
}
