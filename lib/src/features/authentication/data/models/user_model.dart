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

  UserModel(
      {this.id,
        this.name,
        this.phoneNumber,
        this.password,
        this.active,
        this.userType,
        this.token,
        this.email,
        this.img,
        this.deviceToken});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['active'] = active;
    data['userType'] = userType;
    data['token'] = token;
    data['email'] = email;
    data['img'] = img;
    data['deviceToken'] = deviceToken;
    return data;
  }
}