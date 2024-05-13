import '../../../../src.export.dart';

class ProBrandModel {
  bool? status;
  String? error;
  List<ProBrandItem>? data;

  ProBrandModel({this.status, this.error, this.data});

  ProBrandModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <ProBrandItem>[];
      data = (json['data'] as List<dynamic>)
          .map((v) => ProBrandItem.fromJson(v))
          .toList();
    }
  }
}

class ProBrandItem {
  int? id;
  String? name;
  String? arName;

  ProBrandItem({
    this.id,
    this.name,
    this.arName,
  });

  ProBrandItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = Utils.isEnglish ? json['brandName'] : json['arName'];
    arName = json['arName'];
  }
}
