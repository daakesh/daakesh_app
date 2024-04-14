import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  final countryController = TextEditingController(text: 'Jordan');
  final cityController = TextEditingController(text: 'Amman');

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
                        'Filter',
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
                        'Available ship country',
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
                        'City',
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormFieldWidget(
                        controller: cityController,
                        isSuffixPrefixOn: true,
                        suffixIcon: SizedBox(
                          height: 9.0,
                          width: 16.0,
                          child:
                              Center(child: Assets.svg.arrowDropDownIcon.svg()),
                        ),
                        readOnly: true,
                        inputFormatters: [
                          RegExpValidator.beginWhitespace,
                        ],
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'Rate',
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const SelectRateWidget(),
                      const SizedBox(
                        height: 34.0,
                      ),
                      Text(
                        'Price',
                        style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.0,
                            color: ColorName.black.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const PriceSliderWidget(minValue: 0.0, maxValue: 1000.0),
                      const SizedBox(
                        height: 34.0,
                      ),
                      Text(
                        'Product type',
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
                      width: double.infinity, child: ProductTypeWidget()),
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
                          text: 'APPLY', onPressed: () => apply(context)),
                      const SizedBox(
                        height: 14.0,
                      ),
                      BlocBuilder<FilterBloc, FilterState>(
                        builder: (context, state) {
                          return OutlineButtonWidget(
                              text: 'CLEAR',
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
    FilterBloc.get.add(PreviewSectionSubCategoriesEvent(isFilterActive: true));
    Navigator.pop(context);
  }

  void clear(context, bool filterIsActive) {
    if (!filterIsActive) {
      Navigator.pop(context);
      FilterBloc.get.add(ClearFilterDataEvent());
      return;
    }
    FilterBloc.get.add(PreviewSectionSubCategoriesEvent(isFilterActive: false));
    FilterBloc.get.add(ClearFilterDataEvent());
    Navigator.pop(context);
  }
}
