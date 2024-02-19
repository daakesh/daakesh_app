class BrandModel {
  int? id;
  String? brandName;
  String? description;
  String? brandImg;
  String? date;
  int? secID;
  String? arName;

  BrandModel(
      {this.id,
        this.brandName,
        this.description,
        this.brandImg,
        this.date,
        this.secID,
        this.arName});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'];
    description = json['description'];
    brandImg = json['brandImg'];
    date = json['date'];
    secID = json['secID'];
    arName = json['arName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brandName'] = brandName;
    data['description'] = description;
    data['brandImg'] = brandImg;
    data['date'] = date;
    data['secID'] = secID;
    data['arName'] = arName;
    return data;
  }
}