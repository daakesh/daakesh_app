import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../src.export.dart';

class ViewAllTodayDealsProductType extends StatefulWidget {
  const ViewAllTodayDealsProductType({super.key});
  @override
  State<ViewAllTodayDealsProductType> createState() =>
      _ProductTypeWidgetState();
}

class _ProductTypeWidgetState extends State<ViewAllTodayDealsProductType> {
  List<FilterProductType> data = [
    FilterProductType.All,
    FilterProductType.Daakesh,
    FilterProductType.Other
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayDealsBloc, TodayDealsState>(builder: (_, state) {
      return Wrap(
        children: List.generate(
            data.length,
            (index) => GestureDetector(
                  onTap: () => TodayDealsBloc.get
                      .add(SetViewAllFilterEvent(productType: data[index])),
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
