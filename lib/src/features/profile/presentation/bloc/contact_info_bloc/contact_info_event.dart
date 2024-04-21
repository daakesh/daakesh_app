abstract class ContactInfoEvent {}

class GetContactInfoEvent extends ContactInfoEvent {}

class ResetContactInfoEvent extends ContactInfoEvent {}

class AddContactInfoEvent extends ContactInfoEvent {
  final String personalPhone;
  final String commercialPhone;
  final String whatsAppPhone;

  AddContactInfoEvent(
      {required this.personalPhone,
      required this.commercialPhone,
      required this.whatsAppPhone});
}

class EditContactInfoEvent extends ContactInfoEvent {
  final String? personalPhoneFlagEmoji;
  final String? personalPhoneCode;
  final String? commercialPhoneFlagEmoji;
  final String? commercialPhoneCode;
  final String? whatsAppPhoneFlagEmoji;
  final String? whatsAppPhoneCode;

  EditContactInfoEvent({
    this.personalPhoneFlagEmoji,
    this.personalPhoneCode,
    this.commercialPhoneFlagEmoji,
    this.commercialPhoneCode,
    this.whatsAppPhoneFlagEmoji,
    this.whatsAppPhoneCode,
  });
}

class ActivateUpdateContactInfoEvent extends ContactInfoEvent {
  final bool isUpdatePersonalActive;
  ActivateUpdateContactInfoEvent({required this.isUpdatePersonalActive});
}
