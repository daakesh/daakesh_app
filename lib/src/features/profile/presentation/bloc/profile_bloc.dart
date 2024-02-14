import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<ProfileEvent>(_handleEvent);
  }
  static ProfileBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  Future<FutureOr<void>> _handleEvent(ProfileEvent event, Emitter<ProfileState> emit) async {

    if(event is ActivateUpdateEvent){
      emit(state.copyWith(
        isUpdatePersonalActive: event.isUpdatePersonalActive,
        ///TODO:return to make it according the BackEnd Data.
        personalPhoneFlagEmoji : '🇯🇴',
        personalPhoneCode : '962',
        commercialPhoneFlagEmoji : '🇯🇴',
        commercialPhoneCode : '962',
        whatsAppPhoneFlagEmoji : '🇯🇴',
        whatsAppPhoneCode : '962',
      ));
    }

    if(event is EditPersonalPhoneCountryEvent){
      emit(state.copyWith(
        personalPhoneFlagEmoji: event.phoneFlag,
        personalPhoneCode: event.phoneCode,

      ));
    }
    if(event is EditCommercialPhoneCountryEvent){
      emit(state.copyWith(
          commercialPhoneFlagEmoji: event.phoneFlag,
          commercialPhoneCode: event.phoneCode
      ));
    }
    if(event is EditWhatsAppPhoneCountryEvent){
      emit(state.copyWith(
          whatsAppPhoneFlagEmoji: event.phoneFlag,
          whatsAppPhoneCode: event.phoneCode
      ));
    }
    if(event is ChangeLocationFlagEvent){
      emit(state.copyWith(locationFlagEmoji: event.flagEmoji
      ));
    }






    if(event is ChangeLangEvent){
      emit(state.copyWith(
        switchLangValue: event.switchLangValue,
      ));
    }




    

  }
}
