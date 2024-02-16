import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SelectRateWidget extends StatelessWidget {
  const SelectRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 42.0,
      decoration: const BoxDecoration(
          color: ColorName.sliver,
          borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: const Row(
        children: [
          StarTypeWidget(index: 1, title: 'All',isAllType: true,),
          VerticalDividerWidget(),
          StarTypeWidget(index: 2, title: '2.0',),
          VerticalDividerWidget(),
          StarTypeWidget(index: 3, title: '3.0',),
          VerticalDividerWidget(),
          StarTypeWidget(index: 4, title: '4.0',),
          VerticalDividerWidget(),
          StarTypeWidget(index: 5, title: '5.0',),
        ],
      ),
    );
  }
}

class StarTypeWidget extends StatelessWidget {
  final int index;
  final String title;
  final bool isAllType;

  const StarTypeWidget({
    super.key,
    required this.index,
    required this.title,
    this.isAllType = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return isAllType
          ? Expanded(
              child: GestureDetector(
                onTap: ()=>HomeBloc.get.add(SetFilterDataEvent(rateTypeIndex: index)),
                child: Container(
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: index == state.rateIndex
                          ? ColorName.amber
                          : ColorName.sliver,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0))),
                  child: Center(
                    child: Text(
                      title,
                      style: easyTheme.textTheme.bodyMedium!.copyWith(
                          fontSize: 18.0,
                          color: ColorName.black.withOpacity(0.5)),
                    ),
                  ),
                ),
              ),
            )
          : Expanded(
              child: GestureDetector(
                onTap: ()=>HomeBloc.get.add(SetFilterDataEvent(rateTypeIndex: index)),
                child: Container(
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: index == state.rateIndex
                          ? ColorName.amber
                          : ColorName.sliver,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,
                            color: index == state.rateIndex
                                ? ColorName.white
                                : ColorName.amber),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          title,
                          style: easyTheme.textTheme.bodyMedium!.copyWith(
                              fontSize: 18.0,
                              color: ColorName.black.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.2,
      height: 25.0,
      color: ColorName.gray,
    );
  }
}
