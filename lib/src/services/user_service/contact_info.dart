import 'package:injectable/injectable.dart';
import '../../src.export.dart';

abstract class ContactInfoService {
  ContactInfoNumber contactInfoNumber = ContactInfoNumber();
  void setContactInfo(
      String phoneNumber, String commercialNumber, String whatsAppNumber);
}

@Singleton(as: ContactInfoService)
class ContactInfoImpl implements ContactInfoService {
  @override
  ContactInfoNumber contactInfoNumber = ContactInfoNumber();
  @override
  void setContactInfo(
      String phoneNumber, String commercialNumber, String whatsAppNumber) {
    contactInfoNumber.phoneNumber = phoneNumber;
    contactInfoNumber.commercialNumber = commercialNumber;
    contactInfoNumber.whatsAppNumber = whatsAppNumber;
  }
}
