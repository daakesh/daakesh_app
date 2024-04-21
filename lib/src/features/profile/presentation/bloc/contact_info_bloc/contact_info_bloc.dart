import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ContactInfoBloc extends Bloc<ContactInfoEvent, ContactInfoState> {
  ContactInfoBloc() : super(const ContactInfoState()) {
    on<ActivateUpdateContactInfoEvent>(_activateUpdateContactInfo);
    on<ResetContactInfoEvent>(_resetContactInfo);
    on<GetContactInfoEvent>(_getContactInfo);
    on<AddContactInfoEvent>(_addContactInfo);
    on<EditContactInfoEvent>(_editContactInfo);
  }
  static ContactInfoBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _activateUpdateContactInfo(
      ActivateUpdateContactInfoEvent event, Emitter<ContactInfoState> emit) {
    emit(state.copyWith(isUpdatePersonalActive: event.isUpdatePersonalActive));
  }

  FutureOr<void> _resetContactInfo(
      ResetContactInfoEvent event, Emitter<ContactInfoState> emit) {
    emit(state.copyWith());
  }

  FutureOr<void> _getContactInfo(
      GetContactInfoEvent event, Emitter<ContactInfoState> emit) async {
    emit(
        state.copyWith(contactInfoStateStatus: ContactInfoStateStatus.LOADING));
    final result = await getIt.get<ProfileUseCases>().getContactInfo();
    result.fold((l) {
      emit(
          state.copyWith(contactInfoStateStatus: ContactInfoStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      ContactInfoModel contactInfoModel = ContactInfoModel.fromJson(r.data);
      if (contactInfoModel.data!.isEmpty) {
        emit(state.copyWith(
            contactInfoStateStatus: ContactInfoStateStatus.SUCCESS));
        return;
      }
      ContactInfoData contactInfoData = contactInfoModel.data!.first;
      GetItUtils.contactInfo.setContactInfo(
          contactInfoData.personalPhoneNumber.toString(),
          contactInfoData.commercialPhoneNumber.toString(),
          contactInfoData.whatsappPhoneNumber.toString());
      String personalPhoneFlagEmoji =
          Utils.handleCountry(contactInfoData.personalPhoneNumberCountryCode);
      String commercialPhoneFlagEmoji =
          Utils.handleCountry(contactInfoData.commercialPhoneNumberCountryCode);
      String whatsAppPhoneFlagEmoji =
          Utils.handleCountry(contactInfoData.whatsappPhoneNumberCountryCode);
      emit(state.copyWith(
        contactInfoStateStatus: ContactInfoStateStatus.SUCCESS,
        personalPhoneFlagEmoji: personalPhoneFlagEmoji,
        commercialPhoneFlagEmoji: commercialPhoneFlagEmoji,
        whatsAppPhoneFlagEmoji: whatsAppPhoneFlagEmoji,
      ));
    });
  }

  FutureOr<void> _addContactInfo(
      AddContactInfoEvent event, Emitter<ContactInfoState> emit) async {
    emit(
        state.copyWith(contactInfoStateStatus: ContactInfoStateStatus.LOADING));
    ProgressCircleDialog.show();
    AddContactInfoModel addContactInfoModel = AddContactInfoModel();
    addContactInfoModel
      ..personalPhoneNumber = event.personalPhone
      ..commercialPhoneNumber = event.commercialPhone
      ..whatsappCommercialPhoneNumber = event.whatsAppPhone
      ..personalPhoneNumberCountryCode = '+${state.personalPhoneCode}'
      ..commercialPhoneNumberCountryCode = '+${state.commercialPhoneCode}'
      ..whatsappCommercialPhoneNumberCountryCode =
          '+${state.whatsAppPhoneCode}';
    final result =
        await getIt.get<ProfileUseCases>().addContactInfo(addContactInfoModel);
    result.fold((l) {
      ProgressCircleDialog.dismiss();
      emit(
          state.copyWith(contactInfoStateStatus: ContactInfoStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(
          contactInfoStateStatus: ContactInfoStateStatus.SUCCESS));
    });
  }

  ///This event allows user to change the {Flag, Country code} of contact info at [ContactInfoScreen].
  FutureOr<void> _editContactInfo(
      EditContactInfoEvent event, Emitter<ContactInfoState> emit) {
    emit(state.copyWith(
      personalPhoneFlagEmoji: event.personalPhoneFlagEmoji,
      personalPhoneCode: event.personalPhoneCode,
      commercialPhoneFlagEmoji: event.commercialPhoneFlagEmoji,
      commercialPhoneCode: event.commercialPhoneCode,
      whatsAppPhoneFlagEmoji: event.whatsAppPhoneFlagEmoji,
      whatsAppPhoneCode: event.whatsAppPhoneCode,
    ));
  }
}
