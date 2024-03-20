abstract class SellerInfoEvent {}

class GetSellerInfoEvent extends SellerInfoEvent{}

class EditSellerInfoEvent extends SellerInfoEvent{
  final String userName;
  final String phoneNumber;
  final String whatsappNumber;
  EditSellerInfoEvent({
      required this.userName,
      required this.phoneNumber,
      required this.whatsappNumber,
  });
}

