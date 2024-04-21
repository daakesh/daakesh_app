abstract class ProfileEvent {}

class ChangeLangEvent extends ProfileEvent {
  final bool switchLangValue;
  ChangeLangEvent({required this.switchLangValue});
}

class SetValueLangEvent extends ProfileEvent {}

class ActivateUpdateEvent extends ProfileEvent {
  final bool isUpdatePersonalActive;
  ActivateUpdateEvent({required this.isUpdatePersonalActive});
}

class ChangeLocationFlagEvent extends ProfileEvent {
  final String flagEmoji;
  ChangeLocationFlagEvent({
    required this.flagEmoji,
  });
}
