import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapSearchSelectRate extends StatelessWidget {
  const SwapSearchSelectRate({super.key});

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
      child: Row(
        children: [
          SwapSearchStarType(
            index: FilterRate.ALL.index,
            title: 'All',
            isAllType: true,
          ),
          const SwapVerticalDividerWidget(),
          SwapSearchStarType(
            index: FilterRate.TOWSTARS.index,
            title: '2.0',
          ),
          const SwapVerticalDividerWidget(),
          SwapSearchStarType(
            index: FilterRate.THREESTARS.index,
            title: '3.0',
          ),
          const SwapVerticalDividerWidget(),
          SwapSearchStarType(
            index: FilterRate.FOURSTARS.index,
            title: '4.0',
          ),
          const SwapVerticalDividerWidget(),
          SwapSearchStarType(
            index: FilterRate.FIVESTARS.index,
            title: '5.0',
          ),
        ],
      ),
    );
  }
}

class SwapSearchStarType extends StatelessWidget {
  final int index;
  final String title;
  final bool isAllType;

  const SwapSearchStarType({
    super.key,
    required this.index,
    required this.title,
    this.isAllType = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwapFilterBloc, SwapFilterState>(
        builder: (context, state) {
      return isAllType
          ? Expanded(
              child: GestureDetector(
                onTap: () =>
                    SwapFilterBloc.get.add(SwapSetFilterDataEvent(rate: index)),
                child: Container(
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: index == state.rate
                          ? ColorName.amber
                          : ColorName.sliver,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0))),
                  child: Center(
                    child: Text(
                      title,
                      style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                          fontSize: 18.0,
                          color: ColorName.black.withOpacity(0.5)),
                    ),
                  ),
                ),
              ),
            )
          : Expanded(
              child: GestureDetector(
                onTap: () =>
                    SwapFilterBloc.get.add(SwapSetFilterDataEvent(rate: index)),
                child: Container(
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: index == state.rate
                          ? ColorName.amber
                          : ColorName.sliver,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,
                            color: index == state.rate
                                ? ColorName.white
                                : ColorName.amber),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          title,
                          style: context.easyTheme.textTheme.bodyMedium!
                              .copyWith(
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
