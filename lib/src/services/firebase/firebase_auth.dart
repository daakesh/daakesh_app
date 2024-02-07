import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../src.export.dart';

class FirebaseAuthentication{
  static final firebaseAuth = FirebaseAuth.instance;
  static int? _resendToken ;

  static void verifyPhoneNumber(String phoneNumber,{bool isLoginManner = false}) async{
    try{
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException error) {
          ProgressCircleDialog.dismiss();
          ShowToastSnackBar.showSnackBars(message: error.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          AuthBloc.get.add(SetVerificationIdEvent(verificationId: verificationId));
          _resendToken = resendToken;
          ProgressCircleDialog.dismiss();
          ShowToastSnackBar.showSnackBars(message: 'Code sent');
          openNewPage(const OTPScreen());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          ProgressCircleDialog.dismiss();
        },
      );
    }catch(error){
      ProgressCircleDialog.dismiss();
      ShowToastSnackBar.showSnackBars(message: error.toString());
    }
  }

  static void verificationCompleted(String verificationId,String smsCode)async{
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 2));
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      await firebaseAuth.signInWithCredential(credential);
      ProgressCircleDialog.dismiss();
      ///
      AuthBloc.get.add(ActivateUserEvent());
      openNewPage(const VerificationScreen());
    } catch (error) {
      ProgressCircleDialog.dismiss();
      ShowToastSnackBar.showSnackBars(message: error.toString());
      debugPrint('Wrong Code');
    }
  }

  static void resendSMSCode(String phoneNumber) async{
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 2));
    try{
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

    }catch(error){
      ProgressCircleDialog.dismiss();
      debugPrint(error.toString());
    }
  }

}
