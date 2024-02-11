import 'package:flutter/material.dart';

import '../../../../../src.export.dart';

class PriceSliderWidget extends StatefulWidget {
  final double minValue;
  final double maxValue;

  const PriceSliderWidget({super.key, required this.minValue, required this.maxValue});

  @override
  State<PriceSliderWidget> createState() => _PriceSliderWidgetState();
}

class _PriceSliderWidgetState extends State<PriceSliderWidget> {
  double _currentStartValue = 0.0;
  double _currentEndValue = 400.0;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: easyTheme.sliderTheme.copyWith(
        trackHeight: 4,
        showValueIndicator:ShowValueIndicator.always,
        thumbColor: const Color(0xffAE6905),
      ),
      child: RangeSlider(
        min: widget.minValue,
        max: widget.maxValue,
        labels: RangeLabels('\$${_currentStartValue.round()}','\$${_currentEndValue.round()}'),
        activeColor: ColorName.amber,
        inactiveColor: ColorName.sliver,
        onChanged: (value) {
          _currentStartValue = value.start;
          _currentEndValue = value.end;
          setState(() {});
        },
        values: RangeValues(_currentStartValue,_currentEndValue),

      ),
    );
  }
}
