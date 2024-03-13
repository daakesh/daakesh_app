import 'package:flutter/material.dart';
import '../../../src.export.dart';

class DropDownButtonWidget<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChange;
  final T? value;
  final VoidCallback? onTap;

  const DropDownButtonWidget({
    super.key,
    required this.items,
    required this.onChange,
    this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(

      focusColor: ColorName.gray,
      dropdownColor: ColorName.whiteSmoke,
      icon: Padding(
        padding: const EdgeInsetsDirectional.only(end: 12.0),
        child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: Center(child: Assets.svg.arrowDropDownIcon.svg())),
      ),
      value: value,
      items:items,
      onChanged: onChange,
      onTap:onTap ?? (){} ,
    );
  }
}
