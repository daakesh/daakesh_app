import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<ActivateUpdateEvent>(_activateUpdate);
    on<EditPersonalPhoneCountryEvent>(_editPersonalPhoneCountry);
    on<EditCommercialPhoneCountryEvent>(_editCommercialPhoneCountry);
    on<EditWhatsAppPhoneCountryEvent>(_editWhatsAppPhoneCountry);
    on<ChangeLocationFlagEvent>(_changeLocationFlag);
    on<ChangeLangEvent>(_changeLang);
  }
  static ProfileBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  ///The initial value is disabled for editing data, This event allows users to make edits when desired for all screens.
  FutureOr<void> _activateUpdate(ActivateUpdateEvent event, Emitter<ProfileState> emit) {
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
  ///This event allows user to change the {Flag, Country code} of personal phone at [ContactInfoScreen].
  FutureOr<void> _editPersonalPhoneCountry(EditPersonalPhoneCountryEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      personalPhoneFlagEmoji: event.phoneFlag,
      personalPhoneCode: event.phoneCode,
    ));
  }
  ///This event allows user to change the {Flag, Country code} of Commercial phone at [ContactInfoScreen].
  FutureOr<void> _editCommercialPhoneCountry(EditCommercialPhoneCountryEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
        commercialPhoneFlagEmoji: event.phoneFlag,
        commercialPhoneCode: event.phoneCode
    ));
  }
  ///This event allows user to change the {Flag, Country code} of WhatsApp phone at [ContactInfoScreen].
  FutureOr<void> _editWhatsAppPhoneCountry(EditWhatsAppPhoneCountryEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
        whatsAppPhoneFlagEmoji: event.phoneFlag,
        whatsAppPhoneCode: event.phoneCode
    ));
  }
  ///This event allows user to change the {Country Flag} of Location as [LocationScreen].
  FutureOr<void> _changeLocationFlag(ChangeLocationFlagEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(locationFlagEmoji: event.flagEmoji));
  }
  ///Event to swap between languages at [ProfileScreen].
  FutureOr<void> _changeLang(ChangeLangEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      switchLangValue: event.switchLangValue,
    ));
  }

}
