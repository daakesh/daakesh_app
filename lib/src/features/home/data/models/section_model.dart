class SectionModel {
  bool? status;
  String? error;
  SectionData? data;

  SectionModel({this.status, this.error, this.data});

  SectionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? SectionData.fromJson(json['data']) : null;
  }
}

class SectionData {
  List<SectionItemModel>? data;
  int? lastPage;
  SectionData({this.data});

  SectionData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SectionItemModel>[];
      data = (json['data'] as List<dynamic>)
          .map((v) => SectionItemModel.fromJson(v))
          .toList();
    }
    lastPage = json['last_page'];
  }
}

class SectionItemModel {
  int? id;
  String? name;
  String? description;
  String? secImg;
  String? date;
  int? secOrder;
  String? arName;

  SectionItemModel({
    this.id,
    this.name,
    this.description,
    this.secImg,
    this.date,
    this.secOrder,
    this.arName,
  });

  SectionItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "Unknown";
    description = json['description'] ?? "Unknown";
    secImg = json['secImg'] ?? "Unknown";
    date = json['date'] ?? "Unknown";
    secOrder = json['secOrder'] ?? 0;
    arName = json['arName'] ?? "Unknown";
  }
  SectionItemModel.initValues() {
    id = 0;
    name = "Unknown";
    description = "Unknown";
    secImg = "Unknown";
    date = "Unknown";
    secOrder = 0;
    arName = "Unknown";
  }
}
