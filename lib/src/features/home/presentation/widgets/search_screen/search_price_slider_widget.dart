import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../src.export.dart';

class SearchPriceSliderWidget extends StatefulWidget {
  final double minValue;
  final double maxValue;

  const SearchPriceSliderWidget({
    super.key,
    required this.minValue,
    required this.maxValue,
  });

  @override
  State<SearchPriceSliderWidget> createState() => _PriceSliderWidgetState();
}

class _PriceSliderWidgetState extends State<SearchPriceSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: context.easyTheme.sliderTheme.copyWith(
        trackHeight: 4,
        showValueIndicator: ShowValueIndicator.always,
        thumbColor: const Color(0xffAE6905),
      ),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return RangeSlider(
            divisions: 10,
            min: widget.minValue,
            max: widget.maxValue,
            //labels: RangeLabels('\$${state.fromPrice.round()}', '\$${state.toPrice.round()}'),
            activeColor: ColorName.amber,
            inactiveColor: ColorName.sliver,
            onChanged: (value) {
              setPrice(value.start.toDouble(), value.end.toDouble());
            },
            values: RangeValues(state.fromPrice, state.toPrice),
          );
        },
      ),
    );
  }

  void setPrice(double fromPrice, double toPrice) => SearchBloc.get
      .add(SetSearchFilterDataEvent(fromPrice: fromPrice, toPrice: toPrice));
}
