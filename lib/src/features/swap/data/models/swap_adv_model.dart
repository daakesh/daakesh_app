class SwapAdvModel {
  bool? status;
  bool? error;
  List<SwapAdvItem>? data;

  SwapAdvModel({
    this.status,
    this.error,
    this.data,
  });

  SwapAdvModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <SwapAdvItem>[];
      data = (json['data'] as List<dynamic>)
          .map((e) => SwapAdvItem.fromJson(e))
          .toList();
    }
  }
}

class SwapAdvItem {
  int? id;
  String? image;
  String? link;

  SwapAdvItem({this.id, this.image, this.link});

  SwapAdvItem.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    image = json['image'] ?? "others";
    link = json['link'] ?? "others";
  }
}
