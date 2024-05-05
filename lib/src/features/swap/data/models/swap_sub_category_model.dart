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
    name = json['name'] ?? "UnKnown";
    description = json['description'] ?? "UnKnown";
    subImg = json['subImg'] ?? "UnKnown";
    date = json['date'] ?? "UnKnown";
    arName = json['arName'] ?? "UnKnown";
  }
  SwapSubCategory.initValues() {
    id = 0;
    name = "UnKnown";
    description = "UnKnown";
    subImg = "UnKnown";
    date = "UnKnown";
    arName = "UnKnown";
  }
}
