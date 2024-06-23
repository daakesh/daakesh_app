class SubCategoryModel {
  bool? status;
  String? error;
  List<SubCategory>? data;

  SubCategoryModel({this.status, this.error, this.data});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <SubCategory>[];
      data = (json['data'] as List<dynamic>)
          .map((e) => SubCategory.fromJson(e))
          .toList();
    }
  }
}

class SubCategory {
  int? id;
  String? name;
  String? description;
  String? subImg;
  String? date;
  String? arName;

  SubCategory(
      {this.id,
      this.name,
      this.description,
      this.subImg,
      this.date,
      this.arName});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "Unknown";
    description = json['description'] ?? "Unknown";
    subImg = json['subImg'] ?? "Unknown";
    date = json['date'] ?? "Unknown";
    arName = json['arName'] ?? json['name'];
  }

  SubCategory.initValues() {
    id = 0;
    name = "Unknown";
    description = "Unknown";
    subImg = "Unknown";
    date = "Unknown";
    arName = "Unknown";
  }
}
