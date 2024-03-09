
abstract class ForgetPassEvent {}

class CheckIsPasswordExistEvent extends ForgetPassEvent{
  final String phoneNumber;
  CheckIsPasswordExistEvent({required this.phoneNumber});
}

class PutVerificationIdEvent extends ForgetPassEvent{
  final String verificationId;
  PutVerificationIdEvent({required this.verificationId});
}

class ChangeCountryFlagCodeEvent extends ForgetPassEvent{
  final String phoneCode;
  final String phoneFlag;

  ChangeCountryFlagCodeEvent({
    required this.phoneCode,
    required this.phoneFlag,
  });
}
class VerifySMSCodeEvent extends ForgetPassEvent{
  final String smsCode;
  VerifySMSCodeEvent({required this.smsCode});
}
class ResendCodeEvent extends ForgetPassEvent{}

class ResetPasswordEvent extends ForgetPassEvent{
  final String password;
  ResetPasswordEvent({required this.password});
}
