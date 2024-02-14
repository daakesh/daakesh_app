abstract class ProfileEvent {}


class ChangeLangEvent extends ProfileEvent{
  final bool switchLangValue;
  ChangeLangEvent({required this.switchLangValue});
}


class ActivateUpdateEvent extends ProfileEvent{
  final bool isUpdatePersonalActive;
  ActivateUpdateEvent({required this.isUpdatePersonalActive});
}


class EditPersonalPhoneCountryEvent extends ProfileEvent{
  final String phoneCode;
  final String phoneFlag;

  EditPersonalPhoneCountryEvent({
    required this.phoneCode,
    required this.phoneFlag,
  });
}
class EditCommercialPhoneCountryEvent extends ProfileEvent{
  final String phoneCode;
  final String phoneFlag;

  EditCommercialPhoneCountryEvent({
    required this.phoneCode,
    required this.phoneFlag,
  });
}
class EditWhatsAppPhoneCountryEvent extends ProfileEvent{
  final String phoneCode;
  final String phoneFlag;

  EditWhatsAppPhoneCountryEvent({
    required this.phoneCode,
    required this.phoneFlag,
  });
}

class ChangeLocationFlagEvent extends ProfileEvent{
  final String flagEmoji;
  ChangeLocationFlagEvent({
    required this.flagEmoji,
  });
}