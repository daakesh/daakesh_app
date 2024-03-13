class ProductSectionModel {
  bool? status;
  String? error;
  ProSectionData? data;

  ProductSectionModel({this.status, this.error, this.data});

  ProductSectionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? ProSectionData.fromJson(json['data']) : null;
  }
}

class ProSectionData {
  List<ProSectionItemModel>? data;
  int? lastPage;
  ProSectionData({this.data});

  ProSectionData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProSectionItemModel>[];
      data = (json['data'] as List<dynamic>).map((v) => ProSectionItemModel.fromJson(v)).toList();
    }
    lastPage = json['last_page'];
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
    name = json['name'];
    arName = json['arName'];
  }
}
