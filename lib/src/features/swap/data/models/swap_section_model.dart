class SwapSectionModel {
  bool? status;
  String? error;
  SwapSectionData? data;

  SwapSectionModel({this.status, this.error, this.data});

  SwapSectionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? SwapSectionData.fromJson(json['data']) : null;
  }
}

class SwapSectionData {
  List<SwapSectionItemModel>? data;
  int? lastPage;
  SwapSectionData({this.data});

  SwapSectionData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SwapSectionItemModel>[];
      data = (json['data'] as List<dynamic>).map((v) => SwapSectionItemModel.fromJson(v)).toList();
    }
    lastPage = json['last_page'];

  }

}


class SwapSectionItemModel {
  int? id;
  String? name;
  String? description;
  String? secImg;
  String? date;
  int? secOrder;
  String? arName;

  SwapSectionItemModel({
    this.id,
    this.name,
    this.description,
    this.secImg,
    this.date,
    this.secOrder,
    this.arName,
  });

  SwapSectionItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    secImg = json['secImg'];
    date = json['date'];
    secOrder = json['secOrder'];
    arName = json['arName'];
  }
}
