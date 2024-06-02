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
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    active = json['active'];
    userType = json['userType'];
    token = json['token'];
    email = json['email'];
    img = json['img'];
    deviceToken = json['deviceToken'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    location = json['location'];
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
