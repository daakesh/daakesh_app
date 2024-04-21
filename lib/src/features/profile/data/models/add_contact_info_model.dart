import 'package:daakesh/src/core/constants/constants.export.dart';

class AddContactInfoModel {
  String? personalPhoneNumber;
  String? personalPhoneNumberCountryCode;
  String? commercialPhoneNumberCountryCode;
  String? whatsappCommercialPhoneNumberCountryCode;
  String? commercialPhoneNumber;
  String? whatsappCommercialPhoneNumber;

  AddContactInfoModel({
    this.personalPhoneNumber,
    this.personalPhoneNumberCountryCode,
    this.commercialPhoneNumberCountryCode,
    this.whatsappCommercialPhoneNumberCountryCode,
    this.commercialPhoneNumber,
    this.whatsappCommercialPhoneNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = ValueConstants.userId;
    data['personal_phone_number'] = personalPhoneNumber;
    data['personal_phone_number_country_code'] = personalPhoneNumberCountryCode;
    data['commercial_phone_number_country_code'] =
        commercialPhoneNumberCountryCode;
    data['whatsapp_commercial_phone_number_country_code'] =
        whatsappCommercialPhoneNumberCountryCode;
    data['commercial_phone_number'] = commercialPhoneNumber;
    data['whatsapp_commercial_phone_number'] = whatsappCommercialPhoneNumber;
    return data;
  }
}
