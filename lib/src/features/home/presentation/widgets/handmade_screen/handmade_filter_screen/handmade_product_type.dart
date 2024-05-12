import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../src.export.dart';

class HandmadeProductType extends StatefulWidget {
  const HandmadeProductType({super.key});
  @override
  State<HandmadeProductType> createState() => _ProductTypeWidgetState();
}

class _ProductTypeWidgetState extends State<HandmadeProductType> {
  List<FilterProductType> data = [
    FilterProductType.All,
    FilterProductType.Daakesh,
    FilterProductType.Other
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HandmadeBloc, HandmadeState>(builder: (_, state) {
      return Wrap(
        children: List.generate(
            data.length,
            (index) => GestureDetector(
                  onTap: () => HandmadeBloc.get.add(
                      SetHandmadeFilterDataEvent(productType: data[index])),
                  child: Container(
                    height: 38.0,
                    margin:
                        const EdgeInsetsDirectional.only(end: 8.0, bottom: 8.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 7.0),
                    constraints: const BoxConstraints(minWidth: 56.0),
                    decoration: BoxDecoration(
                        color: state.type == data[index]
                            ? ColorName.amber
                            : ColorName.sliver,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        )),
                    child: Text(
                      data[index].name,
                      textAlign: TextAlign.center,
                      style: context.easyTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 18.0),
                    ),
                  ),
                )),
      );
    });
  }
}
