import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

// ignore: must_be_immutable
class ViewAllFilterScreen extends StatelessWidget {
  ViewAllFilterScreen({super.key});
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
                      const SizedBox(height: 40.0),
                      Center(
                        child: Text(
                          context.locale.filter_title,
                          style: context.easyTheme.textTheme.headlineMedium!
                              .copyWith(fontSize: 31.0),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Utils.flipWidget(Assets.svg.arrowBackIcon
                            .svg(height: 16, width: 16)),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        context.locale.filter_available_ship_country,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5)),
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
                        inputFormatters: [RegExpValidator.beginWhitespace],
                      ),
                      const SizedBox(height: 14.0),
                      Text(
                        context.locale.filter_available_ship_city,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                      BlocBuilder<TrendDealsBloc, TrendDealsState>(
                          builder: (context, state) {
                        return DropDownButtonWidget<String>(
                          onChange: (value) {
                            TrendDealsBloc.get
                                .add(SetViewAllFilterDataEvent(city: value));
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
                      const SizedBox(height: 20.0),
                      //Text(
                      //  context.locale.filter_rate,
                      //  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                      //      fontSize: 18.0,
                      //      color: ColorName.black.withOpacity(0.5)),
                      //),
                      //const SizedBox(height: 12.0),
                      //const ViewAllSelectRate(),
                      //const SizedBox(height: 16.0),
                      //Text(
                      //  context.locale.filter_price_slider,
                      //  style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                      //    fontSize: 18.0,
                      //    color: ColorName.black.withOpacity(0.5),
                      //  ),
                      //),
                      //const SizedBox(height: 12.0),
                      //const ViewAllPriceSlider(minValue: 0.0, maxValue: 1000.0),
                      //BlocBuilder<TrendDealsBloc, TrendDealsState>(
                      //  builder: (context, state) {
                      //    return Row(
                      //      children: [
                      //        const SizedBox(width: 10),
                      //        Text(
                      //          '\$${state.fromPrice.toInt()}',
                      //          style: context.easyTheme.textTheme.bodyMedium!
                      //              .copyWith(fontWeight: FontWeight.bold),
                      //        ),
                      //        const Spacer(flex: 1),
                      //        Text(
                      //          '\$${state.toPrice.toInt()}',
                      //          style: context.easyTheme.textTheme.bodyMedium!
                      //              .copyWith(fontWeight: FontWeight.bold),
                      //        ),
                      //        const SizedBox(width: 10),
                      //      ],
                      //    );
                      //  },
                      //),
                      //const SizedBox(height: 10.0),
                      Text(
                        context.locale.filter_product_type,
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: SizedBox(
                      width: double.infinity, child: ViewAllProductType()),
                ),
                const SizedBox(height: 14.0),
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
                      BlocBuilder<TrendDealsBloc, TrendDealsState>(
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
                const SizedBox(height: 65.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void apply(context) {
    TrendDealsBloc.get.add(GetItemsViewAllsEvent(isFilterActive: true));
    Navigator.pop(context);
  }

  void clear(context, bool filterIsActive) {
    TrendDealsBloc.get.add(ResetViewAllValueEvent());
    TrendDealsBloc.get.add(GetItemsViewAllsEvent(isFilterActive: false));
  }
}
