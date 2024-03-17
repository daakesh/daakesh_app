import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<OnLoginEvent>(_onLogin);
    on<GetUserDataEvent>(_getUserData);
    on<EnterPersonalInfoEvent>(_enterPersonalInfo);
    on<EnterLocationInfoEvent>(_enterLocationInfo);
    on<ChangeFlagEvent>(_changeCountryFlag);
    on<EnterPhoneEvent>(_enterPhone);
    on<ChangeCountryCodeEvent>(_changeCountryCode);
    on<SetVerificationIdEvent>(_setVerificationId);
    on<ValidateSMSCodeEvent>(_validateSMSCode);
    on<ActivateUserEvent>(_activateUser);
    on<ResendSMSCodeEvent>(_resendSMSCode);
    on<InitialValueEvent>(_initialValue);
    on<ToggleRememberMeValueEvent>(_toggleRememberMeValueEvent);
  }
  static AuthBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  ///Login Event,
  FutureOr<void> _onLogin(OnLoginEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(authStateStatus: AuthStateStatus.LOADING));
    ProgressCircleDialog.show();
    final result = await getIt.get<AuthUseCases>().onLogin(event.phoneNumber, event.password);
    result.fold((l) {
      emit(state.copyWith(authStateStatus: AuthStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
      ProgressCircleDialog.dismiss();
    }, (r) async{
      if(!r.status!){
        ProgressCircleDialog.dismiss();
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      ProgressCircleDialog.dismiss();
      saveRememberData(state.rememberMeValue,event.phoneNumber,event.password);
      UserModel userModel =UserModel.fromJson(r.data['data'] as Map<String,dynamic>);
      user.setUserDataAndCheckIsActive(userModel);
      emit(state.copyWith(authStateStatus: AuthStateStatus.SUCCESS));
    });
  }
  void saveRememberData(bool rememberMeValue,String phoneNumber,String password)async{
    if (rememberMeValue) {
      await getIt.get<SecureSharedPref>().write('REMEMBER_ME_EMAIL', phoneNumber);
      await getIt.get<SecureSharedPref>().write('REMEMBER_ME_PASSWORD', password);
    } else{
      await getIt.get<SecureSharedPref>().write('REMEMBER_ME_EMAIL', '');
      await getIt.get<SecureSharedPref>().write('REMEMBER_ME_PASSWORD', '');
    }
  }
  ///Get User Data Event,
  FutureOr<void> _getUserData(GetUserDataEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(authStateStatus: AuthStateStatus.LOADING));
    final result = await getIt.get<AuthUseCases>().getUserData();
    result.fold((l) {
      emit(state.copyWith(authStateStatus: AuthStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      UserModel userModel =UserModel.fromJson(r.data['data'] as Map<String,dynamic>);
      user.setUserData(userModel);
      emit(state.copyWith(authStateStatus: AuthStateStatus.SUCCESS));
    });
  }
  ///Insert Personal info such as {Name, Email, Password}.
  FutureOr<void> _enterPersonalInfo(EnterPersonalInfoEvent event, Emitter<AuthState> emit)async {
    emit(state.copyWith(
      name: event.name,
      email: event.email,
      password: event.password,
    ));
  }
  ///Insert Location info such as {Country, City, Address}.
  FutureOr<void> _enterLocationInfo(EnterLocationInfoEvent event, Emitter<AuthState> emit)async {
    emit(state.copyWith(
      country: event.country,
      city: event.city,
      address: event.address,
    ));
  }
  ///Change a Flag of country attribute that belong to [Location info] or [EnterLocationInfoEvent].
  FutureOr<void> _changeCountryFlag(ChangeFlagEvent event, Emitter<AuthState> emit)async {
    emit(state.copyWith(flagEmoji: event.flagEmoji));
  }
  ///Insert cell phone number info such as {country code, cell phone number}.
  ///In Addition make sign-up request for user with previous details in [EnterPersonalInfoEvent]&[EnterLocationInfoEvent].
  FutureOr<void> _enterPhone(EnterPhoneEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(phone:event.phoneNumber));
    ProgressCircleDialog.show();
    await Future.delayed(const Duration(seconds: 1));
    final result = await getIt.get<AuthUseCases>().addUser(
      state.name,
      state.email,
      state.password,
      '+${state.phoneCode}${state.phone}',
      'Normal',
    );
    result.fold((l) {
      emit(state.copyWith(authStateStatus: AuthStateStatus.ERROR));
    }, (r) {
      if(!r.status!){
        ProgressCircleDialog.dismiss();
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      ProgressCircleDialog.dismiss();

      UserModel userModel =UserModel.fromJson(r.data['data'] as Map<String,dynamic>);
      user.setUserDataAndCheckIsActive(userModel);
      emit(state.copyWith(authStateStatus: AuthStateStatus.SUCCESS));
    });
  }
  ///Change country code & flag of cell phone number in [EnterPhoneEvent].
  FutureOr<void> _changeCountryCode(ChangeCountryCodeEvent event, Emitter<AuthState> emit)async {
    emit(state.copyWith(
        phoneFlag: event.phoneFlag,
        phoneCode: event.phoneCode
    ));
  }
  ///[VerificationId] Used to send OTP code via firebase.
  FutureOr<void> _setVerificationId(SetVerificationIdEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(verificationId: event.verificationId));
  }
  ///This event take [VerificationId] & [OTPCode] that user inserted and compare it with actual code message.
  FutureOr<void> _validateSMSCode(ValidateSMSCodeEvent event, Emitter<AuthState> emit)async{
    FirebaseAuthentication.verificationCompleted(state.verificationId,event.smsCode,AuthManner.SIGNUPIN);
  }
  ///This event make a user account is active if the [OTPCode] is verified.
  FutureOr<void> _activateUser(ActivateUserEvent event, Emitter<AuthState> emit) async{
    final result = await getIt.get<AuthUseCases>().activateUser(user.userData.id.toString());
    result.fold((l) {
      emit(state.copyWith(authStateStatus: AuthStateStatus.ERROR));
    }, (r) {
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(authStateStatus: AuthStateStatus.SUCCESS));
    });
  }
  ///Resend SMS code if user never get any SMS message about the verification code.
  FutureOr<void> _resendSMSCode(ResendSMSCodeEvent event, Emitter<AuthState> emit)async {
    FirebaseAuthentication.resendSMSCode(user.userData.phoneNumber.toString());
  }
  ///
  FutureOr<void> _initialValue(InitialValueEvent event, Emitter<AuthState> emit)async {
    bool rememberMeValue = prefs.getData('REMEMBER_ME_VALUE') ?? false;
    emit(state.copyWith(rememberMeValue: rememberMeValue,));
  }
  ///
  FutureOr<void> _toggleRememberMeValueEvent(ToggleRememberMeValueEvent event, Emitter<AuthState> emit) async{
    await prefs.setBool('REMEMBER_ME_VALUE', event.rememberMeValue);
    emit(state.copyWith(rememberMeValue: event.rememberMeValue));
  }


}
