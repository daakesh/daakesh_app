abstract class ProfileEvent {}


class ChangeLangEvent extends ProfileEvent{
  final bool switchLangValue;
  ChangeLangEvent({required this.switchLangValue});
}

class ActivateUpdateEvent extends ProfileEvent{
  final bool isUpdatePersonalActive;
  ActivateUpdateEvent({required this.isUpdatePersonalActive});
}


class EditContactInfoEvent extends ProfileEvent{
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

class ChangeLocationFlagEvent extends ProfileEvent{
  final String flagEmoji;
  ChangeLocationFlagEvent({
    required this.flagEmoji,
  });
}