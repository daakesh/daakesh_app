
class ProCategoryModel {
  bool? status;
  String? error;
  ProCategoryData? data;

  ProCategoryModel({this.status, this.error, this.data});

  ProCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? ProCategoryData.fromJson(json['data']) : null;
  }

}

class ProCategoryData {
  int? lastPage;
  List<ProCategoryItem>? categoryItemList;

  ProCategoryData({
    this.lastPage,
    this.categoryItemList,
  });

  ProCategoryData.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    if (json['data'] != null) {
      categoryItemList = <ProCategoryItem>[];
      categoryItemList = (json['data'] as List<dynamic>)
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
    name = json['name'];
    arName = json['arName'];
  }
}