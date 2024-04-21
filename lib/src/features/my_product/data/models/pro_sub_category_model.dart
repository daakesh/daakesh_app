
class ProSubCategoryModel {
  bool? status;
  String? error;
  List<ProSubCategoryItem>? data;

  ProSubCategoryModel({this.status, this.error, this.data});

  ProSubCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <ProSubCategoryItem>[];
      data = (json['data'] as List<dynamic>)
          .map((v) => ProSubCategoryItem.fromJson(v))
          .toList();
    }
  }

}


class ProSubCategoryItem {
  int? id;
  String? name;
  String? arName;


  ProSubCategoryItem({
    this.id,
    this.name,
    this.arName,
  });

  ProSubCategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arName = json['arName'];
  }
}