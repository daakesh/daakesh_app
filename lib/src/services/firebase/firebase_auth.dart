import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../src.export.dart';

class FirebaseAuthentication {
  static final firebaseAuth = FirebaseAuth.instance;
  static int? _resendToken;

  static void verifyPhoneNumber(
      String phoneNumber, AuthManner authManner) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException error) {
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
          ProgressCircleDialog.dismiss();
          ShowToastSnackBar.showSnackBars(message: 'Code sent');
          Utils.openNewPage(OTPScreen(authManner: authManner));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (error) {
      ProgressCircleDialog.dismiss();
      ShowToastSnackBar.showSnackBars(message: error.toString());
    }
  }

  static void verificationCompleted(
      String verificationId, String smsCode, AuthManner authManner) async {
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 1));
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await firebaseAuth.signInWithCredential(credential);
      ProgressCircleDialog.dismiss();
      if (authManner.isSignUpIn) {
        AuthBloc.get.add(ActivateUserEvent());
        GetItUtils.user.saveUserToken;
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

  static void resendSMSCode(String phoneNumber) async {
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
      ShowToastSnackBar.showSnackBars(message: 'Code resent');
    } catch (error) {
      ProgressCircleDialog.dismiss();
      debugPrint(error.toString());
    }
  }
}
