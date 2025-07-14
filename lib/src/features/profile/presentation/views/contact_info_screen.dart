import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class ContactInfoScreen extends StatelessWidget {
  ContactInfoScreen({super.key});

  final personPhoneController = TextEditingController(
      text: GetItUtils.contactInfo.contactInfoNumber.phoneNumber);
  final commercialPhoneController = TextEditingController(
      text: GetItUtils.contactInfo.contactInfoNumber.commercialNumber);
  final whatsAppPhoneController = TextEditingController(
      text: GetItUtils.contactInfo.contactInfoNumber.whatsAppNumber);
  final personPhoneCountryCodeController = TextEditingController();
  final commercialPhoneCountryCodeController = TextEditingController();
  final whatsAppPhoneCountryCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        ContactInfoBloc.get
            .add(ActivateUpdateContactInfoEvent(isUpdatePersonalActive: false));
      },
      child: DefaultBackgroundWidget(
        child: Scaffold(
          backgroundColor: ColorName.transparent,
          body: LayoutBuilderWidget(
            child: BlocBuilder<ContactInfoBloc, ContactInfoState>(
                builder: (_, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 108.0,
                    ),
                    Text(
                      context.locale.contact_info,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 36.0),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Text(
                      context.locale.change_contact_info,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 25.0),
                    ),
                    const SizedBox(
                      height: 19.0,
                    ),
                    Text(
                      context.locale.profile_instruction,
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      context.locale.personal_phone_number,
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(color: ColorName.black.withOpacity(0.5)),
                    ),
                    TextFormFieldWidget(
                      controller: personPhoneController,
                      keyboardType: TextInputType.number,
                      isSuffixPrefixOn: true,
                      enabled: state.isUpdatePersonalActive,
                      suffixIcon: GestureDetector(
                        onTap: () => selectCountry(context, (Country country) {
                          ContactInfoBloc.get.add(EditContactInfoEvent(
                            personalPhoneCode: country.phoneCode,
                            personalPhoneFlagEmoji: country.flagEmoji,
                          ));
                        }),
                        child: SizedBox(
                          width: 65.0,
                          child: Row(
                            children: [
                              Text(
                                state.personalPhoneFlagEmoji,
                                style: const TextStyle(
                                    color: ColorName.blueGray, fontSize: 24.0),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Assets.svg.arrowDropDownIcon.svg(),
                            ],
                          ),
                        ),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        RegExpValidator.clearZero
                      ],
                    ),
                    const SizedBox(
                      height: 44.0,
                    ),
                    Text(
                      context.locale.commercial_phone_number,
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(color: ColorName.black.withOpacity(0.5)),
                    ),
                    TextFormFieldWidget(
                      controller: commercialPhoneController,
                      keyboardType: TextInputType.number,
                      isSuffixPrefixOn: true,
                      enabled: state.isUpdatePersonalActive,
                      suffixIcon: InkWell(
                        onTap: () => selectCountry(context, (Country country) {
                          ContactInfoBloc.get.add(EditContactInfoEvent(
                            commercialPhoneCode: country.phoneCode,
                            commercialPhoneFlagEmoji: country.flagEmoji,
                          ));
                        }),
                        child: SizedBox(
                          width: 65.0,
                          child: Row(
                            children: [
                              Text(
                                state.commercialPhoneFlagEmoji,
                                style: const TextStyle(
                                    color: ColorName.blueGray, fontSize: 24.0),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Assets.svg.arrowDropDownIcon.svg(),
                            ],
                          ),
                        ),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        RegExpValidator.clearZero
                      ],
                    ),
                    const SizedBox(
                      height: 44.0,
                    ),
                    Text(
                      context.locale.whatsApp_phone_number,
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(color: ColorName.black.withOpacity(0.5)),
                    ),
                    TextFormFieldWidget(
                      controller: whatsAppPhoneController,
                      keyboardType: TextInputType.number,
                      isSuffixPrefixOn: true,
                      enabled: state.isUpdatePersonalActive,
                      suffixIcon: InkWell(
                        onTap: () => selectCountry(context, (Country country) {
                          ContactInfoBloc.get.add(EditContactInfoEvent(
                            whatsAppPhoneCode: country.phoneCode,
                            whatsAppPhoneFlagEmoji: country.flagEmoji,
                          ));
                        }),
                        child: SizedBox(
                          width: 65.0,
                          child: Row(
                            children: [
                              Text(
                                state.whatsAppPhoneFlagEmoji,
                                style: const TextStyle(
                                    color: ColorName.blueGray, fontSize: 24.0),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Assets.svg.arrowDropDownIcon.svg(),
                            ],
                          ),
                        ),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        RegExpValidator.clearZero
                      ],
                    ),
                    const SizedBox(
                      height: 44.0,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Center(
                        child: DefaultButtonWidget(
                            text: !state.isUpdatePersonalActive
                                ? context.locale.edit_contact
                                : context.locale.save_edit,
                            onPressed: () => !state.isUpdatePersonalActive
                                ? onMakeEdit()
                                : onSave(context)) //onMakeEdit()),
                        ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Center(
                      child: OutlineButtonWidget(
                          text: !state.isUpdatePersonalActive
                              ? context.locale.cancel_contact
                              : context.locale.reset_and_cancel_contact,
                          onPressed: () =>
                              cancel(context, state.isUpdatePersonalActive)),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  void onMakeEdit() {
    ContactInfoBloc.get
        .add(ActivateUpdateContactInfoEvent(isUpdatePersonalActive: true));
  }

  void cancel(context, bool isUpdateActive) {
    Navigator.pop(context);
    ContactInfoBloc.get
        .add(ActivateUpdateContactInfoEvent(isUpdatePersonalActive: false));
  }

  void onSave(BuildContext context) {
    if (personPhoneController.text.isEmpty &&
        commercialPhoneController.text.isEmpty &&
        whatsAppPhoneController.text.isEmpty) {
      ShowToastSnackBar.showCustomDialog(
          message: context.locale.fill_contact_data);
      return;
    }
    ContactInfoBloc.get.add(AddContactInfoEvent(
      personalPhone: personPhoneController.text,
      commercialPhone: commercialPhoneController.text,
      whatsAppPhone: whatsAppPhoneController.text,
    ));
  }

  void selectCountry(context, ValueChanged<Country> onSelect) {
    return showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: onSelect,
    );
  }
}
