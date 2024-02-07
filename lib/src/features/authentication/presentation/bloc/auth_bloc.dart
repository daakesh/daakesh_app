import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthEvent>(_handleEvent);
  }
  static AuthBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  Future<FutureOr<void>> _handleEvent(AuthEvent event, Emitter<AuthState> emit) async {

    if (event is OnLoginEvent) {
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
        UserModel userModel =UserModel.fromJson(r.data['data'] as Map<String,dynamic>);
        user.setUserData(userModel);
        emit(state.copyWith(authStateStatus: AuthStateStatus.SUCCESS));
      });
    }

    if(event is EnterPersonalInfoEvent){
      emit(state.copyWith(
        name: event.name,
        email: event.email,
        password: event.password,
      ));
    }
    if(event is EnterLocationInfoEvent){
      emit(state.copyWith(
        country: event.country,
        city: event.city,
        address: event.address,
      ));
    }
    if(event is ChangeFlagEvent){
      emit(state.copyWith(
          flagEmoji: event.flagEmoji
      ));
    }
    if(event is ChangeCodeCountryEvent){
      emit(state.copyWith(
          phoneFlag: event.phoneFlag,
          phoneCode: event.phoneCode
      ));
      debugPrint(event.phoneCode);
      debugPrint(state.phoneCode);
    }
    if(event is EnterPhoneEvent){
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
        UserModel userModel =UserModel.fromJson(r.data['data'] as Map<String,dynamic>);
        user.setUserData(userModel);
        emit(state.copyWith(authStateStatus: AuthStateStatus.SUCCESS));
      });
    }
    if(event is SetVerificationIdEvent){
      emit(
        state.copyWith(verificationId: event.verificationId),
      );
    }

    if(event is ValidateSMSCodeEvent){
      FirebaseAuthentication.verificationCompleted(state.verificationId,event.smsCode);
    }
    ///
    if(event is ActivateUserEvent){
      final result = await getIt.get<AuthUseCases>().activateUser(user.userData.id.toString());
      result.fold((l) {
        emit(state.copyWith(authStateStatus: AuthStateStatus.ERROR));
      }, (r) {
        if(!r.status!){
          ShowToastSnackBar.showSnackBars(message: r.message.toString());
          return;
        }
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        emit(state.copyWith(authStateStatus: AuthStateStatus.SUCCESS));
      });
    }
    ///
    if(event is ResendSMSCodeEvent){
      FirebaseAuthentication.resendSMSCode('+${state.phoneCode}${state.phone}');
    }














  }
}
