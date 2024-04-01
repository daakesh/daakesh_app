import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class ContactInfoScreen extends StatelessWidget {
  ContactInfoScreen({super.key});

  final personPhoneController = TextEditingController(
      text: getIt.get<ContactInfoService>().contactInfoNumber.phoneNumber);
  final commercialPhoneController = TextEditingController(
      text: getIt.get<ContactInfoService>().contactInfoNumber.commercialNumber);
  final whatsAppPhoneController = TextEditingController(
      text: getIt.get<ContactInfoService>().contactInfoNumber.whatsAppNumber);

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
                      'Contact Info',
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 36.0),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Text(
                      'Change your Contact info',
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 25.0),
                    ),
                    const SizedBox(
                      height: 19.0,
                    ),
                    Text(
                      'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      'Personal Phone Number',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(color: ColorName.black.withOpacity(0.5)),
                    ),
                    TextFormFieldWidget(
                      controller: personPhoneController,
                      keyboardType: TextInputType.number,
                      isSuffixPrefixOn: true,
                      enabled: state.isUpdatePersonalActive,
                      suffixIcon: InkWell(
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
                      'Commercial Phone Number',
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
                      'WhatsApp Commercial Phone Number',
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
                              ? 'MAKE EDIT'
                              : 'SAVE',
                          onPressed: () =>
                              onMakeEdit(state.isUpdatePersonalActive)),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Center(
                      child: OutlineButtonWidget(
                          text: !state.isUpdatePersonalActive
                              ? 'Cancel'
                              : 'RESET AND CANCEL',
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

  void onMakeEdit(bool isUpdateActive) {
    ContactInfoBloc.get
        .add(ActivateUpdateContactInfoEvent(isUpdatePersonalActive: true));
  }

  void cancel(context, bool isUpdateActive) {
    Navigator.pop(context);
    ContactInfoBloc.get
        .add(ActivateUpdateContactInfoEvent(isUpdatePersonalActive: false));
  }

  void selectCountry(context, ValueChanged<Country> onSelect) {
    return showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: onSelect,
    );
  }
}
