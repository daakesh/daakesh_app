abstract class AuthEvent {}

class OnLoginEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  OnLoginEvent({
    required this.phoneNumber,
    required this.password,
  });
}
