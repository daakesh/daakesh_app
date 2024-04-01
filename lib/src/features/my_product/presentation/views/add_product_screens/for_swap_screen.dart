import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ForSwapScreen extends StatefulWidget {
  const ForSwapScreen({super.key});
  @override
  State<ForSwapScreen> createState() => _ForSwapScreenState();
}

class _ForSwapScreenState extends State<ForSwapScreen> {
  final displayProductController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setEditData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: LayoutBuilderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 26.0.w, end: 22.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 108.0.h,
                    ),
                    InkWell(
                      focusColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      splashColor: ColorName.transparent,
                      onTap: () => Navigator.pop(context),
                      child: Assets.svg.arrowBackIcon.svg(),
                    ),
                    SizedBox(
                      height: 11.0.h,
                    ),
                    Text(
                      'Add Product',
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 36.0.sp),
                    ),
                    SizedBox(
                      height: 14.0.h,
                    ),
                    Text(
                      'Swap!',
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 25.0.sp),
                    ),
                    SizedBox(
                      height: 19.0.h,
                    ),
                    Text(
                      'This information is required to allow your customers to communicate with you. Your account information is used if it is not changed',
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 16.0.sp),
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Display the product on the store',
                        style: context.easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5))),
                    TextFormFieldWidget(
                        controller: displayProductController,
                        readOnly: true,
                        isSuffixPrefixOn: true,
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: Center(
                                  child: Assets.svg.arrowDropDownIcon.svg())),
                        )),
                    SizedBox(
                      height: 22.0.h,
                    ),
                    Text('Country swap',
                        style: context.easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5))),
                    TextFormFieldWidget(
                      controller: countryController,
                      isSuffixPrefixOn: true,
                      suffixIcon: SizedBox(
                        height: 9.0.h,
                        width: 16.0.w,
                        child:
                            Center(child: Assets.svg.arrowDropDownIcon.svg()),
                      ),
                      prefixIcon: BlocBuilder<MyProFuncBloc, MyProFuncState>(
                          builder: (_, state) {
                        return SizedBox(
                            width: 30.0.w,
                            height: 30.0.h,
                            child: Center(
                                child: Text(
                              state.swapFlagEmoji,
                              style: TextStyle(
                                  color: ColorName.blueGray, fontSize: 24.0.sp),
                            )));
                      }),
                      readOnly: true,
                      onTap: () => showCountryDialog(),
                      inputFormatters: [
                        RegExpValidator.beginWhitespace,
                      ],
                    ),
                    SizedBox(
                      height: 21.0.h,
                    ),
                    Text('City swap',
                        style: context.easyTheme.textTheme.bodyMedium!
                            .copyWith(color: ColorName.black.withOpacity(0.5))),
                    TextFormFieldWidget(controller: cityController),
                    SizedBox(
                      height: 21.0.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 77.0.h,
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                child: DefaultButtonWidget(
                    text: 'NEXT', onPressed: () => onNext()),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                child: OutlineButtonWidget(
                    text: 'CANCEL', onPressed: () => cancel()),
              ),
              SizedBox(
                height: 50.0.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setEditData() async {
    if (getIt.get<EditProduct>().myProductItem != null) {
      var data = getIt.get<EditProduct>().myProductItem;

      ///displayProductController.text = data!.display.toString();
      displayProductController.text = 'Public';
      countryController.text = data!.countrySwap.toString();
      cityController.text = data.citySwap.toString();
      String code = CountriesFlags.flags[data.countrySwap].toString();
      String flag = await Utils.countryCodeToEmoji(code);
      MyProFuncBloc.get.add(
        ChangeCountrySwapFlagEvent(
          flagEmoji: flag,
        ),
      );
    } else {
      displayProductController.text = 'Public';
      countryController.text = 'Jordan';
      cityController.text = 'Amman';
    }
  }

  void onNext() async {
    if (displayProductController.text.isEmpty ||
        countryController.text.isEmpty ||
        cityController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(message: 'Firstly, fill all data...');
      return;
    }
    AddProBloc.get.add(AddSwapInfoEvent(
      displayProduct: displayProductController.text,
      swapCountry: countryController.text,
      swapCity: cityController.text,
    ));
    Utils.openNewPage(const ShipToScreen());
  }

  void cancel() {
    Utils.getBack();
  }

  void resetFlagData() {
    countryController.text = 'Jordan';
    MyProFuncBloc.get.add(
      ChangeCountrySwapFlagEvent(
        flagEmoji: '🇯🇴',
      ),
    );
  }

  void showCountryDialog() {
    return showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        countryController.text = country.name;
        MyProFuncBloc.get.add(
          ChangeCountrySwapFlagEvent(
            flagEmoji: country.flagEmoji.toString(),
          ),
        );
      },
    );
  }
}
