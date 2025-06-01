import 'package:country_picker/country_picker.dart';
import 'package:daakesh/src/features/my_product/presentation/widgets/pick_location_screen.dart';
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
  final String _latitude = '';
  final String _longitude = '';

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
                padding: const EdgeInsetsDirectional.only(start: 26, end: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    InkWell(
                      focusColor: ColorName.transparent,
                      highlightColor: ColorName.transparent,
                      splashColor: ColorName.transparent,
                      onTap: () => Navigator.pop(context),
                      child: Utils.flipWidget(Assets.svg.arrowBackIcon.svg()),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      context.locale.add_product,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 36),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      context.locale.swap_title,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Text(
                      context.locale.add_product_instruction,
                      style: context.easyTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.display_type,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            color: ColorName.black.withOpacity(0.5))),
                    DropDownButtonWidget<String>(
                      items: [
                        DropdownMenuItem(
                          value: 'Public',
                          child: Text(context.locale.public),
                        ),
                        DropdownMenuItem(
                          value: 'Private',
                          child: Text(context.locale.private),
                        ),
                      ],
                      value: displayProductController.text,
                      onChange: (value) {
                        displayProductController.text = value.toString();
                      },
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(context.locale.country_swap,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            color: ColorName.black.withOpacity(0.5))),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: countryController,
                            isSuffixPrefixOn: true,
                            suffixIcon: SizedBox(
                              height: 9,
                              width: 16,
                              child: Center(
                                  child: Assets.svg.arrowDropDownIcon.svg()),
                            ),
                            prefixIcon:
                                BlocBuilder<MyProFuncBloc, MyProFuncState>(
                                    builder: (_, state) {
                              return SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Center(
                                      child: Text(
                                    state.swapFlagEmoji,
                                    style: const TextStyle(
                                        color: ColorName.blueGray,
                                        fontSize: 24),
                                  )));
                            }),
                            readOnly: true,
                            onTap: () => showCountryDialog(),
                            inputFormatters: [
                              RegExpValidator.beginWhitespace,
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        // TextButtonWidget(
                        //     isBold: true,
                        //     text: 'Pick location',
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //             builder: (context) => PickLocationScreen(
                        //               onSelectPosition:
                        //                   (double latitude, double longitude) {
                        //                 setState(() {
                        //                   _latitude = latitude.toString();
                        //                   _longitude = longitude.toString();
                        //                 });

                        //                 print(latitude);
                        //                 print(longitude);
                        //               },
                        //             ),
                        //           ));
                        //     }),
                      ],
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(context.locale.city_swap,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            color: ColorName.black.withOpacity(0.5))),
                    TextFormFieldWidget(controller: cityController),
                    const SizedBox(
                      height: 21,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 77,
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: DefaultButtonWidget(
                    text: context.locale.next_button,
                    onPressed: () => onNext()),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: OutlineButtonWidget(
                    text: context.locale.cancel_button,
                    onPressed: () => cancel()),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setEditData() async {
    if (GetItUtils.editProduct.myProductItem != null) {
      var data = GetItUtils.editProduct.myProductItem;

      ///displayProductController.text = data!.display.toString();
      displayProductController.text = 'Public';
      countryController.text = data!.countrySwap.toString();
      cityController.text = data.citySwap.toString();
      String flag = Utils.countryCodeToEmoji(data.countrySwap.toString());
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
      ShowToastSnackBar.showSnackBars(
          message: context.locale.add_pro_data_snack_bar);
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
