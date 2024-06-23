class BrandModel {
  bool? status;
  String? error;
  BrandData? data;

  BrandModel({
    this.status,
    this.error,
    this.data,
  });

  BrandModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? BrandData.fromJson(json['data']) : null;
  }
}

class BrandData {
  int? lastPage;
  List<BrandItem>? brandItemList;

  BrandData({
    this.lastPage,
    this.brandItemList,
  });

  BrandData.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    if (json['data'] != null) {
      brandItemList = <BrandItem>[];
      brandItemList = (json['data'] as List<dynamic>)
          .map((e) => BrandItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }
}

class BrandItem {
  int? id;
  String? brandName;
  String? description;
  String? brandImg;
  String? date;
  int? secID;
  String? arName;

  BrandItem({
    this.id,
    this.brandName,
    this.description,
    this.brandImg,
    this.date,
    this.secID,
    this.arName,
  });

  BrandItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'] ?? "Unknown";
    description = json['description'];
    brandImg = json['brandImg'];
    date = json['date'];
    secID = json['secID'];
    arName = json['arName'] ?? json['brandName'];
  }

  BrandItem.initValues() {
    id = 0;
    brandName = "Null";
    description = "Unknown";
    brandImg = "Unknown";
    date = "Unknown";
    secID = 0;
    arName = "بدون";
  }
}
