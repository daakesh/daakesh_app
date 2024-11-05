import '../../../../src.export.dart';

class ProCategoryModel {
  bool? status;
  String? error;
  List<ProCategoryItem>? data;

  ProCategoryModel({this.status, this.error, this.data});

  ProCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <ProCategoryItem>[];
      data = (json['data'] as List<dynamic>)
          .map((v) => ProCategoryItem.fromJson(v))
          .toList();
    }
  }
}

class ProCategoryItem {
  int? id;
  String? name;
  String? arName;

  ProCategoryItem({
    this.id,
    this.name,
    this.arName,
  });

  ProCategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = Utils.isEnglish ? json['name'] : json['arName'] ?? "others";
    arName = json['arName'];
  }
}
