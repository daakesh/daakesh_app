import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class RegisterLocationInfoScreen extends StatefulWidget {
  const RegisterLocationInfoScreen({super.key});

  @override
  State<RegisterLocationInfoScreen> createState() =>
      _RegisterLocationInfoScreenState();
}

class _RegisterLocationInfoScreenState
    extends State<RegisterLocationInfoScreen> {
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();

  final FocusNode countryFocusNode = FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    resetFlag();
  }

  @override
  Widget build(BuildContext context) {
    countryController.text = context.locale.location_country_init_value;
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              SizedBox(height: 44.0.h),
              const Center(child: GeneralDaakeshLogoWidget()),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 26.0.w, end: 13.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.location_title,
                        style: context.easyTheme.textTheme.headlineLarge!
                            .copyWith(fontSize: 40.0.sp)),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Text(context.locale.location_instruction,
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 25.0.sp)),
                  ],
                ),
              ),
              SizedBox(height: 20.0.h),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 32.0.w, end: 29.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.country_text_field,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0, color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: countryController,
                      focusNode: countryFocusNode,
                      isSuffixPrefixOn: true,
                      suffixIcon: SizedBox(
                        height: 9.0.h,
                        width: 16.0.w,
                        child:
                            Center(child: Assets.svg.arrowDropDownIcon.svg()),
                      ),
                      prefixIcon:
                          BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
                        return SizedBox(
                            width: 30.0.w,
                            height: 30.0.h,
                            child: Center(
                                child: Text(
                              state.flagEmoji,
                              style: TextStyle(
                                  color: ColorName.blueGray, fontSize: 24.0.sp),
                            )));
                      }),
                      onFieldSubmitted: (value) => Utils.fieldFocusChange(
                          context, countryFocusNode, cityFocusNode),
                      readOnly: true,
                      onTap: () {
                        showCountryDialog(context);
                      },
                      inputFormatters: [
                        RegExpValidator.beginWhitespace,
                      ],
                    ),
                    SizedBox(height: 33.0.h),
                    Text(context.locale.city_text_field,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0, color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: cityController,
                      focusNode: cityFocusNode,
                      onFieldSubmitted: (value) => Utils.fieldFocusChange(
                          context, cityFocusNode, addressFocusNode),
                      inputFormatters: [
                        RegExpValidator.beginWhitespace,
                      ],
                    ),
                    SizedBox(height: 33.0.h),
                    Text(context.locale.address_text_field,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0, color: ColorName.darkGray)),
                    TextFormFieldWidget(
                      controller: addressController,
                      focusNode: addressFocusNode,
                      isSuffixPrefixOn: true,
                      inputFormatters: [
                        RegExpValidator.beginWhitespace,
                      ],
                      // suffixIcon: GestureDetector(
                      //   onTap: () => Utils.openNewPage(const MapScreen()),
                      //   child: SizedBox(
                      //       width: 20.0.w,
                      //       height: 20.0.h,
                      //       child: Center(
                      //           child: Assets.svg.locationPinIcon.svg())),
                      // ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(height: 43.0.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                child: DefaultButtonWidget(
                    text: context.locale.location_next_button_title,
                    onPressed: () => onNext(context)),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(height: 20.0.h),
              const AlreadyHaveAccountWidget(),
              SizedBox(height: 20.0.h),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  void onNext(BuildContext context) async {
    if (countryController.text.isEmpty ||
        cityController.text.isEmpty ||
        addressController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(
          message: context.locale.fill_location_data_snack_bars);
      return;
    }
    AuthBloc.get.add(EnterLocationInfoEvent(
      country: countryController.text,
      city: cityController.text,
      address: addressController.text,
    ));
    Utils.openNewPage(RegisterPhoneNumberScreen());
  }

  void showCountryDialog(context) {
    return showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        countryController.text = country.name;
        AuthBloc.get.add(
          ChangeFlagEvent(
            flagEmoji: country.flagEmoji.toString(),
          ),
        );
      },
    );
  }

  void resetFlag() {
    AuthBloc.get.add(ChangeFlagEvent(flagEmoji: '🇯🇴'));
  }
}
