import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ViewAllDealsScreen extends StatelessWidget {
  const ViewAllDealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TrendDealsBloc, TrendDealsState>(
          builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const HomeAppBarWidget(),
            const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(context.locale.results_title,
                            style: context.easyTheme.textTheme.headlineMedium),
                      ),
                      GestureDetector(
                          onTap: () => openFilterScreen(context),
                          child: Assets.png.filterIcon
                              .image(width: 40, height: 40)),
                      const SizedBox(width: 11),
                      GestureDetector(
                        onTap: () => state.sortingType == SortingType.desc
                            ? TrendDealsBloc.get.add(GetItemsViewAllsEvent(
                                sortingType: SortingType.asc))
                            : TrendDealsBloc.get.add(GetItemsViewAllsEvent(
                                sortingType: SortingType.desc)),
                        child: Assets.svg.sortIcon.svg(width: 30, height: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.0),
                child: Row(
                  children: [],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () => openMoreInfoScreen(
                      context, state.trendDealListData[index]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 17.0, right: 17.0, top: 10),
                    child: SwapResultItemWidget(
                      trendDealsItem: state.trendDealListData[index],
                    ),
                  ),
                ),
                childCount: state.trendDealListData.length,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 30.0)),
            SliverToBoxAdapter(child: seeMoreHandler(state, context)),
            const SliverPadding(padding: EdgeInsets.only(top: 60.0)),
          ],
        );
      }),
    );
  }

  void onSeeMore() {
    TrendDealsBloc.get.add(GetItemsViewAllsEvent(isSeeMore: true));
  }

  void openMoreInfoScreen(BuildContext context, TrendDealsItem trendDealsItem) {
    Utils.openNavNewPage(
      context,
      SwapMoreInfoScreen(trendDealsItem: trendDealsItem),
    );
  }

  void openFilterScreen(BuildContext context) {
    Utils.openNavNewPage(context, ViewAllFilterScreen());
  }

  Widget seeMoreHandler(TrendDealsState state, BuildContext context) {
    switch (!state.isMoreDataItems) {
      case true:
        switch (state.swapTodayDealsStateStatus) {
          case SwapTodayDealsStateStatus.LOADINGMORE:
            return const CircularProgressIndicatorWidget();
          default:
            return Center(
                child: TextButtonWidget(
              text: context.locale.see_more_results_title,
              onPressed: () => onSeeMore(),
              isBold: true,
            ));
        }
      default:
        return state.swapTodayDealsStateStatus.isNull
            ? Center(
                child: Text(
                  context.locale.results_no_data,
                  style: context.easyTheme.textTheme.headlineMedium,
                ),
              )
            : const SizedBox();
    }
  }
}
