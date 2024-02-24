class SectionModel {
  int? id;
  String? name;
  String? description;
  String? secImg;
  String? date;
  int? secOrder;
  String? arName;

  SectionModel({
    this.id,
    this.name,
    this.description,
    this.secImg,
    this.date,
    this.secOrder,
    this.arName,
  });

  SectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    secImg = json['secImg'];
    date = json['date'];
    secOrder = json['secOrder'];
    arName = json['arName'];
  }
}
