import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../src.export.dart';

class SwapPriceSliderWidget extends StatefulWidget {
  final double minValue;
  final double maxValue;

  const SwapPriceSliderWidget(
      {super.key, required this.minValue, required this.maxValue});

  @override
  State<SwapPriceSliderWidget> createState() => _SwapPriceSliderWidgetState();
}

class _SwapPriceSliderWidgetState extends State<SwapPriceSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: context.easyTheme.sliderTheme.copyWith(
        trackHeight: 4,
        showValueIndicator: ShowValueIndicator.always,
        thumbColor: const Color(0xffAE6905),
      ),
      child: BlocBuilder<SwapFilterBloc, SwapFilterState>(
        builder: (context, state) {
          return RangeSlider(
            divisions: 10,
            min: widget.minValue,
            max: widget.maxValue,
            activeColor: ColorName.amber,
            inactiveColor: ColorName.sliver,
            onChanged: (value) {
              setPrice(value.start, value.end);
            },
            values: RangeValues(state.fromPrice, state.toPrice),
          );
        },
      ),
    );
  }

  void setPrice(double fromPrice, double toPrice) {
    SwapFilterBloc.get
        .add(SwapSetFilterDataEvent(fromPrice: fromPrice, toPrice: toPrice));
  }
}
