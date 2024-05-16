import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

// ignore: must_be_immutable
class HandmadeFilterScreen extends StatelessWidget {
  HandmadeFilterScreen({super.key});

  final countryController = TextEditingController(text: 'Jordan');
  String cityValue = 'Amman';

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Scaffold(
        backgroundColor: ColorName.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 52.0,
                      ),
                      Center(
                          child: Text(
                        context.locale.filter_title,
                        style: context.easyTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 31.0),
                      )),
                      const SizedBox(
                        height: 16.0,
                      ),
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back)),
                      const SizedBox(
                        height: 39.0,
                      ),
                      Text(
                        context.locale.filter_available_ship_country,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormFieldWidget(
                        controller: countryController,
                        isSuffixPrefixOn: true,
                        suffixIcon: SizedBox(
                          height: 9.0,
                          width: 16.0,
                          child:
                              Center(child: Assets.svg.arrowDropDownIcon.svg()),
                        ),
                        prefixIcon: const SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: Center(
                                child: Text(
                              '🇯🇴',
                              style: TextStyle(
                                  color: ColorName.blueGray, fontSize: 24.0),
                            ))),
                        readOnly: true,
                        inputFormatters: [
                          RegExpValidator.beginWhitespace,
                        ],
                      ),
                      const SizedBox(
                        height: 33.0,
                      ),
                      Text(
                        context.locale.filter_available_ship_city,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      BlocBuilder<HandmadeBloc, HandmadeState>(
                          builder: (context, state) {
                        return DropDownButtonWidget<String>(
                          onChange: (value) {
                            HandmadeBloc.get
                                .add(SetHandmadeFilterDataEvent(city: value));
                          },
                          value: state.city,
                          items: state.cityItemList
                              .map((e) => DropdownMenuItem(
                                  value: e.city,
                                  child: Text(Utils.isEnglish
                                      ? e.city.toString()
                                      : e.ar.toString())))
                              .toList(),
                        );
                      }),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        context.locale.filter_rate,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const HandmadeSelectRate(),
                      const SizedBox(
                        height: 34.0,
                      ),
                      Text(
                        context.locale.filter_price_slider,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const HandmadePriceSlider(
                          minValue: 0.0, maxValue: 1000.0),
                      BlocBuilder<HandmadeBloc, HandmadeState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                '\$${state.fromPrice.toInt()}',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(flex: 1),
                              Text(
                                '\$${state.toPrice.toInt()}',
                                style: context.easyTheme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 34.0,
                      ),
                      Text(
                        context.locale.filter_product_type,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: SizedBox(
                      width: double.infinity, child: HandmadeProductType()),
                ),
                const SizedBox(
                  height: 65.0,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 23.0, end: 19.0),
                  child: Column(
                    children: [
                      DefaultButtonWidget(
                          text: context.locale.filter_apply_button,
                          onPressed: () => apply(context)),
                      const SizedBox(
                        height: 14.0,
                      ),
                      BlocBuilder<HandmadeBloc, HandmadeState>(
                        builder: (context, state) {
                          return OutlineButtonWidget(
                              text: context.locale.filter_clear_button,
                              onPressed: () =>
                                  clear(context, state.isFilterActive));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 65.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void apply(context) {
    HandmadeBloc.get.add(GetHandmadeDataEvent(isFilterActive: true));
    Navigator.pop(context);
  }

  void clear(context, bool filterIsActive) {
    if (!filterIsActive) {
      HandmadeBloc.get.add(ClearHandmadeFilterDataEvent());
      return;
    }
    HandmadeBloc.get.add(GetHandmadeDataEvent(isFilterActive: false));
    HandmadeBloc.get.add(ClearHandmadeFilterDataEvent());
  }
}
