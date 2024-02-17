import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()){
    on<ActivateUpdateEvent>(_activateUpdate);
    on<EditContactInfoEvent>(_editContactInfoEvent);
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
      locationFlagEmoji : '🇯🇴',
    ));
  }
  ///This event allows user to change the {Flag, Country code} of contact info at [ContactInfoScreen].
  FutureOr<void> _editContactInfoEvent(EditContactInfoEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      personalPhoneFlagEmoji: event.personalPhoneFlagEmoji,
      personalPhoneCode: event.personalPhoneCode,
      commercialPhoneFlagEmoji: event.commercialPhoneFlagEmoji,
      commercialPhoneCode: event.commercialPhoneCode,
      whatsAppPhoneFlagEmoji: event.whatsAppPhoneFlagEmoji,
      whatsAppPhoneCode: event.whatsAppPhoneCode
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
