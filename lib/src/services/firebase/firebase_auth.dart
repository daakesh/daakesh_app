import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../src.export.dart';

class FirebaseAuthentication {
  static final firebaseAuth = FirebaseAuth.instance;
  static int? _resendToken;

  static void verifyPhoneNumber(
      String phoneNumber, AuthManner authManner, BuildContext context) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException error) {
          if (error.code == 'invalid-phone-number') {
            ProgressCircleDialog.dismiss();
            ShowToastSnackBar.showSnackBars(
                message: 'The provided phone number is not valid.');
            return;
          }
          ProgressCircleDialog.dismiss();

          ShowToastSnackBar.showSnackBars(message: error.toString());
          debugPrint("ERROR $error");
        },
        codeSent: (String verificationId, int? resendToken) {
          if (authManner.isSignUpIn) {
            AuthBloc.get
                .add(SetVerificationIdEvent(verificationId: verificationId));
          }

          if (authManner.isForgetPassword) {
            ForgetPassBloc.get
                .add(PutVerificationIdEvent(verificationId: verificationId));
          }

          _resendToken = resendToken;
          Future.delayed(Duration.zero).then((value) =>
              ShowToastSnackBar.showSnackBars(
                  message: context.locale.code_sent_title));
          ProgressCircleDialog.dismiss();

          Utils.openNewPage(OTPScreen(authManner: authManner));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (error) {
      ProgressCircleDialog.dismiss();

      ShowToastSnackBar.showSnackBars(message: error.toString());
    }
  }

  static void verificationCompleted(String verificationId, String smsCode,
      AuthManner authManner, BuildContext context) async {
    ProgressCircleDialog.show();
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await firebaseAuth.signInWithCredential(credential);
      ProgressCircleDialog.dismiss();
      if (authManner.isSignUpIn) {
        GetItUtils.user.saveUserToken;
        Future.delayed(Duration.zero).then(
            (value) => AuthBloc.get.add(ActivateUserEvent(context: context)));

        Utils.openNewPage(const VerificationScreen(), popPreviousPages: true);
      }
      if (authManner.isForgetPassword) {
        Utils.openNewPage(const VerificationCompleteScreen(),
            popPreviousPages: true);
      }
    } catch (error) {
      ProgressCircleDialog.dismiss();
      ShowToastSnackBar.showSnackBars(message: error.toString());
      debugPrint('Wrong Code');
    }
  }

  static void resendSMSCode(String phoneNumber, BuildContext context) async {
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 2));
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
        forceResendingToken: _resendToken,
      );
      ProgressCircleDialog.dismiss();
      Future.delayed(Duration.zero).then((value) =>
          ShowToastSnackBar.showSnackBars(
              message: context.locale.code_resent_title));
    } catch (error) {
      ProgressCircleDialog.dismiss();
      debugPrint(error.toString());
    }
  }
}
