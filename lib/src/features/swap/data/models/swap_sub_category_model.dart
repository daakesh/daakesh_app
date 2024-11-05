class SwapSubCategory {
  int? id;
  String? name;
  String? description;
  String? subImg;
  String? date;
  String? arName;

  SwapSubCategory(
      {this.id,
      this.name,
      this.description,
      this.subImg,
      this.date,
      this.arName});

  SwapSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "others";
    description = json['description'] ?? "others";
    subImg = json['subImg'] ?? "others";
    date = json['date'] ?? "others";
    arName = json['arName'] ?? "others";
  }
  SwapSubCategory.initValues() {
    id = 0;
    name = "others";
    description = "others";
    subImg = "others";
    date = "others";
    arName = "others";
  }
}
