import 'dart:async';
import 'package:daakesh/src/features/profile/data/models/language_data_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<SetValueLangEvent>(_setValueLang);
    on<ActivateUpdateEvent>(_activateUpdate);
    on<ChangeLocationFlagEvent>(_changeLocationFlag);
    on<ChangeLangEvent>(_changeLang);

    on<UpdateLocationEvent>(_updateLocation);
    on<GetLanguageDataEvent>(_getLanguageData);
  }
  static ProfileBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _getLanguageData(
      GetLanguageDataEvent event, Emitter<ProfileState> emit) async {
    final result = await getIt.get<ProfileUseCases>().getLanguageData();

    result.fold((l) {
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }

      LanguageResponseModel languageResponseModel =
          LanguageResponseModel.fromJson(r.data);

      print(languageResponseModel.data);
    });
  }

  ///The initial value is disabled for editing data, This event allows users to make edits when desired for all screens.
  FutureOr<void> _activateUpdate(
      ActivateUpdateEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      isUpdatePersonalActive: event.isUpdatePersonalActive,
      locationFlagEmoji: event.locationFlagEmoji,
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
    await GetItUtils.prefs
        .setBool(SharedPrefKeys.language, event.switchLangValue);
    emit(state.copyWith(switchLangValue: event.switchLangValue));

    add(GetLanguageDataEvent());
    print(' ValueConstants.language  :::   ${ValueConstants.language}');
  }

  FutureOr<void> _setValueLang(
      SetValueLangEvent event, Emitter<ProfileState> emit) {
    ValueConstants.language =
        GetItUtils.prefs.getData(SharedPrefKeys.languageCode) ?? 'en';
    bool? isEnLang =
        GetItUtils.prefs.getBoolean(SharedPrefKeys.language) ?? false;
    emit(state.copyWith(switchLangValue: isEnLang));

    add(GetLanguageDataEvent());
    print(' ValueConstants.language  :::   ${ValueConstants.language}');
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
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      UserDataBloc.get.add(GetUserDataEvent());
      ProfileBloc.get.add(ActivateUpdateEvent(isUpdatePersonalActive: false));
      ShowToastSnackBar.showCustomDialog(
          message: event.context.locale.update_location_message);
      emit(state.copyWith(profileStateStatus: ProfileStateStatus.SUCCESS));
    });
  }
}
