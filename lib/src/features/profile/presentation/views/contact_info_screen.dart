import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  final personPhoneController = TextEditingController();
  final commercialPhoneController = TextEditingController();
  final whatsAppPhoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    personPhoneController.text = '000000000';
    commercialPhoneController.text='000000000';
    whatsAppPhoneController.text ='000000000';
  }
  @override
  Widget build(BuildContext context) {
    return  AuthenticationBackgroundWidget(
      widget: Scaffold(
        backgroundColor:ColorName.transparent,
        body: LayoutBuilderWidget(
          child: BlocBuilder<ProfileBloc, ProfileState>(builder: (_, state) {
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
                    style: easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 36.0),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    'Change your Contact info',
                    style: easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 25.0),
                  ),
                  const SizedBox(
                    height: 19.0,
                  ),
                  Text(
                    'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  Text(
                    'Personal Phone Number',
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(color: ColorName.black.withOpacity(0.5)),
                  ),
                  TextFormFieldWidget(
                    controller: personPhoneController,
                    keyboardType: TextInputType.number,
                    isSuffixPrefixOn: true,
                    enabled: state.isUpdateActive,
                    suffixIcon: InkWell(
                      onTap: () => selectCountry(context,(Country country) {
                        ProfileBloc.get.add(EditPersonalPhoneCountryEvent(
                          phoneCode: country.phoneCode,
                          phoneFlag: country.flagEmoji,
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
                            const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: ColorName.blueGray,
                              size: 35.0,
                            ),
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
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(color: ColorName.black.withOpacity(0.5)),
                  ),
                  TextFormFieldWidget(
                    controller: commercialPhoneController,
                    keyboardType: TextInputType.number,
                    isSuffixPrefixOn: true,
                    enabled: state.isUpdateActive,
                    suffixIcon: InkWell(
                      onTap: () => selectCountry(context,(Country country) {
                        ProfileBloc.get.add(EditCommercialPhoneCountryEvent(
                        phoneCode: country.phoneCode,
                        phoneFlag: country.flagEmoji,
                      ));
                      }),
                      child:  SizedBox(
                        width: 65.0,
                        child: Row(
                          children: [
                            Text(
                              state.commercialPhoneFlagEmoji,
                              style: const TextStyle(
                                  color: ColorName.blueGray, fontSize: 24.0),
                            ),

                            const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: ColorName.blueGray,
                              size: 35.0,
                            ),
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
                    style: easyTheme.textTheme.bodyMedium!
                        .copyWith(color: ColorName.black.withOpacity(0.5)),
                  ),
                  TextFormFieldWidget(
                    controller: whatsAppPhoneController,
                    keyboardType: TextInputType.number,
                    isSuffixPrefixOn: true,
                    enabled: state.isUpdateActive,
                    suffixIcon: InkWell(
                      onTap: () => selectCountry(context,(Country country) {
                        ProfileBloc.get.add(EditWhatsAppPhoneCountryEvent(
                        phoneCode: country.phoneCode,
                        phoneFlag: country.flagEmoji,
                      ));
                      }),
                      child:  SizedBox(
                        width: 65.0,
                        child: Row(
                          children: [
                            Text(
                              state.whatsAppPhoneFlagEmoji,
                              style: const TextStyle(
                                  color: ColorName.blueGray, fontSize: 24.0),
                            ),
                            const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: ColorName.blueGray,
                              size: 35.0,
                            ),
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
                        text: !state.isUpdateActive ? 'MAKE EDIT':'SAVE', onPressed: ()=>onMakeEdit(state.isUpdateActive)),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Center(
                    child:
                        OutlineButtonWidget(text: !state.isUpdateActive ? 'Cancel':'RESET AND CANCEL', onPressed: ()=>cancel(state.isUpdateActive)),
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
    );
  }
  void onMakeEdit(bool isUpdateActive){
    ProfileBloc.get.add(ActivateUpdateEvent(isUpdatePersonalActive: true));
  }
  void cancel(bool isUpdateActive){
    getBack();
    ProfileBloc.get.add(ActivateUpdateEvent(isUpdatePersonalActive: false));
  }

  void selectCountry(context,ValueChanged<Country> onSelect){
    return showCountryPicker(
      context:context,
      showPhoneCode: true,
      onSelect: onSelect,
    );
  }

}
