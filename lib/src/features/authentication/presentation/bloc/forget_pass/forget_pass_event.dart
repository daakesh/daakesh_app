import 'package:flutter/material.dart';

abstract class ForgetPassEvent {}

class CheckIsPasswordExistEvent extends ForgetPassEvent {
  final BuildContext context;
  final String phoneNumber;
  CheckIsPasswordExistEvent({required this.phoneNumber, required this.context});
}

class PutVerificationIdEvent extends ForgetPassEvent {
  final String verificationId;
  PutVerificationIdEvent({required this.verificationId});
}

class ChangeCountryFlagCodeEvent extends ForgetPassEvent {
  final String phoneCode;
  final String phoneFlag;

  ChangeCountryFlagCodeEvent({
    required this.phoneCode,
    required this.phoneFlag,
  });
}

class VerifySMSCodeEvent extends ForgetPassEvent {
  final String smsCode;
  final BuildContext context;
  VerifySMSCodeEvent({required this.smsCode, required this.context});
}

class ResendCodeEvent extends ForgetPassEvent {
  final BuildContext context;
  ResendCodeEvent({required this.context});
}

class ResetPasswordEvent extends ForgetPassEvent {
  final BuildContext context;
  final String password;
  final String email;
  final String phoneNumber;
  ResetPasswordEvent(
      {required this.context,
      required this.email,
      required this.phoneNumber,
      required this.password});
}
