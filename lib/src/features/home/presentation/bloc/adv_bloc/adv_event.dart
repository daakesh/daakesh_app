abstract class AdvEvent {}

class GetAdvertisementDataEvent extends AdvEvent {}

class ClickAdvEvent extends AdvEvent {
  final String advId;
  ClickAdvEvent({required this.advId});
}
