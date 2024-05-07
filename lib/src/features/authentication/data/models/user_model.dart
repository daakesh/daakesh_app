class UserModel {
  String? id;
  String? name;
  String? phoneNumber;
  String? password;
  int? active;
  String? userType;
  String? token;
  String? email;
  String? img;
  String? deviceToken;
  String? location;
  String? country;
  String? city;
  String? address;
  UserModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.password,
    this.active,
    this.userType,
    this.token,
    this.email,
    this.img,
    this.deviceToken,
    this.country,
    this.city,
    this.address,
    this.location,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "unKnown";
    name = json['name'] ?? "unKnown";
    phoneNumber = json['phoneNumber'] ?? "unKnown";
    password = json['password'] ?? "unKnown";
    active = json['active'];
    userType = json['userType'] ?? "unKnown";
    token = json['token'] ?? "unKnown";
    email = json['email'] ?? "unKnown";
    img = json['img'] ?? "unKnown";
    deviceToken = json['deviceToken'] ?? "unKnown";
    country = json['country'] ?? "unKnown";
    city = json['city'] ?? "unKnown";
    address = json['address'] ?? "unKnown";
    location = json['location'] ?? "unKnown";
  }
  UserModel.initValues() {
    id = "unKnown";
    name = "unKnown";
    phoneNumber = "unKnown";
    password = "unKnown";
    active = 1;
    userType = "unKnown";
    token = "unKnown";
    email = "unKnown";
    img = "unKnown";
    deviceToken = "unKnown";
    country = "unKnown";
    city = "unKnown";
    address = "unKnown";
    location = "unKnown";
  }
}
