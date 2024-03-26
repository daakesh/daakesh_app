class ContactInfoModel{
  bool? status;
  String? error;
  List<ContactInfoData>? data;

  ContactInfoModel({
    this.status,
    this.error,
    this.data,
  });

  ContactInfoModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    error = json['error'];
    if(json['data'] != null){
      data = <ContactInfoData>[];
      data = (json['data'] as List<dynamic>).map((e) => ContactInfoData.fromJson(e)).toList();
    }
  }
}

class ContactInfoData{
  String? personalPhoneNumber;
  String? commercialPhoneNumber;
  String? whatsappPhoneNumber;

  ContactInfoData({
    this.personalPhoneNumber,
    this.commercialPhoneNumber,
    this.whatsappPhoneNumber,
  });

  ContactInfoData.fromJson(Map<String,dynamic> json){
    personalPhoneNumber = json['personal_phone_number'];
    commercialPhoneNumber = json['commercial_phone_number'];
    whatsappPhoneNumber = json['whatsapp_commercial_phone_number'];
  }

}