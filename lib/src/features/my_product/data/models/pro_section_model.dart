class ProductSectionModel {
  bool? status;
  String? error;
  List<ProSectionItemModel>? data;

  ProductSectionModel({this.status, this.error, this.data});

  ProductSectionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <ProSectionItemModel>[];
      data = (json['data'] as List<dynamic>)
          .map((v) => ProSectionItemModel.fromJson(v))
          .toList();
    }
  }
}

class ProSectionItemModel {
  int? id;
  String? name;
  String? arName;

  ProSectionItemModel({
    this.id,
    this.name,
    this.arName,
  });

  ProSectionItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? "Unknown";
    arName = json['arName'];
  }
}
