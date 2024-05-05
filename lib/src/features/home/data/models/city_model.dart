class CitiesModel {
  bool? status;
  String? error;
  List<CityItem>? data;

  CitiesModel({this.status, this.error, this.data});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <CityItem>[];
      data = (json['data'] as List<dynamic>)
          .map((v) => CityItem.fromJson(v))
          .toList();
    }
  }
}

class CityItem {
  String? city;
  String? country;
  int? pop2024;
  double? latitude;
  double? longitude;
  String? cityDisp;
  String? pop2024Disp;
  String? ar;

  CityItem(
      {this.city,
      this.country,
      this.pop2024,
      this.latitude,
      this.longitude,
      this.cityDisp,
      this.pop2024Disp,
      this.ar});

  CityItem.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    pop2024 = json['pop2024'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cityDisp = json['cityDisp'];
    pop2024Disp = json['pop2024Disp'];
    ar = json['ar'];
  }
}
