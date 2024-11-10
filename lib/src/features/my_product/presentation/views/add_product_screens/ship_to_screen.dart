import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ShipToScreen extends StatefulWidget {
  const ShipToScreen({super.key});

  @override
  State<ShipToScreen> createState() => _ShipToScreenState();
}

class _ShipToScreenState extends State<ShipToScreen> {
  final countryController = TextEditingController();
  List<String> countriesList = [];

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
                      onTap: cancel,
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
                      context.locale.ship_to,
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
                      height: 33,
                    ),
                  ],
                ),
              ),
              BlocBuilder<MyProFuncBloc, MyProFuncState>(builder: (_, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(context.locale.country,
                              style: context.easyTheme.textTheme.bodyMedium!
                                  .copyWith(
                                      fontSize: 18,
                                      color: ColorName.black.withOpacity(0.5))),
                          TextFormFieldWidget(
                            controller: countryController,
                            isSuffixPrefixOn: true,
                            suffixIcon: InkWell(
                              focusColor: ColorName.transparent,
                              splashColor: ColorName.transparent,
                              highlightColor: ColorName.transparent,
                              onTap: state.isAlreadyAddedCountry
                                  ? () {}
                                  : () => addCountries(countryController.text),
                              child: Transform.scale(
                                scale: 0.8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: state.isAlreadyAddedCountry
                                        ? ColorName.gray
                                        : ColorName.amber,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.add_rounded,
                                      color: ColorName.white, size: 40),
                                ),
                              ),
                            ),
                            prefixIcon: SizedBox(
                                width: 30,
                                height: 30,
                                child: Center(
                                    child: Text(state.shipFlagEmoji,
                                        style: const TextStyle(
                                            color: ColorName.blueGray,
                                            fontSize: 24)))),
                            readOnly: true,
                            onTap: () => showCountryDialog(),
                            inputFormatters: [
                              RegExpValidator.beginWhitespace,
                            ],
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Wrap(
                        children: List.generate(
                            state.selectedShipToCountries.length,
                            (index) => InkWell(
                                  focusColor: ColorName.transparent,
                                  splashColor: ColorName.transparent,
                                  highlightColor: ColorName.transparent,
                                  onTap: () => deleteAddedCountries(index),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                            minHeight: 38,
                                            minWidth: 120,
                                            maxWidth: 140),
                                        margin:
                                            const EdgeInsetsDirectional.only(
                                                end: 10, bottom: 10),
                                        padding: const EdgeInsetsDirectional
                                            .symmetric(horizontal: 10),
                                        decoration: const BoxDecoration(
                                          color: ColorName.paleGray,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                    state.selectedShipToCountries[
                                                        index],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: context.easyTheme
                                                        .textTheme.bodyLarge!
                                                        .copyWith(
                                                            fontSize: 18,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 77),
              const Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: DefaultButtonWidget(
                    text: context.locale.finish_button_title,
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

  void setEditData() {
    if (getIt.get<EditProduct>().myProductItem != null) {
      var data = getIt.get<EditProduct>().myProductItem;
      countryController.text = data!.country.toString();
      addCountries(data.country.toString());
    } else {
      resetFlagData();
      countryController.text = 'Jordan';
    }
  }

  void showCountryDialog() {
    return showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        countryController.text = country.name;
        MyProFuncBloc.get
            .add(CheckAlreadyAddedCountryEvent(value: country.name));
        MyProFuncBloc.get.add(SelectShipToCountryEvent(
            shipToFlagEmoji: country.flagEmoji.toString()));
      },
    );
  }

  void addCountries(String country) {
    AddProBloc.get.add(AddShipToCountryEvent(shipToCountry: country));
    countriesList.add(country);
    MyProFuncBloc.get
        .add(DeleteInsertCountriesEvent(selectedShipCountry: countriesList));
    MyProFuncBloc.get.add(CheckAlreadyAddedCountryEvent(value: country));
  }

  void deleteAddedCountries(int index) {
    countriesList.removeAt(index);
    MyProFuncBloc.get
        .add(DeleteInsertCountriesEvent(selectedShipCountry: countriesList));
    MyProFuncBloc.get
        .add(CheckAlreadyAddedCountryEvent(value: countryController.text));
  }

  void onNext() async {
    if (countriesList.isEmpty) {
      ShowToastSnackBar.showSnackBars(message: context.locale.add_one_country);
      return;
    }
    AddProBloc.get.add(AddProductEvent(context: context));
  }

  void cancel() {
    Utils.getBack();
    resetFlagData();
  }

  void resetFlagData() {
    countriesList = [];
    countryController.text = 'Jordan';
    MyProFuncBloc.get.add(ResetValuesEvent());
  }
}
