import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<OnLoginEvent>(_onLogin);
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
  static AuthBloc get get => BlocProvider.of(Utils.currentContext);

  ///Login Event,
  FutureOr<void> _onLogin(OnLoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStateStatus: AuthStateStatus.LOADING));
    ProgressCircleDialog.show();
    final result =
        await getIt.get<AuthUseCases>().onLogin(event.email, event.password);
    result.fold((l) {
      emit(state.copyWith(authStateStatus: AuthStateStatus.ERROR));
      ShowToastSnackBar.showErrorDialog(message: l.message.toString());
      ProgressCircleDialog.dismiss();
    }, (r) async {
      // ProgressCircleDialog.dismiss();
      // if (!r.status!) {
      //   ShowToastSnackBar.showSnackBars(message: r.message.toString());
      //   return;
      // }
      if (r.data['data'] == null) {
        ProgressCircleDialog.dismiss();
        ShowToastSnackBar.showErrorDialog(message: r.message.toString());
        return;
      }
      saveRememberData(state.rememberMeValue, event.email, event.password);
      UserModel userModel =
          UserModel.fromJson(r.data['data'] as Map<String, dynamic>);
      GetItUtils.user.setUserDataAndCheckIsActive(userModel, event.context);
      emit(state.copyWith(
          authStateStatus: AuthStateStatus.SUCCESS,
          phone: userModel.phoneNumber));
    });
  }

  void saveRememberData(
      bool rememberMeValue, String email, String password) async {
    if (rememberMeValue) {
      await GetItUtils.secPrefs.write(SharedPrefKeys.rememberMeEmail, email);
      await GetItUtils.secPrefs
          .write(SharedPrefKeys.rememberMePassword, password);
    } else {
      await GetItUtils.secPrefs.write(SharedPrefKeys.rememberMeEmail, '');
      await GetItUtils.secPrefs.write(SharedPrefKeys.rememberMePassword, '');
    }
  }

  ///Insert Personal info such as {Name, Email, Password}.
  FutureOr<void> _enterPersonalInfo(
      EnterPersonalInfoEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      name: event.name,
      email: event.email,
      password: event.password,
      deviceToken: event.deviceToken,
    ));
  }

  ///Insert Location info such as {Country, City, Address}.
  FutureOr<void> _enterLocationInfo(
      EnterLocationInfoEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      country: event.country,
      city: event.city,
      address: event.address,
      latitude: event.latitude,
      longitude: event.longitude,
    ));
  }

  ///Change a Flag of country attribute that belong to [Location info] or [EnterLocationInfoEvent].
  FutureOr<void> _changeCountryFlag(
      ChangeFlagEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(flagEmoji: event.flagEmoji));
  }

  ///Insert cell phone number info such as {country code, cell phone number}.
  ///In Addition make sign-up request for user with previous details in [EnterPersonalInfoEvent]&[EnterLocationInfoEvent].
  FutureOr<void> _enterPhone(
      EnterPhoneEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(phone: event.phoneNumber));
    ProgressCircleDialog.show();
    final result = await getIt.get<AuthUseCases>().addUser(
        state.name,
        state.email,
        state.password,
        '+${state.phoneCode}${state.phone}',
        'Normal',
        state.country,
        state.city,
        state.address,
        state.latitude,
        state.longitude,
        state.deviceToken);
    result.fold((l) {
      emit(state.copyWith(authStateStatus: AuthStateStatus.ERROR));
    }, (r) {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showErrorDialog(message: r.message.toString());
        return;
      }
      saveRememberData(state.rememberMeValue, state.email, state.password);
      UserModel userModel =
          UserModel.fromJson(r.data['data'] as Map<String, dynamic>);
      GetItUtils.user.setUserData(userModel);
      AuthBloc.get.add(ActivateUserEvent(context: event.context));
      emit(state.copyWith(
          authStateStatus: AuthStateStatus.SUCCESS,
          phone: userModel.phoneNumber));
    });
  }

  ///Change country code & flag of cell phone number in [EnterPhoneEvent].
  FutureOr<void> _changeCountryCode(
      ChangeCountryCodeEvent event, Emitter<AuthState> emit) async {
    emit(
        state.copyWith(phoneFlag: event.phoneFlag, phoneCode: event.phoneCode));
  }

  ///[VerificationId] Used to send OTP code via firebase.
  FutureOr<void> _setVerificationId(
      SetVerificationIdEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(verificationId: event.verificationId));
  }

  ///This event take [VerificationId] & [OTPCode] that user inserted and compare it with actual code message.
  FutureOr<void> _validateSMSCode(
      ValidateSMSCodeEvent event, Emitter<AuthState> emit) async {
    FirebaseAuthentication.verificationCompleted(state.verificationId,
        event.smsCode, AuthManner.SIGNUPIN, event.context);
  }

  ///This event make a user account is active if the [OTPCode] is verified.
  FutureOr<void> _activateUser(
      ActivateUserEvent event, Emitter<AuthState> emit) async {
    final result = await getIt
        .get<AuthUseCases>()
        .activateUser(GetItUtils.user.userData.id.toString());
    result.fold((l) {
      emit(state.copyWith(authStateStatus: AuthStateStatus.ERROR));
    }, (r) {
      if (!r.status!) {
        ShowToastSnackBar.showErrorDialog(message: r.message.toString());
        return;
      }
      //
      UserModel userData =
          UserModel.fromJson(r.data['data'] as Map<String, dynamic>);
      ValueConstants.userId = userData.id.toString();
      GetItUtils.user.setUserData(userData);
      UserDataBloc.get.add(SetUserDataEvent(userData: userData));
      GetItUtils.user.saveUserToken;
      Utils.openNewPage(const MainScreen(), popPreviousPages: true);
      emit(state.copyWith(authStateStatus: AuthStateStatus.SUCCESS));
    });
  }

  ///Resend SMS code if user never get any SMS message about the verification code.
  FutureOr<void> _resendSMSCode(
      ResendSMSCodeEvent event, Emitter<AuthState> emit) async {
    FirebaseAuthentication.resendSMSCode(
        GetItUtils.user.userData.phoneNumber.toString(), event.context);
  }

  ///
  FutureOr<void> _initialValue(
      InitialValueEvent event, Emitter<AuthState> emit) async {
    bool rememberMeValue =
        GetItUtils.prefs.getBoolean(SharedPrefKeys.isCheckedRememberMe) ??
            false;
    emit(state.copyWith(
      rememberMeValue: rememberMeValue,
    ));
  }

  ///
  FutureOr<void> _toggleRememberMeValueEvent(
      ToggleRememberMeValueEvent event, Emitter<AuthState> emit) async {
    await GetItUtils.prefs
        .setBool(SharedPrefKeys.isCheckedRememberMe, event.rememberMeValue);
    emit(state.copyWith(rememberMeValue: event.rememberMeValue));
  }
}
