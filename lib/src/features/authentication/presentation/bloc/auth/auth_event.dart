abstract class AuthEvent {}

///Login Event
class OnLoginEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  OnLoginEvent({
    required this.phoneNumber,
    required this.password,
  });
}
///Get user data
class GetUserDataEvent extends AuthEvent {}
///SignUp Events
class EnterPersonalInfoEvent extends AuthEvent{
  final String name;
  final String email;
  final String password;

  EnterPersonalInfoEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}
class EnterLocationInfoEvent extends AuthEvent{
  final String country;
  final String city;
  final String address;

  EnterLocationInfoEvent({
    required this.country,
    required this.city,
    required this.address,
  });
}
class ChangeFlagEvent extends AuthEvent{
  final String flagEmoji;
  ChangeFlagEvent({
    required this.flagEmoji,
  });
}
class ChangeCountryCodeEvent extends AuthEvent{
  final String phoneCode;
  final String phoneFlag;

  ChangeCountryCodeEvent({
    required this.phoneCode,
    required this.phoneFlag,
  });
}
class EnterPhoneEvent extends AuthEvent{
  final String phoneNumber;
  EnterPhoneEvent({
    required this.phoneNumber,
  });
}
///
class SetVerificationIdEvent extends AuthEvent{
  final String verificationId;
  SetVerificationIdEvent({required this.verificationId});
}
///
class ValidateSMSCodeEvent extends AuthEvent{
  final String smsCode;
  ValidateSMSCodeEvent({required this.smsCode});
}
class ActivateUserEvent extends AuthEvent{}
class ResendSMSCodeEvent extends AuthEvent{}

class InitialValueEvent extends AuthEvent{}

class ToggleRememberMeValueEvent extends AuthEvent{
  final bool rememberMeValue;
  ToggleRememberMeValueEvent({
    required this.rememberMeValue,
  });
}







