import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()){
    on<ActivateUpdateEvent>(_activateUpdate);
    on<ChangeLocationFlagEvent>(_changeLocationFlag);
    on<ChangeLangEvent>(_changeLang);
  }
  static ProfileBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  ///The initial value is disabled for editing data, This event allows users to make edits when desired for all screens.
  FutureOr<void> _activateUpdate(ActivateUpdateEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      isUpdatePersonalActive: event.isUpdatePersonalActive,
      ///TODO:return to make it according the BackEnd Data.
      locationFlagEmoji : '🇯🇴',
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
