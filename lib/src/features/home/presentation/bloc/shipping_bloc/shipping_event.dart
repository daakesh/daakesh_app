abstract class ShippingEvent{}


class SelectShippingCountryFlagEvent extends ShippingEvent{
  final String flagEmoji;
  SelectShippingCountryFlagEvent({required this.flagEmoji});
}

class SelectShippingPhoneNumberEvent extends ShippingEvent{
  final String flagEmoji;
  final String phoneCode;
  SelectShippingPhoneNumberEvent({
    required this.flagEmoji,
    required this.phoneCode,
  });
}

