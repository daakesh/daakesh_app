import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class InsertCellPhoneScreen extends StatelessWidget {
  InsertCellPhoneScreen({super.key});
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
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.only(start: 31.0.w, bottom: 20.0.h),
                  child: Assets.svg.arrowBackIcon.svg(),
                ),
              ),
              const Center(child: DaakeshLogoWidget()),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.forget_password_title,
                        style: context.easyTheme.textTheme.headlineLarge!
                            .copyWith(fontSize: 40.0.sp)),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Text(context.locale.forget_instruction_title,
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 25.0.sp)),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              const SizedBox(height: 43.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.forget_phone_number_text_field,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0.sp, color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      isSuffixPrefixOn: true,
                      suffixIcon: BlocBuilder<ForgetPassBloc, ForgetPassState>(
                          builder: (_, state) {
                        return GestureDetector(
                          onTap: () => selectCountry(context),
                          child: SizedBox(
                            width: 65.0.w,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.flagEmoji,
                                    style: TextStyle(
                                        color: ColorName.blueGray,
                                        fontSize: 24.0.sp),
                                  ),
                                ),
                                Expanded(
                                  child: Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: ColorName.blueGray,
                                    size: 35.0.sp,
                                  ),
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
                flex: 6,
              ),
              Center(
                child: DefaultButtonWidget(
                    text: context.locale.forget_next_button_title,
                    onPressed: () => onNext(context)),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onNext(BuildContext context) async {
    if (phoneNumberController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.forget_snack_bar_title);
      return;
    }
    ForgetPassBloc.get.add(
      CheckIsPasswordExistEvent(
          phoneNumber: phoneNumberController.text.trim(), context: context),
    );
  }

  void selectCountry(context) {
    return showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        ForgetPassBloc.get.add(ChangeCountryFlagCodeEvent(
          phoneCode: country.phoneCode,
          phoneFlag: country.flagEmoji,
        ));
      },
    );
  }
}
