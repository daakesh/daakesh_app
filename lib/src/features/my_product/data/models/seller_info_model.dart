class SellerInfoModel {
  bool? status;
  String? error;
  SellerInfoData? data;

  SellerInfoModel({this.status, this.error, this.data});

  SellerInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? SellerInfoData.fromJson(json['data']) : null;
  }
}

class SellerInfoData {
  String? userName;
  String? usedPhone;
  String? id;
  int? active;
  int? storeRate;
  List<SellerInfoRate>? rate;

  SellerInfoData({
    this.userName,
    this.usedPhone,
    this.id,
    this.active,
    this.storeRate,
    this.rate,
  });

  SellerInfoData.fromJson(Map<String, dynamic> json) {
    userName = json['User Name'] ?? "others";
    usedPhone = json['Used Phone'] ?? "others";
    id = json['id'] ?? "others";
    active = json['active'] ?? 1;
    storeRate = json['storeRate'] ?? 0;
    if (json['rate'] != null) {
      rate = <SellerInfoRate>[];
      rate = (json['rate'] as List<dynamic>)
          .map((e) => SellerInfoRate.fromJson(e))
          .toList();
    }
  }
}

class SellerInfoRate {
  int? id;
  int? rateValue;

  SellerInfoRate({this.id, this.rateValue});

  SellerInfoRate.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    rateValue = json['rateValue'] ?? 0;
  }
}
