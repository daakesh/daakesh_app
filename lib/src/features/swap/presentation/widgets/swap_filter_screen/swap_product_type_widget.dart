import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapProductTypeWidget extends StatefulWidget {
  const SwapProductTypeWidget({super.key});
  @override
  State<SwapProductTypeWidget> createState() => _SwapProductTypeWidgetState();
}

class _SwapProductTypeWidgetState extends State<SwapProductTypeWidget> {
  List<FilterProductType> data = [
    FilterProductType.All,
    FilterProductType.Daakesh,
    FilterProductType.Other
  ];
  List<String> dataTitle = <String>[
    Utils.locale.swap_filter_all_type,
    Utils.locale.swap_filter_daakesh_type,
    Utils.locale.swap_filter_other_type,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwapFilterBloc, SwapFilterState>(builder: (_, state) {
      return Wrap(
        children: List.generate(
            data.length,
            (index) => GestureDetector(
                  onTap: () => SwapFilterBloc.get
                      .add(SwapSetFilterDataEvent(productType: data[index])),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      dataTitle[index],
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
