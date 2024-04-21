class AddOrderModel {
  String? userId;
  int? itemId;
  double? price;
  String? location;
  String? status;

  AddOrderModel({
    this.userId,
    this.itemId,
    this.price,
    this.location,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['item_id'] = itemId;
    data['price'] = price;
    data['location'] = location;
    data['status'] = status;
    return data;
  }
}
