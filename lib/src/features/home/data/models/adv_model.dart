class AdvModel {
  bool? status;
  String? error;
  List<AdvItem>? data;

  AdvModel({
    this.status,
    this.error,
    this.data,
  });

  AdvModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <AdvItem>[];
      data = (json['data'] as List<dynamic>)
          .map((e) => AdvItem.fromJson(e))
          .toList();
    }
  }
}

class AdvItem {
  int? id;
  String? image;
  String? link;

  AdvItem({this.id, this.image, this.link});

  AdvItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    link = json['link'];
  }
  AdvItem.initValues() {
    id = 0;
    image = "others";
    link = "others";
  }
}
