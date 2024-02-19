class CategoryModel {
  int? id;
  String? name;
  String? description;
  String? catImg;
  String? date;
  int? secID;
  String? arName;

  CategoryModel(
      {this.id,
        this.name,
        this.description,
        this.catImg,
        this.date,
        this.secID,
        this.arName});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    catImg = json['catImg'];
    date = json['date'];
    secID = json['secID'];
    arName = json['arName'];
  }
}