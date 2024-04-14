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
      if (r.data['data'] == []) {
        emit(state.copyWith(
            contactInfoStateStatus: ContactInfoStateStatus.SUCCESS));
        return;
      }
      ContactInfoModel contactInfoModel = ContactInfoModel.fromJson(r.data);
      ContactInfoData contactInfoData = contactInfoModel.data!.first;

      getIt.get<ContactInfoService>().setContactInfo(
          contactInfoData.personalPhoneNumber.toString(),
          contactInfoData.commercialPhoneNumber.toString(),
          contactInfoData.whatsappPhoneNumber.toString());

      emit(state.copyWith(
          contactInfoStateStatus: ContactInfoStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _addContactInfo(
      AddContactInfoEvent event, Emitter<ContactInfoState> emit) async {
    emit(
        state.copyWith(contactInfoStateStatus: ContactInfoStateStatus.LOADING));
    final result = await getIt.get<ProfileUseCases>().addContactInfo();
    result.fold((l) {
      emit(
          state.copyWith(contactInfoStateStatus: ContactInfoStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
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
        whatsAppPhoneCode: event.whatsAppPhoneCode));
  }
}
