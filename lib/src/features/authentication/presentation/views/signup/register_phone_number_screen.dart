import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class RegisterPhoneNumberScreen extends StatelessWidget {
  RegisterPhoneNumberScreen({super.key});
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              const Center(child: GeneralDaakeshLogoWidget()),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.phone_number_title,
                        style: context.easyTheme.textTheme.headlineLarge!
                            .copyWith(fontSize: 40.0.sp)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(context.locale.phone_number_instruction,
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 25.0.sp)),
                  ],
                ),
              ),
              const SizedBox(height: 43.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.phone_number_text_field,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0.sp, color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      isSuffixPrefixOn: true,
                      suffixIcon:
                          BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
                        return InkWell(
                          onTap: () => selectCountry(context),
                          child: SizedBox(
                            width: 65.0.w,
                            child: Row(
                              children: [
                                Text(
                                  state.phoneFlag,
                                  style: TextStyle(
                                      color: ColorName.blueGray,
                                      fontSize: 24.0.sp),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: ColorName.blueGray,
                                  size: 35.0.sp,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        RegExpValidator.clearZero
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Center(
                  child: DefaultButtonWidget(
                      text: context.locale.phone_number_next_button_title,
                      onPressed: () => onNext(context)),
                ),
              ),
              SizedBox(height: 44.0.h),
              const AlreadyHaveAccountWidget(),
              SizedBox(height: 55.0.h),
            ],
          ),
        ),
      ),
    );
  }

  void onNext(BuildContext context) async {
    if (phoneNumberController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.fill_phone_number_data_snack_bars);
      return;
    }
    AuthBloc.get.add(InitialValueEvent());
    AuthBloc.get.add(EnterPhoneEvent(
        phoneNumber: phoneNumberController.text.trim(), context: context));
  }

  void selectCountry(context) {
    return showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        AuthBloc.get.add(ChangeCountryCodeEvent(
          phoneCode: country.phoneCode,
          phoneFlag: country.flagEmoji,
        ));
      },
    );
  }
}
