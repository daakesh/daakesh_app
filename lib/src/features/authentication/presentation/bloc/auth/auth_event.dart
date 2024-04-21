import 'package:flutter/material.dart';

abstract class AuthEvent {}

///Login Event
class OnLoginEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  OnLoginEvent({
    required this.email,
    required this.password,
    required this.context,
  });
}

///SignUp Events
class EnterPersonalInfoEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  EnterPersonalInfoEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class EnterLocationInfoEvent extends AuthEvent {
  final String country;
  final String city;
  final String address;

  EnterLocationInfoEvent({
    required this.country,
    required this.city,
    required this.address,
  });
}

class ChangeFlagEvent extends AuthEvent {
  final String flagEmoji;
  ChangeFlagEvent({
    required this.flagEmoji,
  });
}

class ChangeCountryCodeEvent extends AuthEvent {
  final String phoneCode;
  final String phoneFlag;

  ChangeCountryCodeEvent({
    required this.phoneCode,
    required this.phoneFlag,
  });
}

class EnterPhoneEvent extends AuthEvent {
  final String phoneNumber;
  final BuildContext context;

  EnterPhoneEvent({
    required this.phoneNumber,
    required this.context,
  });
}

///
class SetVerificationIdEvent extends AuthEvent {
  final String verificationId;
  SetVerificationIdEvent({required this.verificationId});
}

///
class ValidateSMSCodeEvent extends AuthEvent {
  final String smsCode;
  final BuildContext context;
  ValidateSMSCodeEvent({required this.smsCode, required this.context});
}

class ActivateUserEvent extends AuthEvent {
  final BuildContext context;
  ActivateUserEvent({required this.context});
}

class ResendSMSCodeEvent extends AuthEvent {
  final BuildContext context;
  ResendSMSCodeEvent({required this.context});
}

class InitialValueEvent extends AuthEvent {}

class ToggleRememberMeValueEvent extends AuthEvent {
  final bool rememberMeValue;
  ToggleRememberMeValueEvent({
    required this.rememberMeValue,
  });
}
