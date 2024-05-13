import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<ActivateUpdateEvent>(_activateUpdate);
    on<ChangeLocationFlagEvent>(_changeLocationFlag);
    on<ChangeLangEvent>(_changeLang);
    on<SetValueLangEvent>(_setValueLang);
    on<UpdateLocationEvent>(_updateLocation);
  }
  static ProfileBloc get get => BlocProvider.of(Utils.currentContext);

  ///The initial value is disabled for editing data, This event allows users to make edits when desired for all screens.
  FutureOr<void> _activateUpdate(
      ActivateUpdateEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      isUpdatePersonalActive: event.isUpdatePersonalActive,
      locationFlagEmoji: '🇯🇴',
    ));
  }

  ///This event allows user to change the {Country Flag} of Location as [LocationScreen].
  FutureOr<void> _changeLocationFlag(
      ChangeLocationFlagEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(locationFlagEmoji: event.flagEmoji));
  }

  ///Event to swap between languages at [ProfileScreen].
  FutureOr<void> _changeLang(
      ChangeLangEvent event, Emitter<ProfileState> emit) async {
    if (event.switchLangValue) {
      ValueConstants.language = 'ar';
      await GetItUtils.prefs.setString(SharedPrefKeys.languageCode, 'ar');
    } else {
      ValueConstants.language = 'en';
      await GetItUtils.prefs.setString(SharedPrefKeys.languageCode, 'en');
    }
    Utils.openPageWithoutAnimation(const MainScreen(), popPreviousPages: true);
    await GetItUtils.prefs
        .setBool(SharedPrefKeys.language, event.switchLangValue);
    emit(state.copyWith(switchLangValue: event.switchLangValue));
  }

  FutureOr<void> _setValueLang(
      SetValueLangEvent event, Emitter<ProfileState> emit) {
    ValueConstants.language =
        GetItUtils.prefs.getData(SharedPrefKeys.languageCode) ?? 'en';
    bool? isEnLang =
        GetItUtils.prefs.getBoolean(SharedPrefKeys.language) ?? false;
    emit(state.copyWith(switchLangValue: isEnLang));
  }

  FutureOr<void> _updateLocation(
      UpdateLocationEvent event, Emitter<ProfileState> emit) async {
    String country = event.country;
    String city = event.city;
    String address = event.address;

    emit(state.copyWith(profileStateStatus: ProfileStateStatus.LOADING));
    ProgressCircleDialog.show();
    final result = await getIt
        .get<ProfileUseCases>()
        .updateLocation(country, city, address);
    result.fold((l) {
      ProgressCircleDialog.dismiss();
      emit(state.copyWith(profileStateStatus: ProfileStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      UserDataBloc.get.add(GetUserDataEvent());
      emit(state.copyWith(profileStateStatus: ProfileStateStatus.SUCCESS));
    });
  }
}
