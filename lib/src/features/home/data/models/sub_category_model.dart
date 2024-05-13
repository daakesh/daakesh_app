import '../../../../src.export.dart';

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
    name = Utils.isEnglish ? json['name'] : json['arName'] ?? "Unknown";
    description = json['description'] ?? "Unknown";
    subImg = json['subImg'] ?? "Unknown";
    date = json['date'] ?? "Unknown";
    arName = json['arName'] ?? "Unknown";
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
