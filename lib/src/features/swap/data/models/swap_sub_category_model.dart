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
    id = json['id'];
    name = json['name'];
    description = json['description'];
    subImg = json['subImg'];
    date = json['date'];
    arName = json['arName'];
  }
}