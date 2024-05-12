import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ForgetPassBloc extends Bloc<ForgetPassEvent, ForgetPassState> {
  ForgetPassBloc() : super(const ForgetPassState()) {
    on<CheckIsPasswordExistEvent>(_checkIsPasswordExist);
    on<ChangeCountryFlagCodeEvent>(_changeCountryCode);
    on<PutVerificationIdEvent>(_putVerificationId);
    on<VerifySMSCodeEvent>(_verifySMSCode);
    on<ResendCodeEvent>(_resendSMSCode);
    on<ResetPasswordEvent>(_resetPassword);
  }

  static ForgetPassBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _checkIsPasswordExist(
      CheckIsPasswordExistEvent event, Emitter<ForgetPassState> emit) async {
    String phoneNumber = event.phoneNumber;
    emit(state.copyWith(
        forgetPassStateStatus: ForgetPassStateStatus.LOADING,
        phone: phoneNumber));
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 1));
    final result = await getIt
        .get<AuthUseCases>()
        .isPhoneNumberExist('+${state.phoneCode}$phoneNumber');
    result.fold((l) {
      ProgressCircleDialog.dismiss();
      emit(state.copyWith(forgetPassStateStatus: ForgetPassStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      //if (!r.data['data']) {
      //  ShowToastSnackBar.showSnackBars(message: r.message.toString());
      //  return;
      //}
      FirebaseAuthentication.verifyPhoneNumber(
          '+${state.phoneCode}$phoneNumber',
          AuthManner.FORGETPASSWORD,
          event.context);
      emit(
          state.copyWith(forgetPassStateStatus: ForgetPassStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _changeCountryCode(
      ChangeCountryFlagCodeEvent event, Emitter<ForgetPassState> emit) async {
    emit(
        state.copyWith(flagEmoji: event.phoneFlag, phoneCode: event.phoneCode));
  }

  FutureOr<void> _putVerificationId(
      PutVerificationIdEvent event, Emitter<ForgetPassState> emit) {
    emit(state.copyWith(verificationId: event.verificationId));
  }

  FutureOr<void> _verifySMSCode(
      VerifySMSCodeEvent event, Emitter<ForgetPassState> emit) {
    FirebaseAuthentication.verificationCompleted(state.verificationId,
        event.smsCode, AuthManner.FORGETPASSWORD, event.context);
  }

  FutureOr<void> _resendSMSCode(
      ResendCodeEvent event, Emitter<ForgetPassState> emit) async {
    FirebaseAuthentication.resendSMSCode(
        '+${state.phoneCode + state.phone}', event.context);
  }

  FutureOr<void> _resetPassword(
      ResetPasswordEvent event, Emitter<ForgetPassState> emit) async {
    String password = event.password;
    emit(state.copyWith(forgetPassStateStatus: ForgetPassStateStatus.LOADING));
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 1));
    final result = await getIt
        .get<AuthUseCases>()
        .updatePassword('+${state.phoneCode + state.phone}', password);
    result.fold((l) {
      emit(state.copyWith(forgetPassStateStatus: ForgetPassStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
      ProgressCircleDialog.dismiss();
    }, (r) async {
      if (!r.status!) {
        ProgressCircleDialog.dismiss();
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      ProgressCircleDialog.dismiss();
      Utils.openNewPage(const ResetPassSuccessScreen(), popPreviousPages: true);
      emit(
          state.copyWith(forgetPassStateStatus: ForgetPassStateStatus.SUCCESS));
    });
  }
}
