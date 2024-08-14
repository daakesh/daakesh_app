class OverAllRateModel {
  bool? status;
  String? error;
  Data? data;

  OverAllRateModel({this.status, this.error, this.data});

  OverAllRateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  double? average;
  Data({this.average});
  Data.fromJson(Map<String, dynamic> json) {
    average = json['average'].toDouble() ?? 0.0;
  }
}
