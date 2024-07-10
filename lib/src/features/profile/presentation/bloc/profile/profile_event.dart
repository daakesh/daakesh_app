abstract class ProfileEvent {}

class ChangeLangEvent extends ProfileEvent {
  final bool switchLangValue;
  ChangeLangEvent({required this.switchLangValue});
}

class SetValueLangEvent extends ProfileEvent {}

class ActivateUpdateEvent extends ProfileEvent {
  final bool? isUpdatePersonalActive;
  final String? locationFlagEmoji;
  ActivateUpdateEvent({
    this.isUpdatePersonalActive,
    this.locationFlagEmoji,
  });
}

class ChangeLocationFlagEvent extends ProfileEvent {
  final String flagEmoji;
  ChangeLocationFlagEvent({
    required this.flagEmoji,
  });
}

class UpdateLocationEvent extends ProfileEvent {
  final String country;
  final String city;
  final String address;
  UpdateLocationEvent({
    required this.country,
    required this.city,
    required this.address,
  });
}
